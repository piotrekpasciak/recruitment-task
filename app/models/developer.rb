class Developer < ActiveRecord::Base
  has_many :projects, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
end
