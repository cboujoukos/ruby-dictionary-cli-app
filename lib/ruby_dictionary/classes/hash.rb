class RubyDictionary::Hash < RubyDictionary::Method
  attr_accessor :definition, :url, :name, :description, :examples, :see_also, :return_statement, :test_desc, :callseq

  @@url = "https://ruby-doc.org/core-2.4.2/Hash.html"
  @@all = []

  def initialize(name=nil,description=nil,examples=nil,return_statement=nil)
    @name = name
    @description = description
    @examples = examples
    @return_statement = return_statement
  end

  def self.all
    @@all
  end

  def self.url
    @@url
  end

end