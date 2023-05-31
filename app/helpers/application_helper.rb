module ApplicationHelper
  def style_for_status(status)
    case status
    when "accepted"
      return "btn btn-primary"
    when "refused"
      return "btn btn-danger"
    when "pending"
      return "btn btn-warning"
    end
  end
end
