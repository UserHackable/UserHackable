module ApplicationHelper
  def flash_alert_class key
    # success info warning danger
    puts "flash_alert_class: #{key.class.name} #{key.inspect}"
    case key
    when 'notice' then 'alert-info'
    when 'alert' then 'alert-success'
    else 'alert-success'
    end
  end
end
