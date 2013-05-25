class Status < ActiveRecord::Base
  attr_accessible :contet , :user_id
  belongs_to :user
end
