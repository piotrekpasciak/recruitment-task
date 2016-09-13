class Language < ActiveRecord::Base
  has_many :projects_languages
  has_many :projects, through: :projects_languages

  validates :name, presence: true
end
