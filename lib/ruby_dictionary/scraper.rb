require 'nokogiri'
require 'uri'
require 'pry'

class RubyDictionary::Scraper

  def self.scrape_index
    doc = Nokogiri::HTML(open("http://ruby-doc.org/core-2.4.2/"))
    klass_list = doc.css("#class-index .entries p")
    klass_list.each do |k|
      if k.css("a").text.match(/(Array\b|Dir\b|Enumerable|Hash|Numeric|Proc\b|Range\b|String|Symbol)/) != nil
        klass = RubyDictionary::Klass.new
        klass.name = k.css("a").text.gsub(/"/,"")
        href = k.css("a")[0]["href"]
        page_url = "http://ruby-doc.org/core-2.4.2/"
        klass.url = URI.join(page_url,href)
        RubyDictionary::Klass.all << klass
      end
    end
  end

  def self.scrape_klass(klass)
    self.scrape_method_names(klass)
    self.scrape_instance_method_bodies(klass)
    self.scrape_klass_method_bodies(klass)
  end

  def self.scrape_method_names(klass)
    doc = Nokogiri::HTML(open(klass.url))
    klass.definition = doc.css("div#description p:first-child, div#description p:nth-child(2)").text
    #.gsub(/<span.{1,25}>|<\/span>/,"").gsub(/<code>|<\/code>/,"").gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
    method_list = doc.css("#method-list-section ul.link-list li")

    method_list.each do |mn|
      method = RubyDictionary::Method.new
      if mn.css("a").text.start_with?(":")
        method.method_type = "Class"
        klass.add_klass_method(method)
      else
        method.method_type = "Instance"
        klass.add_inst_method(method)
      end
      method.klass = klass
      method.name = mn.css("a").text.gsub(/#/,"")
      #.gsub(/&lt;|&gt;|&amp;|#/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&", '#' => "")
      klass.all_methods << method
    end
  end
####################################################################################
  def self.scrape_instance_method_bodies(klass)
    doc = Nokogiri::HTML(open(klass.url))
    i=0
    #if method.method_type == "Instance"
    public_instance_methods = doc.css("div#public-instance-method-details.method-section .method-detail")
    public_instance_methods.each do |m|

      klass.inst_methods[i].description = m.css(".method-heading + div p").text
      #.gsub(/<.{2,5}>|\n/,"").strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' =>">", '&amp;' => "&")
      klass.inst_methods[i].examples = m.css("pre.ruby").text
      #.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/,"").strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")

      call_sequence = []
      if m.css(".method-heading").length == 1
          call_sequence << m.css(".method-callseq").text
          #.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<",'&gt;' => ">", '&amp;' => "&")
      else
        m.css(".method-heading").each do |variant|
          call_sequence << variant.css(".method-callseq").text
        end
      end
      klass.inst_methods[i].callseq = call_sequence
      i+=1
    end

  end

  def self.scrape_klass_method_bodies(klass)
    doc = Nokogiri::HTML(open(klass.url))
    public_klass_methods = doc.css("div#public-class-method-details.method-section .method-detail")
    i=0
    public_klass_methods.each do |m|

      klass.klass_methods[i].description = m.css(".method-heading + div p").text
      #.gsub(/<.{2,5}>|\n/,"").strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' =>">", '&amp;' => "&")
      klass.klass_methods[i].examples = m.css("pre.ruby").text.strip
      #.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/,"").strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      call_sequence = []
      if m.css(".method-heading").length == 1
        call_sequence << m.css(".method-callseq").text
        #.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<",'&gt;' => ">", '&amp;' => "&")
      else
        m.css(".method-heading").each do |variant|
          call_sequence << variant.css(".method-callseq").text
        end
      end
      klass.klass_methods[i].callseq = call_sequence
      i+=1
    end
  end
end
