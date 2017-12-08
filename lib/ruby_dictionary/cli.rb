# CLI Controller

class RubyDictionary::CLI

  def call
    list_data_types
    menu
  end

  def list_data_types
    puts "Welcome to the Ruby Dictionary"
    data_types = ["Booleans", "Symbols", "Numbers", "Arrays", "Hashes"]
    puts data_types
  end

  def menu
    puts "Enter the data type you like to explore, or type exit."
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "booleans"
        puts "You are now in the Boolean menu"
      when "symbols"
        puts "You are now in the Symbol menu"
      when "numbers"
        puts "You are now in the Number menu"
      when "arrays"
        puts "You are now in the Array menu"
      when "hashes"
        puts "You are now in the Hash menu"
      else
        puts "I'm sorry, I didn't get that. Please enter a data type or type exit."
      end
    end
  end

end
