class RubyDictionary::Array < RubyDictionary::Method
  attr_accessor :definition, :url

  @@url = "https://ruby-doc.org/core-2.4.2/Array.html"
  @@all = []

  def self.define_array
    doc = Nokogiri::HTML(open("http://ruby-doc.org/core-2.4.2/Array.html"))
    @definition = doc.css("div#description p").inner_html.gsub(/<code>|<\/code>/,"")
  end

  def self.list_public_instance_methods
    #RubyDictionary::SB.scrape_array
    #self.all.each{|m| print "#{m.name}   :   "}
    self.all.each{|m| puts m.name}
  end

  def self.array_menu
    puts self.define_array
    puts "\nEnter 'list' to see a list of public instance methods, or enter the name of a method to define, or enter 'menu' to go back"
    input = gets.strip.downcase
    case input
    when "list"
      self.list_public_instance_methods
    when "menu"
      self.list_data_types
      self.menu
    end
  end

  def self.all
    @@all
  end

  def self.url
    @@url
  end

end
