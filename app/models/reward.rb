class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  validates_presence_of :description, :dollar_amount
  validates :dollar_amount, numericality: { :greater_than => 0 }

end
