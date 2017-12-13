class RubyDictionary::Dir < RubyDictionary::Klass

  @@url = "https://ruby-doc.org/core-2.4.2/Dir.html"
  @@all = []
  @@inst_methods = []
  @@klass_methods = []
  @callseq = []

  def self.url
    @@url
  end

  def self.all
    @@all
  end

  def self.inst_methods
    @@inst_methods
  end

  def self.klass_methods
    @@klass_methods
  end

end
