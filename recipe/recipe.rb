gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3', 
    database: 'cookbook.sqlite3'
)

class Recipe < ActiveRecord::Base

  field :name,        as: :string
  field :prep_time,   as: :integer
  field :description, as: :text
  field :image,       as: :text
 
end

at_exit do 
    ActiveRecord::Base.connection.close
end 

Recipe.auto_upgrade!