# CLI Controller

class RubyDictionary::CLI



  def call
    puts "Welcome to the Ruby Dictionary!"
    list_data_types
    cli_menu
    goodbye
  end

  def list_data_types
    @data_types = ["1. Arrays", "2. Dir", "3. Enumerables", "4. Hashes", "5. Numeric", "6. Procs", "7. Ranges", "8. Strings", "9. Symbols"]
    puts @data_types
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
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Array, RubyDictionary::Array.url)
        RubyDictionary::Scraper.scrape_klass_methods(RubyDictionary::Array, RubyDictionary::Array.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Array)
      when /dir(s)?\b|2/
        RubyDictionary::Scraper.scrape_klass_methods(RubyDictionary::Dir, RubyDictionary::Dir.url)
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Dir, RubyDictionary::Dir.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Dir)
      when /enumerable(s)?\b|3/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Enumerable, RubyDictionary::Enumerable.url)
        RubyDictionary::Scraper.scrape_klass_methods(RubyDictionary::Enumerable, RubyDictionary::Enumerable.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Enumerable)
      when /hash(es)?\b|4/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Hash, RubyDictionary::Hash.url)
        RubyDictionary::Scraper.scrape_klass_methods(RubyDictionary::Hash, RubyDictionary::Hash.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Hash)
      when /numeric(s)?\b|5/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Numeric, RubyDictionary::Numeric.url)
        RubyDictionary::Scraper.scrape_klass_methods(RubyDictionary::Numeric, RubyDictionary::Numeric.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Numeric)
      when /proc(s)?\b|6/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Proc, RubyDictionary::Proc.url)
        RubyDictionary::Scraper.scrape_klass_methods(RubyDictionary::Proc, RubyDictionary::Proc.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Proc)
      when /range(s)?\b|7/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Range, RubyDictionary::Range.url)
        RubyDictionary::Scraper.scrape_klass_methods(RubyDictionary::Range, RubyDictionary::Range.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Range)
      when /string(s)?\b|8/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::String, RubyDictionary::String.url)
        RubyDictionary::Scraper.scrape_klass_methods(RubyDictionary::String, RubyDictionary::String.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::String)
      when /symbol(s)?\b|9/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Symbol, RubyDictionary::Symbol.url)
        RubyDictionary::Scraper.scrape_klass_methods(RubyDictionary::Symbol, RubyDictionary::Symbol.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Symbol)
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
