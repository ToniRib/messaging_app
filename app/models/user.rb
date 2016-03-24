class User < ActiveRecord::Base
  has_secure_password

  validates :username,   presence:   true,
                         uniqueness: true
  validates :email,      presence:   true,
                         uniqueness: true
  validates :first_name, presence: true
  validates :last_name,  presence: true

  has_many :conversations

  scope :all_except, -> (username) { User.where('username NOT LIKE ?', username) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
