class RubyDictionary::Array < RubyDictionary::Klass
  #attr_accessor :definition, :url, :name, :description, :examples, :see_also, :return_statement, :test_desc, :callseq

  @@url = "https://ruby-doc.org/core-2.4.2/Array.html"
  @@all = []
  @@inst_methods = []
  @@klass_methods = []
  @callseq = []

  def self.all
    @@all
  end

  def self.klass_methods
    @@klass_methods
  end

  def self.inst_methods
    @@inst_methods
  end

  def self.url
    @@url
  end

#  def self.list_public_inst_methods
#    self.inst_methods.each{|m| puts m.name}
#  end
#
#  def self.list_public_klass_methods
#    self.klass_methods.each{|m| puts m.name}
#  end
#
#  def self.list_all_methods
#    self.all.each{|m| puts m.name}
#  end

end
