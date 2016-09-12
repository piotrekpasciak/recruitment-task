class DeveloperDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{first_name} #{last_name}"
  end

  def creation_date
    day = created_at.day < 10 ? '0' + created_at.day.to_s : created_at.day.to_s
    month = created_at.month < 10 ? '0' + created_at.month.to_s : created_at.month.to_s
    year = created_at.year.to_s

    day + '/' + month + '/' + year
  end
end
