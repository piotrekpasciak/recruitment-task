module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: 'alert-success error-message',
      error: 'alert-danger error-message',
      alert: 'alert-danger error-message',
      notice: 'alert-info error-message' }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(*)
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "Alert alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def developer_dropdown_active?
    current_page?(developers_path) || current_page?(root_path) || current_page?(new_developer_path)
  end
end
