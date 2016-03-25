class UdaciList
  include Listable
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
    @items = []
  end

  def add(type, description, options={})
   
    type            = type.downcase
    item_errmsg     = "Item type can only be todo, event or link."
    priority_errmsg = "Eligible priority values are high, medium or low. "

    raise UdaciListErrors::InvalidItemTypeError, 
            item_errmsg if !["todo", "event", "link"].include? type
    raise UdaciListErrors::InvalidPriorityValueError, 
            priority_errmsg if !["high", "medium", "low", nil].include? options[:priority]

    class_name = Object.const_get(type.capitalize + 'Item')             #creates relevant class name based on type param
    @items.push class_name.new(description, options)                    #replaces the if loops logic
  end

  def delete(index)

    if index <= @items.count
      @items.delete_at(index - 1)
    else
      raise UdaciListErrors::IndexExceedsListSizeError, "Invalid delete index"
    end
  end

  def all
    
    heading(@title)
    @items.each_with_index do |item, position|
      item.details(position + 1)
    end
    puts
  end
    

  def filter(type)

    count = false
    heading(@title + ' filtered by ' + type)
    @items.each_with_index do |item, index|
      if item.class.to_s.chomp('Item') == type.capitalize
        item.details(index + 1)
        count = true
      end
    end
    puts "     No items of #{type} type found".bold  if !count 
  end

  def change_priority(description, priority)
    @items.each do |item|
      if item.description == description
        puts item.priority
        return item.change_priority(priority)
      end
    end
    raise UdaciListErrors::InvalidItemError, "'#{description}' - No such item found"
  end



end
