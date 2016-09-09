class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user, presence: true
  validates :project, presence: true, uniqueness: { scope: :user_id,
                                                    message: 'There is only one vote allowed per project.' }
  validates :value, presence: true, inclusion: 1..6
end
