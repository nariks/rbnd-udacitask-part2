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
    table :border => false do
      row :color => 'cyan' do
        column id, :width => 5, :align => 'center'
        column @description, :width => 25
        column 'due:', :width => 15
        column format_date(@due) + format_priority(@priority), :width => 40 
        # column , :width => 10
      end
    end
  end

end
