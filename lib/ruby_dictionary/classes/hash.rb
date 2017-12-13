class RubyDictionary::Hash < RubyDictionary::Klass

  @@url = "https://ruby-doc.org/core-2.4.2/Hash.html"
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
