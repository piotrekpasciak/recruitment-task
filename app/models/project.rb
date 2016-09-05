class Project < ActiveRecord::Base
  belongs_to :developer

  validates :developer, presence: true
  validates :name, presence: true
  validates :description, presence: true

  validate :name_uniqueness_per_developer

  def name_uniqueness_per_developer
    unless Project.where(developer: self.developer, name: self.name).empty?
      errors.add(:name_uniqueness_per_developer, "- you have already project with this name.")
    end
  end
end
