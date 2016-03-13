class UdaciList
  include UdaciListErrors
  include CommandLineReporter
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
    @items = []
  end

  def add(type, description, options={})
    type            = type.downcase
    item_errmsg     = "Item type can only be todo, event or link."
    priority_errmsg = "Eligible priority values are high, medium or low. "

    raise InvalidItemTypeError, item_errmsg if !["todo", "event", "link"].include? type
    raise InvalidPriorityValueError, priority_errmsg if !["high", "medium", "low", nil].include? options[:priority]

    class_name = Object.const_get(type.capitalize + 'Item')
    @items.push class_name.new(description, options)
    # @items.push TodoItem.new(description, options) if type == "todo"
    # @items.push EventItem.new(description, options) if type == "event"
    # @items.push LinkItem.new(description, options) if type == "link"
  end

  def delete(index)
    if index <= @items.count
      @items.delete_at(index - 1)
    else
      raise IndexExceedsListSizeError, "Invalid delete index"
    end
  end

  def all
    header :title => @title, :width => 70, :align => 'center', :rule => true,
           :color => 'green', :bold => true, :timestamp => false
    @items.each_with_index do |item, position|
      item.details(position + 1)
    end
    puts
  end
    

  def filter(type)
    # items_by_type = []
    # @@list_items.each do |item|
    #   if item.type == 
  end


end
