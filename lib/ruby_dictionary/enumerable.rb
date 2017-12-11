class RubyDictionary::Enumerable < RubyDictionary::Method
  attr_accessor :url
  

  def self.define_enumerable
    doc = Nokogiri::HTML(open("http://ruby-doc.org/core-2.4.2/Enumerable.html"))
    @definition = doc.css("div#description p").inner_html.gsub(/<code>|<\/code>/,"").gsub(/&lt;|&gt;/, '&lt;' => "<", '&gt;' => ">")
  end
end
