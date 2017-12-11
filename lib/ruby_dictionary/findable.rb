module Findable
  module ClassMethods
    def find_by_name(name)
      self.all.detect{|m| m.name == name}
    end
  end
end
