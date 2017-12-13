# CLI Controller

class RubyDictionary::CLI



  def call
    puts "Welcome to the Ruby Dictionary!"
    list_data_types
    RubyDictionary::Scraper.scrape_klass(RubyDictionary::Array, RubyDictionary::Array.url)
    RubyDictionary::Scraper.scrape_klass(RubyDictionary::Enumerable, RubyDictionary::Enumerable.url)
    RubyDictionary::Scraper.scrape_klass(RubyDictionary::Hash, RubyDictionary::Hash.url)
    cli_menu
    goodbye
  end

  def list_data_types
    @data_types = ["1. Arrays", "2. Dir", "3. Enumerables", "4. Hashes", "5. Numeric", "6. Procs", "7. Ranges", "8. Strings", "9. Symbols"]
    puts @data_types
  end

  def klass_menu(klass)
    input = nil
    puts "\n"
    puts RubyDictionary::Klass.define(klass)
    puts "\nEnter 'i' to see a list of public instance methods, 'c' to see a list of public class methods, 'all' to see all public methods, or enter the name of a method to define, or enter 'menu' to go back"
    until input == "menu" || input == "exit"
      input = gets.strip.downcase
      case
      when input == "i" || input == "instance"
        klass.list_public_inst_methods
        puts "\n"
      when input == "c" || input == "class"
        klass.list_public_klass_methods
        puts "\n"
      when input == "all"
        klass.list_all_methods
        puts "\n"
      when input == "menu" || input == "exit" || input == "back"
        RubyDictionary::Klass.list_data_types
        klass.inst_methods.clear
        klass.klass_methods.clear
        klass.all.clear
      else
        if klass.find_by_name(input) == nil
          puts "Im sorry, I can't find a method by that name, try again or type 'menu' to go to the main menu or type 'exit'"
        else
          method = klass.find_by_name(input)
          puts "\n##{method.name}\n"
          method.callseq.each do |seq|
            puts seq
          end
          puts "\nReturn Value: #{method.return_statement}\n\n#{method.description}\n\n"
          if method.examples != ""
            puts "Examples:\n#{method.examples}\n\n"
          end
        end
      end
    end
  end

  def cli_menu
    input = nil
    puts "Enter the Class or Mixin you would like to explore, or type 'exit'"
    until input == "exit"

      input = gets.strip.downcase
      case input
      when "list"
        list_data_types
      when /array(s)?\b|1/
        klass_menu(RubyDictionary::Array)
      when /dir(s)?\b|2/
        RubyDictionary::Scraper.scrape_klass(RubyDictionary::Dir, RubyDictionary::Dir.url)
        klass_menu(RubyDictionary::Dir)
      when /enumerable(s)?\b|3/
        klass_menu(RubyDictionary::Enumerable)
      when /hash(es)?\b|4/
        klass_menu(RubyDictionary::Hash)
      when /numeric(s)?\b|5/
        RubyDictionary::Scraper.scrape_klass(RubyDictionary::Numeric, RubyDictionary::Numeric.url)
        klass_menu(RubyDictionary::Numeric)
      when /proc(s)?\b|6/
        RubyDictionary::Scraper.scrape_klass(RubyDictionary::Proc, RubyDictionary::Proc.url)
        klass_menu(RubyDictionary::Proc)
      when /range(s)?\b|7/
        RubyDictionary::Scraper.scrape_klass(RubyDictionary::Range, RubyDictionary::Range.url)
        klass_menu(RubyDictionary::Range)
      when /string(s)?\b|8/
        RubyDictionary::Scraper.scrape_klass(RubyDictionary::String, RubyDictionary::String.url)
        klass_menu(RubyDictionary::String)
      when /symbol(s)?\b|9/
        RubyDictionary::Scraper.scrape_klass(RubyDictionary::Symbol, RubyDictionary::Symbol.url)
        klass_menu(RubyDictionary::Symbol)
      else
        if input != "exit"
          puts "I'm sorry, I didn't get that. Please enter a Class or type 'list' or type 'exit'"
        end
      end
    end

    def goodbye
      puts "Happy Coding!!!"
    end
  end

end
