class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  accepts_nested_attributes_for :rewards
  validates :title, uniqueness: true
  validates_presence_of :description, :goal, :start_date, :end_date
  validates :goal, numericality: { greater_than: 0 }

  paginates_per 5


end
