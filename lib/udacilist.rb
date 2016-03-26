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

    #raise exceptions if type or prioruty value is not found
    raise UdaciListErrors::InvalidItemTypeError, 
            item_errmsg if !["todo", "event", "link"].include? type          
    raise UdaciListErrors::InvalidPriorityValueError, 
            priority_errmsg if !["high", "medium", "low", nil].include? options[:priority]

    #creates relevant class name based on type parameter and replaces the if statements
    class_name = Object.const_get(type.capitalize + 'Item')                  
    @items.push class_name.new(description, options)                         
  end

  #delete method which takes multiple item indexes as arguments for deletion
  def delete(*args)
    args.each_with_index do |position, index|
      if (position - index) <= @items.count
        @items.delete_at(position - index - 1)                            
      else
        raise UdaciListErrors::IndexExceedsListSizeError, "Invalid delete index"
      end
    end
  end

  #method to list all items in the list
  def all
    heading(@title)                         #heading method to create report header
    @items.each_with_index do |item, index|
      item.details(index + 1)               
    end
    puts
  end
    

  #method to list all items by a particular type
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

  #method to change priority status of a particular item
  def change_priority(description, priority)
    @items.each do |item|
      if item.description == description
        return item.priority = priority
      end
    end
    raise UdaciListErrors::InvalidItemError, "'#{description}' - No such item found"
  end



end
