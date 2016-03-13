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

    table :border => false do
      row :color => 'magenta' do
        column id, :width => 5, :align => 'center'
        column format_description(@description), :width => 25
        column date_txt + format_date(@start_date, @end_date), :width => 40
      end
    end
     
  end
end
