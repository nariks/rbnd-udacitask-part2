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
        column id, :width => 5, :align => 'center'
        column format_description(@description), :width => 25
        column "site name: " + format_name, :width => 40
      end
    end
     
  end
end
