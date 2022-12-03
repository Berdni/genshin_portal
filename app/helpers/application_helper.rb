module ApplicationHelper
  def form_errors(errors)
    errors_message = errors.map(&:capitalize).join('. ')

    content_tag(:div, errors_message, class: 'field__error')
  end
end
