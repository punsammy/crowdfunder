class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  validates_presence_of :description, :dollar_amount

end
