class Book < ActiveRecord::Base
  attr_accessible :description, :image_url, :lent_to_user_id, :owner_id, :title

  validates_presence_of :description, :title
end
