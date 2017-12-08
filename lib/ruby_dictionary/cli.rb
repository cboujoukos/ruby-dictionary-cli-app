# CLI Controller

class RubyDictionary::CLI

  def call
    puts "Welcome to the Ruby Dictionary"
    list_data_types
    menu
  end

  def list_data_types
    data_types = ["Booleans", "Symbols", "Numbers", "Arrays", "Hashes"]
    puts data_types
  end

  def menu
    puts "Which data type would you like to explore?"
  end

end
