module ApplicationHelper

  def flash_helper(key)
    case key
    when "notice"
      "warning"
    when "success"
      "success"
    when "info"
      "info"
    else
      ""
    end
  end

  def pretty_time(time)
    time.strftime("%b %e, %Y | | %m:%M %p")
  end


end
