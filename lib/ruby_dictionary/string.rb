class RubyDictionary::String
  attr_accessor :definition

  @@all = []

  def self.define_string
    doc = Nokogiri::HTML(open("http://ruby-doc.org/core-2.4.2/String.html"))
    @definition = doc.css("div#description p").inner_html.gsub(/<code>|<\/code>/,"")
  end

  def self.list_public_instance_methods
    #RubyDictionary::SB.scrape_string
    #self.all.each{|m| print "#{m.name}   :   "}
    self.all.each{|m| puts m.name}
  end

  def self.all
    @@all
  end

end
