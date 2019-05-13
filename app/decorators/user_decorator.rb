module UserDecorator
  include ActionView::Helpers

  def role_badge
    return label_tag nil, "Admin", class: "badge badge-warning" if admin
    label_tag nil, "User", class: "badge badge-primary"
  end

  def status_badge
    return label_tag nil, "Activated", class: "badge badge-success" if activated
    label_tag nil, "Non Activated", class: "badge badge-dark"
  end
end
