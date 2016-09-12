class Language < ActiveRecord::Base
  has_many :projects, through: :projects_languages
end
