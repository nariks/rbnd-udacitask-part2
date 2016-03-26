class EventItem
  include Listable
  include CommandLineReporter
  attr_reader :description, :start_date, :end_date

  def initialize(description, options={})
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
  end
  
  def details(id)

    date_txt = @end_date ? "event dates: " : "event date: "
    additional_info = format_date(@start_date, @end_date)

    table :border => false do
      row :color => 'magenta' do
        column_format(id, @description, "Event", date_txt, additional_info)     #method to print all item details in a column format
      end
    end
     
  end
end
