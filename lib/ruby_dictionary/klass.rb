class Klass
  include Findable::InstanceMethods
  attr_accessor :name, :definition, :url, :method
  @@all = []

  def initialize(name=nil,definition=nil,url=nil)
    @name = name
    @definition = definition
    @url = url
    @klass_methods = []
    @inst_methods = []
    @all_methods = []
  end

  def definition
    @definition
  end

  def add_inst_method(method)
    method.klass = self unless method.klass != nil
    @inst_methods << method unless @inst_methods.include?(method)
  end

  def add_klass_method(method)
    method.klass = self unless method.klass != nil
    @klass_methods << method unless @klass_methods.include?(method)
  end

  def self.all
    @@all
  end

  def self.list
    @@all.each{|k| k.name}
  end

  def inst_methods
    @inst_methods
  end

  def klass_methods
    @klass_methods
  end

  def all_methods
    @all_methods
  end

  def list_inst_methods
    @all_methods.each{|m| puts m.name if m.method_type == "Instance"}
  end

  def list_klass_methods
    @all_methods.each{|m| puts m.name if m.method_type == "Class"}
  end

  def list_all_methods
    @all_methods.each{|m| puts m.name}
  end

  def clear_method_lists
    @inst_methods.clear
    @klass_methods.clear
    @all_methods.clear
  end


end
