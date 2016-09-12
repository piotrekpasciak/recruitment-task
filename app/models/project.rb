class Project < ActiveRecord::Base
  has_many :votes
  has_many :languages, through: :projects_languages
  belongs_to :developer, counter_cache: true

  validates :developer, presence: true
  validates :name, presence: true, uniqueness: { scope: :developer,
                                                 message: 'Developers should have projects with unique names.' }
  validates :description, presence: true

  scope :count_and_average_votes, -> { select('projects.*, COUNT(distinct votes.id) AS votes_count, AVG(votes.value) AS votes_avg')
                                       .joins('LEFT JOIN votes ON projects.id = votes.project_id')
                                       .group('projects.id') }
end
