# CLI Controller

class RubyDictionary::CLI



  def call
    list_data_types
    menu
  end

  def list_data_types
    puts "Welcome to the Ruby Dictionary!"
    @data_types = ["Booleans", "Symbols", "Numbers", "Arrays", "Hashes"]
    puts @data_types
  end

  def menu
    input = nil
    puts "Enter the data type you like to explore, or type exit."
    while input != "exit"

      input = gets.strip.downcase
      case input
      when /boolean(s)?\b/
        puts "You are now in the Boolean menu"
      when /symbol(s)?\b/
        puts "You are now in the Symbol menu"
      when /number(s)?\b/
        puts "You are now in the Number menu"
      when /array(s)?\b/
        puts "You are now in the Array menu"
      when /hash(es)?\b/
        puts "You are now in the Hash menu"
      else
        puts "I'm sorry, I didn't get that. Please enter a data type or type exit."
        puts @data_types

      end
    end
  end

end
