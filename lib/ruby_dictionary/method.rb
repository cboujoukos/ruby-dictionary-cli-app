class RubyDictionary::Method
  include Findable::InstanceMethods
  attr_accessor :name, :callseq, :description, :examples, :method_type, :klass
  @@all = []

  def initialize(name=nil,callseq=nil,description=nil,examples=nil,method_type=nil, klass_name=nil, klass=nil)
    @name = name
    @callseq = callseq
    @description = description
    @examples = examples
    @method_type = method_type
    @klass_name = klass_name
    @klass = klass
    #self.klass=(klass_name) unless klass_name == nil

  end

#  def klass=(klass)
#    binding.pry
#    @klass = klass
#    if self.method_type == "Class"
#      klass.add_klass_method(self)
#    else
#      klass.add_inst_method(self)
#    end
#  end

end
