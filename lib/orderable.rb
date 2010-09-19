module Orderable
  def self.included(base)
    base.extend ActiveRecordAdditions
  end
  
  module ActiveRecordAdditions
    def orderable(options = {})
      allowed_attrs = options[:by] || {}
      default_attr  = options[:default] || allowed_attrs.first
      
      named_scope :order, lambda {
        |*attrs| do_order_by(attrs.shift, attrs.shift || {}, allowed_attrs, default_attr)
      }
    end
    
    
    private
    
      def do_order_by(attr_name, options, allowed_attrs, default_attr)
        attr_name, direction = attr_name.to_s.split('!')
        direction ||= "asc"
        
        unless allowed_attrs.include?(attr_name.to_sym)
          attr_name = default_attr.to_s
        end
        
        attr_name, association_name = attr_name.split('.').reverse
        unless association_name.nil?
          association_order(association_name, attr_name, direction, options)
        else
          {:order => sql_order_attribute(nil, nil, attr_name, direction, options)}
        end
      end
      
      def sql_order_attribute(join_alias, reflection, attr_name, direction, options)
        order_attribute = join_alias ? "#{join_alias}.#{attr_name}" : "#{attr_name}"
        
        unless options[:case_sensitive]
          # Certain database adapters fail if we try to use LOWER() on non-string values
          cols_hash = reflection ? reflection.klass.columns_hash : self.columns_hash
          if cols_hash[attr_name].type == :string
            order_attribute = "LOWER(#{order_attribute})"
          end
        end
        
        order_attribute += " #{direction}"
        order_attribute
      end
      
      def association_order(association_name, attr_name, direction, options)
        reflection = self.reflect_on_association(association_name.to_sym)
        join_table = reflection.quoted_table_name
        join_alias = reflection.table_name + "_join_for_order_by"

        if reflection.macro == :has_one
          fk_column = join_alias + "." + self.name.foreign_key
          pk_column = self.quoted_table_name + "." + get_primary_key(self.name)
        elsif reflection.macro == :belongs_to
          fk_column = self.quoted_table_name + "." + reflection.association_foreign_key
          pk_column = join_alias + "." + get_primary_key(reflection.klass.name)
        end
        
        joins = "LEFT JOIN #{join_table} #{join_alias} ON #{fk_column} = #{pk_column}"
        order = sql_order_attribute(join_alias, reflection, attr_name, direction, options)
        
        {:joins => joins, :order => order}
      end
  end
end