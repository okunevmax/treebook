class Status < ActiveRecord::Base
  attr_accessible :contet , :user_id
  belongs_to :user

  validates :contet, presence: true,
  			length: {minimum: 2}



  validates :user_id, presence: true
end
