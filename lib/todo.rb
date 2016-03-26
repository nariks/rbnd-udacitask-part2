class TodoItem
  include Listable
  include CommandLineReporter
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end
  
  def details(id)
    additional_info = format_date(@due) + format_priority(@priority)

    table :border => false do
      row :color => 'cyan' do
        column_format(id, @description, "Todo", "due", additional_info)         #method to print all item details in a column format
      end
    end
  end

  def change_priority(priority)
    @priority = priority
  end


end
