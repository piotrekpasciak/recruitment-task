class Language < ActiveRecord::Base
  has_many :projects_languages, dependent: :destroy
  has_many :projects, through: :projects_languages

  validates :name, presence: true
end
