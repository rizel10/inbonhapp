class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # acts_as
  acts_as_paranoid

  # Mount Uploader
  mount_uploader :avatar, AvatarUploader

  # Includes
  include Authenticatable

  # Validations
  validates :email, presence: true, uniqueness: true
  validates_presence_of :encrypted_password
  validates_presence_of :nickname
  validates_presence_of :avatar

  # Instance methods
  def to_s
    nickname
  end

end
