class RubyDictionary::Array < RubyDictionary::Method
  attr_accessor :definition, :url

  @@url = "https://ruby-doc.org/core-2.4.2/Array.html"
  @@all = []

  def self.list_public_instance_methods
    #RubyDictionary::SB.scrape_array
    #self.all.each{|m| print "#{m.name}   :   "}
    self.all.each{|m| puts m.name}
  end

  def self.all
    @@all
  end

  def self.url
    @@url
  end

end
