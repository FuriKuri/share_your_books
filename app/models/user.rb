class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  validates_presence_of :email, :name, :password
  validates_length_of :name, :within => 3..40
  validates_length_of :password, :within => 5..40
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
end
