require 'nokogiri'


class RubyDictionary::SB


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
