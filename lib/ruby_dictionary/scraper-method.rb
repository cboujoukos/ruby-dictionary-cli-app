require 'nokogiri'


class RubyDictionary::SB


  ### instance_methods = doc.css("#public-instance-method-details .method-callseq")
  ### instance_methods.first.inner_html.split("→ ")[0] selects everything before the return statement.
  ### method.name = m.inner_html.split("→ ")[0] # This causes problems for methods that have multiple ways of of being called like slice(index), slice(range), slice(regexp), etc
  ### method.name = "#{m["id"].split("-")[0]}!" #this causes problems methods that are stupidly classified as 2A 2A or 3D etc. (anything that comes before #bytes in the public method lists)
####This would have been a way easier way to access names
  def self.scrape_names(klass, method_url)
    doc = Nokogiri::HTML(open(method_url))
    public_instance_method_names = doc.css("#method-list-section ul.link-list li")
    public_instance_method_names.each do |mn|
      method = klass.new
      method.name = mn.css("a").inner_html.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      klass.all << method  if mn.css("a").inner_html.start_with?("#")
    end
    public_instance_methods = doc.css("#public-instance-method-details .method-detail")
    i=0
    public_instance_methods.each do |m|

      #method = klass.new

#      case
#      when m["id"].split("-")[0].match(/\d.+/) != nil
#        method.name = m.css(".method-callseq").inner_html.split("→ #")[0].strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' #=> "&").gsub(/\s+/, "")
#      when m["id"].split("-")[1] == "21"
#        method.name = "#{m["id"].split("-")[0]}!".gsub(/\s+/, "")
#      when m["id"].split("-")[1] == "3F"
#        method.name = "#{m["id"].split("-")[0]}?".gsub(/\s+/, "")
#      else
#        method.name = m["id"].split("-")[0].gsub(/\s+/, "")
#      end
      #binding.pry
      klass.all[i].description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      klass.all[i].examples = m.css("pre.ruby").inner_html.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/, "").strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      klass.all[i].return_statement = m.css(".method-callseq").inner_html.split("→ ")[1]
      call_sequence = []
      if m.css(".method-heading").length == 1
        call_sequence << m.css(".method-callseq").inner_html.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      else
        m.css(".method-heading").each do |variant|
          call_sequence << variant.css(".method-callseq").inner_html
        end
      end
      klass.all[i].callseq = call_sequence
      #method.test_desc = doc.xpath("//")
      i = i+1
      #binding.pry
    end
    #binding.pry
  end

  def self.scrape(klass, method_url)

    doc = Nokogiri::HTML(open(method_url))
    #binding.pry
    public_instance_methods = doc.css("#public-instance-method-details .method-detail")

    public_instance_methods.each do |m|
      method = klass.new

      case
      when m["id"].split("-")[0].match(/\d.+/) != nil
        method.name = m.css(".method-callseq").inner_html.split("→ ")[0].strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&").gsub(/\s+/, "")
      when m["id"].split("-")[1] == "21"
        method.name = "#{m["id"].split("-")[0]}!".gsub(/\s+/, "")
      when m["id"].split("-")[1] == "3F"
        method.name = "#{m["id"].split("-")[0]}?".gsub(/\s+/, "")
      else
        method.name = m["id"].split("-")[0].gsub(/\s+/, "")
      end
      method.description = m.css(".method-heading + div p").inner_html.gsub(/<.{2,5}>|\n/,"").strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      method.examples = m.css("pre.ruby").inner_html.gsub(/<span class=\"ruby-.{1,12}>|<\/span>/, "").strip.gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
      method.return_statement = m.css(".method-callseq").inner_html.split("→ ")[1]
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
#    public_instance_method_names = doc.css("#method-list-section ul.link-list li")
#    public_instance_method_names.each do |mn|
#      klass.all[i].name = mn.css("a").inner_html.gsub(/&lt;|&gt;|&amp;/, '&lt;' => #"<", '&gt;' => ">", '&amp;' => "&")
#      klass.all << method  if mn.css("a").inner_html.start_with?("#")
#
#    end
  end
end
