class UdaciList
  include UdaciListErrors
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type                    = type.downcase
    invalid_item_errmsg     = "Item type #{type} does not exist. Item type can only be todo, event or link."
    invalid_priority_errmsg = "Eligible priority values are high, medium or low. "

    raise InvalidItemTypeError, invalid_item_errmsg if !["todo", "event", "link"].include? type
    raise InvalidPriorityValueError, invalid_priority_errmsg if !["high", "medium", "low", nil].include? options[:priority]
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end

  def delete(index)
    if index <= @items.count
      @items.delete_at(index - 1)
    else
      raise IndexExceedsListSizeError, "Invalid delete index"
    end
  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
