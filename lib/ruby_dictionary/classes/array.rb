class RubyDictionary::Array < RubyDictionary::Klass
  attr_accessor :definition, :url, :name, :description, :examples, :see_also, :return_statement, :test_desc, :callseq

  @@url = "https://ruby-doc.org/core-2.4.2/Array.html"
  @@all = []
  @@klass_methods = []

  def self.all
    @@all
  end

  def self.klass_methods
    @@klass_methods
  end

  def self.url
    @@url
  end

end
