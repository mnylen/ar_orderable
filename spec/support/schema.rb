ActiveRecord::Schema.define do
  create_table :developers, :force => true do |t|
    t.string :name
    t.timestamps
  end
  
  create_table :games, :force => true do |t|
    t.string :name
    t.references :developer
    t.timestamps
  end
end