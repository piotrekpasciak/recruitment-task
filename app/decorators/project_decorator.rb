class ProjectDecorator < Draper::Decorator
  delegate_all

  # N+1 query generator
  def current_user_voted?
    votes.where(user: h.current_user).any?
  end

  # N+1 query generator
  def current_user_vote
    votes.find_by(user: h.current_user)
  end

  # N+1 query generator
  def avg_vote
    count = votes.count
    average = votes.average(:value)

    if average.nil?
      'None'
    else
      average.to_s + ' (Votes: ' + count.to_s + ')'
    end
  end
end
