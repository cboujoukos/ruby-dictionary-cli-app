class RubyDictionary::Symbol < RubyDictionary::Klass
#  attr_accessor :definition, :url, :name, :description, :examples, :see_also, :return_statement, :test_desc, :callseq

  @@url = "https://ruby-doc.org/core-2.4.2/Symbol.html"
  @@all = []
  @@inst_methods = []
  @@klass_methods = []
  @callseq = []

  def self.all
    @@all
  end

  def self.inst_methods
    @@inst_methods
  end

  def self.klass_methods
    @@klass_methods
  end

  def self.url
    @@url
  end

end
