class Book < ActiveRecord::Base
  attr_accessible :description, :image_url, :lent_to_user_id, :owner_id, :title

  validates_presence_of :description, :title, :image_url, :owner_id, :lent_to_user_id

  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)$}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }

  before_validation :set_default_image

  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
  belongs_to :lent_to, :class_name => 'User', :foreign_key => 'lent_to_user_id'

  private
  def set_default_image
    if !self.image_url or self.image_url.empty?
      self.image_url = 'no_image.png'
    end
  end
end
