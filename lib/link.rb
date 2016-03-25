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

  def details(id, options={})
    table :border => false do
      row :color => 'white' do
        column id, :width => 6, :align => 'center'
        column @description, :width => 25
        column "Link"
        column "site name: ", :width => 15
        column format_name, :width => 40
      end
    end     
  end

end
