class LinkItem
  include Listable
  include CommandLineReporter
  attr_reader :description, :site_name

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
  end
  
  def format_name
    @site_name ? @site_name : ""
  end

  def details(id)
    table :border => false do
      row :color => 'white' do
        column_format(id, @description, "Link", "site name", format_name)        #method to print all item details in a column format
      end
    end     
  end

end
