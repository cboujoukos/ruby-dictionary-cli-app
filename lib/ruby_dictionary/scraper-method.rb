require 'nokogiri'


class RubyDictionary::SB
  attr_accessor :name, :description, :examples, :see_also, :return_statement, :test_desc

  ### instance_methods = doc.css("#public-instance-method-details .method-callseq")
  ### instance_methods.first.inner_html.split("→ ")[0] selects everything before the return statement.
  ### method.name = m.inner_html.split("→ ")[0] # This causes problems for methods that have multiple ways of of being called like slice(index), slice(range), slice(regexp), etc
  ### method.name = "#{m["id"].split("-")[0]}!" #this causes problems methods that are stupidly classified as 2A 2A or 3D etc. (anything that comes before #bytes in the public method lists)

  def self.scrape_string
    string_methods = []
    puts "Welcome to strings!"
    doc = Nokogiri::HTML(open("http://ruby-doc.org/core-2.4.2/String.html"))
    #binding.pry
    public_instance_methods = doc.css("#public-instance-method-details .method-detail")
    #binding.pry

    public_instance_methods.each do |m|
      method = self.new
      #binding.pry
#      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
      #binding.pry
      case
      when m["id"].split("-")[0].match(/\d.+/) != nil
        method.name = m.css(".method-callseq").inner_html.split("→ ")[0].strip.gsub(/&lt;|&gt;/, '&lt;' => "<", '&gt;' => ">")
      when m["id"].split("-")[1] == "21"
        method.name = "#{m["id"].split("-")[0]}!"
      when m["id"].split("-")[1] == "3F"
        method.name = "#{m["id"].split("-")[0]}?"
      else
        method.name = m["id"].split("-")[0]
      end
      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
      method.examples = m.css("pre.ruby").inner_html.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/, "").strip.gsub(/&lt;|&gt;/, '&lt;' => "<", '&gt;' => ">")
      method.return_statement = m.css(".method-callseq").inner_html.split("→ ")[1]
      #method.test_desc = doc.xpath("//")


      string_methods << method
    end
    puts "we scraped strings!"
    binding.pry

  end

  def self.scrape_symbol
    symbol_methods = []
    doc = Nokogiri::HTML(open("https://ruby-doc.org/core-2.4.0/Symbol.html"))
    doc_text = doc.xpath("//text()").to_s
    #binding.pry
    public_instance_methods = doc.css("#public-instance-method-details .method-detail")
    #binding.pry

    public_instance_methods.each do |m|
      method = self.new
      #binding.pry
#      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
      #binding.pry
      case
      when m["id"].split("-")[0].match(/\d.+/) != nil
        method.name = m.css(".method-callseq").inner_html.split("→ ")[0].strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      when m["id"].split("-")[1] == "21"
        method.name = "#{m["id"].split("-")[0]}!"
      when m["id"].split("-")[1] == "3F"
        method.name = "#{m["id"].split("-")[0]}?"
      else
        method.name = m["id"].split("-")[0]
      end
      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
      method.examples = m.css("pre.ruby").inner_html.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/, "").strip.gsub(/&lt;|&gt;/, '&lt;' => "<", '&gt;' => ">")
      method.return_statement = m.css(".method-callseq").inner_html.split("→ ")[1]
      #method.test_desc = doc.xpath("//")


      symbol_methods << method
    end
    binding.pry
  end

  def self.scrape_number

  end

  def self.scrape_array
    array_methods = []
    doc = Nokogiri::HTML(open("https://ruby-doc.org/core-2.4.0/Array.html"))
    doc_text = doc.xpath("//text()").to_s
    #binding.pry
    public_instance_methods = doc.css("#public-instance-method-details .method-detail")
    #binding.pry

    public_instance_methods.each do |m|
      method = self.new
      #binding.pry
#      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
      #binding.pry
      case
      when m["id"].split("-")[0].match(/\d.+/) != nil
        method.name = m.css(".method-callseq").inner_html.split("→ ")[0].strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      when m["id"].split("-")[1] == "21"
        method.name = "#{m["id"].split("-")[0]}!"
      when m["id"].split("-")[1] == "3F"
        method.name = "#{m["id"].split("-")[0]}?"
      else
        method.name = m["id"].split("-")[0]
      end
      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
      method.examples = m.css("pre.ruby").inner_html.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/, "").strip.gsub(/&lt;|&gt;/, '&lt;' => "<", '&gt;' => ">")
      method.return_statement = m.css(".method-callseq").inner_html.split("→ ")[1]
      #method.test_desc = doc.xpath("//")


      array_methods << method
    end
    binding.pry

  end


  def self.scrape_hash

  end

  def self.scrape_enumerable

  end

end
