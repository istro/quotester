class Group < ActiveRecord::Base
  has_many :quotes, order: 'text asc'
end
