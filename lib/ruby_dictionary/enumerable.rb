class RubyDictionary::Enumerable < RubyDictionary::Method
  attr_accessor :definition, :url

  @@url = "https://ruby-doc.org/core-2.4.2/Enumerable.html"
  @@all = []

  def self.list_public_instance_methods
    self.all.each{|m| puts m.name}
  end

  def self.all
    @@all
  end

  def self.url
    @@url
  end

end
