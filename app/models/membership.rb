class Membership < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user
  validates :meetup, presence: true
  validates :user, presence: true
end
