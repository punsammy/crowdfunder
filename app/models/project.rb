class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date

  paginates_per 5
end
