require 'nokogiri'


class RubyDictionary::SB
#  attr_accessor :name, :description, :examples, :see_also, :return_statement, :test_desc, :callseq

#  enumerable_url = "https://ruby-doc.org/core-2.4.2/Enumerable.html"
#  string_url = "https://ruby-doc.org/core-2.4.2/String.html"
#  symbol_url = "https://ruby-doc.org/core-2.4.2/Symbol.html"
#  numeric_url = "https://ruby-doc.org/core-2.4.2/Numeric.html"
#  array_url = "https://ruby-doc.org/core-2.4.2/Array.html"
#  hash_url = "https://ruby-doc.org/core-2.4.2/Hash.html"


  ### instance_methods = doc.css("#public-instance-method-details .method-callseq")
  ### instance_methods.first.inner_html.split("→ ")[0] selects everything before the return statement.
  ### method.name = m.inner_html.split("→ ")[0] # This causes problems for methods that have multiple ways of of being called like slice(index), slice(range), slice(regexp), etc
  ### method.name = "#{m["id"].split("-")[0]}!" #this causes problems methods that are stupidly classified as 2A 2A or 3D etc. (anything that comes before #bytes in the public method lists)

  def self.scrape(klass, method_url)

    doc = Nokogiri::HTML(open(method_url))
    #binding.pry
    public_instance_methods = doc.css("#public-instance-method-details .method-detail")

    public_instance_methods.each do |m|
      method = klass.new
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
      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      method.examples = m.css("pre.ruby").inner_html.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/, "").strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      method.return_statement = m.css(".method-callseq").inner_html.split("→ ")[1]
      #binding.pry
      call_sequence = []
      if m.css(".method-heading").length == 1
        call_sequence << m.css(".method-callseq").inner_html.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      else
        m.css(".method-heading").each do |variant|
          call_sequence << variant.css(".method-callseq").inner_html
        end
      end
      method.callseq = call_sequence
      #method.test_desc = doc.xpath("//")
      klass.all << method
    end
  end
end

#  def self.scrape_symbol
#    symbol_methods = []
#    doc = Nokogiri::HTML(open("https://ruby-doc.org/core-2.4.2/Symbol.html"))
#    doc_text = doc.xpath("//text()").to_s
#    public_instance_methods = doc.css("#public-instance-method-details .method-detail")
#    #binding.pry
#
#    public_instance_methods.each do |m|
#      method = self.new
#      #binding.pry
##      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
#      case
#      when m["id"].split("-")[0].match(/\d.+/) != nil
#        method.name = m.css(".method-callseq").inner_html.split("→ ")[0].strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' #=> "&")
#      when m["id"].split("-")[1] == "21"
#        method.name = "#{m["id"].split("-")[0]}!"
#      when m["id"].split("-")[1] == "3F"
#        method.name = "#{m["id"].split("-")[0]}?"
#      else
#        method.name = m["id"].split("-")[0]
#      end
#      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
#      method.examples = m.css("pre.ruby").inner_html.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/, "").strip.gsub(/&lt;|&gt;/, '&lt;' => "<", #'&gt;' => ">")
#      method.return_statement = m.css(".method-callseq").inner_html.split("→ ")[1]
#      #method.test_desc = doc.xpath("//")
#
#
#      symbol_methods << method
#    end
#    binding.pry
#  end
#
#  def self.scrape_numeric
#    doc = Nokogiri::HTML(open("https://ruby-doc.org/core-2.4.2/Numeric.html"))
#    doc_text = doc.xpath("//text()").to_s
#    public_instance_methods = doc.css("#public-instance-method-details .method-detail")
#    #binding.pry
#
#    public_instance_methods.each do |m|
#      method = self.new
#      #binding.pry
##      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
#      case
#      when m["id"].split("-")[0].match(/\d.+/) != nil
#        method.name = m.css(".method-callseq").inner_html.split("→ ")[0].strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' #=> "&")
#      when m["id"].split("-")[1] == "21"
#        method.name = "#{m["id"].split("-")[0]}!"
#      when m["id"].split("-")[1] == "3F"
#        method.name = "#{m["id"].split("-")[0]}?"
#      else
#        method.name = m["id"].split("-")[0]
#      end
#      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
#      method.examples = m.css("pre.ruby").inner_html.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/, "").strip.gsub(/&lt;|&gt;/, '&lt;' => "<", #'&gt;' => ">")
#      method.return_statement = m.css(".method-callseq").inner_html.split("→ ")[1]
#
#      RubyDictionary::Numeric.all << method
#    end
#    binding.pry
#  end
#
#  def self.scrape_array
#    array_methods = []
#    doc = Nokogiri::HTML(open("https://ruby-doc.org/core-2.4.2/Array.html"))
#    doc_text = doc.xpath("//text()").to_s
#    #binding.pry
#    public_instance_methods = doc.css("#public-instance-method-details .method-detail")
#    #binding.pry
#
#    public_instance_methods.each do |m|
#      method = self.new
#      #binding.pry
##      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
#      #binding.pry
#      case
#      when m["id"].split("-")[0].match(/\d.+/) != nil
#        method.name = m.css(".method-callseq").inner_html.split("→ ")[0].strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' #=> "&")
#      when m["id"].split("-")[1] == "21"
#        method.name = "#{m["id"].split("-")[0]}!"
#      when m["id"].split("-")[1] == "3F"
#        method.name = "#{m["id"].split("-")[0]}?"
#      else
#        method.name = m["id"].split("-")[0]
#      end
#      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
#      method.examples = m.css("pre.ruby").inner_html.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/, "").strip.gsub(/&lt;|&gt;/, '&lt;' => "<", #'&gt;' => ">")
#      method.return_statement = m.css(".method-callseq").inner_html.split("→ ")[1]
#      #method.test_desc = doc.xpath("//")
#
#
#      array_methods << method
#    end
#    binding.pry
#
#  end
#
#
#  def self.scrape_hash
#
#  end
#
#  def self.scrape_enumerable
#    doc = Nokogiri::HTML(open("https://ruby-doc.org/core-2.4.2/Enumerable.html"))
#    doc_text = doc.xpath("//text()").to_s
#    public_instance_methods = doc.css("#public-instance-method-details .method-detail")
#    #binding.pry
#
#    public_instance_methods.each do |m|
#      method = self.new
#      #binding.pry
##      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
#      case
#      when m["id"].split("-")[0].match(/\d.+/) != nil
#        method.name = m.css(".method-callseq").inner_html.split("→ ")[0].strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' #=> "&")
#      when m["id"].split("-")[1] == "21"
#        method.name = "#{m["id"].split("-")[0]}!"
#      when m["id"].split("-")[1] == "3F"
#        method.name = "#{m["id"].split("-")[0]}?"
#      else
#        method.name = m["id"].split("-")[0]
#      end
#      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip
#      method.examples = m.css("pre.ruby").inner_html.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/, "").strip.gsub(/&lt;|&gt;/, '&lt;' => "<", #'&gt;' => ">")
#      method.return_statement = m.css(".method-callseq").inner_html.split("→ ")[1]
#
#      RubyDictionary::Enumerable.all << method
#    end
#  end
