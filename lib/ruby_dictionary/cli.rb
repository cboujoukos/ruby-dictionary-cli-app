# CLI Controller

class RubyDictionary::CLI



  def call
    puts "Welcome to the Ruby Dictionary!"
    list_data_types
    menu
    goodbye
  end

  def list_data_types
    @data_types = ["1. Enumerables", "2. Strings", "3. Symbols", "4. Numeric", "5. Arrays", "6. Hashes"]
    puts @data_types
  end

  def menu
    input = nil
    puts "Enter the data type or mixin you would like to explore, or type exit."
    until input == "exit"

      input = gets.strip.downcase
      case input
      when "list"
        puts @data_types
      when /enumerable(s)?\b|1/
        RubyDictionary::SB.scrape_enumerable
        puts RubyDictionary::Enumerable.define_enumerable
        puts "\nEnter 'list' to see a list of public instance methods, or enter the name of a method to define, or enter 'menu' to go back"
        input = gets.strip.downcase
        case
        when input == "list"
          RubyDictionary::Enumerable.list_public_instance_methods
        when input == "menu"
          self.list_data_types
          self.menu
        when RubyDictionary::Enumerable.find_by_name(input) != nil
          RubyDictionary::Enumerable.find_by_name(input)
        else
          puts "Whatchu want?"
        end

      when /string(s)?\b|2/
        RubyDictionary::SB.scrape(RubyDictionary::String.url)
        puts RubyDictionary::String.define_string
        puts "\nEnter 'list' to see a list of public instance methods, or enter the name of a method to define, or enter 'menu' to go back"
        input = gets.strip.downcase
        case input
        when "list"
          RubyDictionary::String.list_public_instance_methods
        when "menu"
          self.list_data_types
          self.menu
        end
      when /symbol(s)?\b|3/
        puts "You are now in the Symbol menu"
        RubyDictionary::SB.scrape_symbol
      when /numeric(s)?\b|4/
        RubyDictionary::SB.scrape_numeric
        puts RubyDictionary::Numeric.define_numeric
        puts "\nEnter 'list' to see a list of public instance methods, or enter the name of a method to define, or enter 'menu' to go back"
        input = gets.strip.downcase
        case input
        when "list"
          RubyDictionary::Numeric.list_public_instance_methods
        when "menu"
          self.list_data_types
          self.menu
        end
      when /array(s)?\b|5/
        puts "You are now in the Array menu"
        RubyDictionary::SB.scrape_array
      when /hash(es)?\b|6/
        puts "You are now in the Hash menu"
      else
        if input != "exit"
          puts "I'm sorry, I didn't get that. Please enter a data type or type list or type exit."
        end
      end
    end

    def goodbye
      puts "Happy Coding!"
    end
  end

end
