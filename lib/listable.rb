module Listable
  def format_description(description)
    "#{description}".ljust(25)
  end

  def format_date (date1 = nil, date2 = nil)
    if !date1 && !date2
      date = "N/A"
    elsif !date2
      date = date1.strftime("%D")
    else
      date = date1.strftime("%D") + " -- " + date2.strftime("%D")
    end
  end

  def format_priority(priority)
    if priority == "high"
      value = " ⇧ ".colorize(:red)
    elsif priority == "medium"
      value = " ⇨".colorize(:yellow)
    elsif priority == "low"
      value = " ⇩".colorize(:green)
    else
      value = ""
    end
  end

end
