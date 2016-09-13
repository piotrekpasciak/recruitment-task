class UserDecorator < Draper::Decorator
  delegate_all

  def role
    admin ? 'Administrator' : 'User'
  end
end
