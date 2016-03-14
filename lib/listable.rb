module Listable
  # format_description method removed as command line reporter takes care of formatting the text


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
      value = " ⇧ ".red 
    elsif priority == "medium"
      value = " ⇨ ".yellow 
    elsif priority == "low"
      value = " ⇩ ".green 
    else
      value = " "
    end
  end

  # def details(id, type_id)

  #   date_txt = @end_date ? "event dates: " : "event date: "
  #   color = {:todo => 'cyan', :event => 'magenta', :url => 'white']

  #   table :border => false do
  #     row :color => color[type] do
  #       column id, :width => 5, :align => 'center'
  #       column format_description(@description), :width => 25
  #       column format_details
        
  #     end
  #   end
  # end

  # def format_details(start_date, end_date)

  #   if type_id == 'todo'
  #     'due: ' + format_date(@due) + format_priority(@priority), :width => 40 
  #   elsif type_id == 'event'
  #     date_txt + format_date(@start_date, @end_date), :width => 40
  #   elsif type_id == 'url'
  #     column "site name: " + format_name, :width => 40
  #   end

     

end
