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
    return date
  end


  #   date1 ? date1.strftime("%D") : "No due date"
  # end

  # def format_date
  #   dates = @start_date.strftime("%D") if @start_date
  #   dates << " -- " + @end_date.strftime("%D") if @end_date
  #   dates = "N/A" if !dates
  #   return dates
  # end
  
end
