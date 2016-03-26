module Listable
  include CommandLineReporter
  
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

  #method to create a header for the report 
  def heading(title)

    header :title => title, :width => 86, :align => 'center', :rule => true,
           :color => 'green', :bold => true, :timestamp => true

    table :border => true do
      row :color => :green do
        column 'No.', :width => 3
        column 'Description', :width => 22
        column 'Type', :width => 8
        column 'Additional Info', :width => 40, :align => 'center'
      end
    end
  end

#method for performing some column formatting which is common for all item classes. 
def column_format(id, description, type, additional1, additional2)
  column id, :width => 6, :align => 'center'      #displays the item number
  column description, :width => 25                #displays item description
  column type                                     #displays item type
  column additional1, :width => 15                #displays additional description+
  column additional2, :width => 40                #displays additional info details
end
  

end
