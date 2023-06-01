module ApplicationHelper
  def style_for_status(status)
    case status
    when "accepted"
      return "btn btn-primary m-1"
    when "refused"
      return "btn btn-danger m-1"
    when "pending"
      return "btn btn-warning m-1"
    end
  end
end
