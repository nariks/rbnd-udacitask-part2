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

    class_name = Object.const_get(type.capitalize + 'Item')             #creates relevant class name based on type param
    @items.push class_name.new(description, options)                    #replaces the if loops logic
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
           :color => 'green', :bold => true, :timestamp => true
    @items.each_with_index do |item, position|
      item.details(position + 1)
    end
    puts
  end
    

  def filter(type)

    header :title => @title + ' filtered by ' + type, :width => 70, :align => 'center', :rule => true,
           :color => 'green', :bold => true, :timestamp => true
            

    # items_by_type = []
    @items.each_with_index do |item, index|
      if item.class.to_s.chomp('Item') == type.capitalize
        item.details(index + 1)
      end
    end
  end


end
