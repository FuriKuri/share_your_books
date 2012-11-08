class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  validates_length_of :name, :within => 3..40
  validates_length_of :password, :within => 5..40
  has_secure_password

  has_many  :owner_books, :class_name => 'Book', :foreign_key => 'owner_id'
  has_many  :lent_to_books, :class_name => 'Book', :foreign_key => 'lent_to_user_id'
end
