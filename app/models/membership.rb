class Membership < ActiveRecord::Base
  belongs_to :meetups
  belongs_to :users
end
