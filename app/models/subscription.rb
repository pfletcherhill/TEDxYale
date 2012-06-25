class Subscription < ActiveRecord::Base
  validates :name, :presence => true
	validates :email, :presence => true
	validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
end

