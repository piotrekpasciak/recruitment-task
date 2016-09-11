class Project < ActiveRecord::Base
  has_many :votes
  belongs_to :developer, counter_cache: true

  validates :developer, presence: true
  validates :name, presence: true, uniqueness: { scope: :developer,
                                                 message: 'Developers should have projects with unique names.' }
  validates :description, presence: true
end
