class Quote < ActiveRecord::Base
  default_scope { order 'text ASC' }
  belongs_to :group
end
