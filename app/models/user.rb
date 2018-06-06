class User < ApplicationRecord
  validates :email, presence: true

  has_many :photos
  def full_name
	"#{first_name.capitalize} #{last_name.upcase}"
  end
end
