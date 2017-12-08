require 'nokogiri'


class RubyDictionary::Method
  attr_accessor :name, :description, :examples, :see_also, :return_statement

  ### instance_methods = doc.css("#public-instance-method-details .method-callseq")
  ### instance_methods.first.inner_html.split("→ ")[0] selects everything before the return statement.

  def self.scrape_string
    string_methods = []
    puts "Welcome to strings!"
    doc = Nokogiri::HTML(open("http://ruby-doc.org/core-2.4.2/String.html"))
    #binding.pry
    instance_methods = doc.css("#public-instance-method-details .method-detail")
    #binding.pry

    instance_methods.each do |m|
      method = self.new
      #method.name = m..inner_html.split("→ ")[0] # This causes problems for methods that have multiple ways of of being called like slice(index), slice(range), slice(regexp), etc
      method.name = m["id"].split("-")[0] #this causes problems methods that are stupidly classified as 2A 2A or 3D etc. (anything that comes before #bytes in the public method lists)
      string_methods << method
    end
    puts "we scraped strings!"
    binding.pry

  end

  def self.scrape_symbol

  end

  def self.scrape_number

  end

  def self.scrape_array

  end

  def self.scrape_hash

  end

  def self.scrape_enumerable

  end

end
