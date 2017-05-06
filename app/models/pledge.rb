class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :reward
  has_one :project, through: :reward

  validate :enough_pledged

  def enough_pledged
    unless self.dollar_amount >= reward.dollar_amount
      self.errors.add(:dollar_amount, "Amount pledged must be at least $#{reward.dollar_amount}")
    end
  end
end
