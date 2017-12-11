class RubyDictionary::Method
  extend Findable::ClassMethods
  attr_reader :definition

  @@all = []

  def self.list_public_instance_methods
    #RubyDictionary::SB.scrape_string
    #self.all.each{|m| print "#{m.name}   :   "}
    self.all.each{|m| puts m.name}
  end

  def self.all
    @@all
  end

  def self.list_data_types
    @data_types = ["1. Enumerables", "2. Strings", "3. Symbols", "4. Numeric", "5. Arrays", "6. Hashes"]
    puts @data_types
  end

  def method_menu

  end

end
