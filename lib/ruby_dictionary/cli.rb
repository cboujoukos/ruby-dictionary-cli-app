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
        list_data_types
      when /enumerable(s)?\b|1/
        RubyDictionary::SB.scrape(RubyDictionary::Enumerable, RubyDictionary::Enumerable.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Enumerable)
      when /string(s)?\b|2/
        RubyDictionary::SB.scrape(RubyDictionary::String, RubyDictionary::String.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::String)
      when /symbol(s)?\b|3/
        RubyDictionary::SB.scrape(RubyDictionary::Symbol, RubyDictionary::Symbol.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Symbol)
      when /numeric(s)?\b|4/
        RubyDictionary::SB.scrape(RubyDictionary::Numeric, RubyDictionary::Numeric.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Numeric)
      when /array(s)?\b|5/
        RubyDictionary::SB.scrape(RubyDictionary::Array, RubyDictionary::Array.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Array)
      when /hash(es)?\b|6/
        RubyDictionary::SB.scrape(RubyDictionary::Hash, RubyDictionary::Hash.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Hash)
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
