class RubyDictionary::Numeric < RubyDictionary::Method

  def self.define_numeric
    doc = Nokogiri::HTML(open("http://ruby-doc.org/core-2.4.2/Numeric.html"))
    @definition = doc.css("div#description p").inner_html.gsub(/<code>|<\/code>/,"").gsub(/&lt;|&gt;/, '&lt;' => "<", '&gt;' => ">")
  end
end
