require 'nokogiri'


class RubyDictionary::Scraper

  ### instance_methods.first.inner_html.split("→ ")[0] selects everything before the return statement.

  def self.scrape_string
    puts "Welcome to strings!"
    doc = Nokogiri::HTML(open("http://ruby-doc.org/core-2.4.2/String.html"))
    instance_methods = doc.css("#public-instance-method-details .method-callseq")
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
