ActiveRecord::Schema.define do
  create_table :developers do |t|
    t.string :name
    t.timestamps
  end
  
  create_table :games do |t|
    t.string :name
    t.references :developers
    t.timestamps
  end
end