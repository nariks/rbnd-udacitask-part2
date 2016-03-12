class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date

  def initialize(description, options={})
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
  end
  
  def details
    date_txt = @end_date ? "event dates: " : "event date: "
    format_description(@description) + date_txt + format_date(@start_date, @end_date)
  end
end
