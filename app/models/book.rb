class Book < ActiveRecord::Base
  attr_accessible :description, :image_url, :lent_to_user_id, :owner_id, :title

  validates_presence_of :description, :title

  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)$}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
