# CLI Controller

class RubyDictionary::CLI



  def call
    list_data_types
    menu
  end

  def list_data_types
    puts "Welcome to the Ruby Dictionary!"
    @data_types = ["1. Enumerables", "2. Strings", "3. Symbols", "4. Numbers", "5. Arrays", "6. Hashes"]
    puts @data_types
  end

  def menu
    input = nil
    puts "Enter the data type you like to explore, or type exit."
    while input != "exit"

      input = gets.strip.downcase
      case input
      when /enumerable(s)?\b|1/
        puts "You are now in the Enumerables menu"
        
      when /string(s)?\b|2/
        puts "You are now in the String menu"
        RubyDictionary::Scraper.scrape_string
      when /symbol(s)?\b|3/
        puts "You are now in the Symbol menu"
      when /number(s)?\b|4/
        puts "You are now in the Number menu"
      when /array(s)?\b|5/
        puts "You are now in the Array menu"
      when /hash(es)?\b|6/
        puts "You are now in the Hash menu"
      else
        puts "I'm sorry, I didn't get that. Please enter a data type or type exit."
        puts @data_types

      end
    end
  end

end
