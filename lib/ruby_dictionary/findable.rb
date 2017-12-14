module Findable
  module InstanceMethods
    def find_by_name(name)
      self.all_methods.detect{|m| m.name == name}
    end
  end
end
