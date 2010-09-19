Spec::Matchers.define :be_in_order do |attr_name|
  match do |results|
    ret_val = true
    previous = nil
    results.each do |result|
      unless previous.nil?
        unless attr_value(result, attr_name) >= attr_value(previous, attr_name)
          ret_val = false
          break
        end
      end
      
      previous = result
    end
    
    ret_val
  end
end

def attr_value(obj, attr_name)
  current = obj
  
  attr_name.to_s.split('.').each do |name|
    current = current.send(name.to_sym)
  end
  
  current
end