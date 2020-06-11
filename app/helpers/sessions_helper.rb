module SessionsHelper
  def flash_info(alert)
    content_tag :p, flash[:alert], :style => "color: red" if alert
  end
end
