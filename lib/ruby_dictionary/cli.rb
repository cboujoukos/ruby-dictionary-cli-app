# CLI Controller

class RubyDictionary::CLI



  def call
    puts "Welcome to the Ruby Dictionary!"
    list_data_types
    cli_menu
    goodbye
  end

  def list_data_types
    @data_types = ["1. Enumerables", "2. Strings", "3. Symbols", "4. Numeric", "5. Arrays", "6. Hashes", "7. Dir", "8. Range", "9. Proc"]
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
      when /enumerable(s)?\b|1/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Enumerable, RubyDictionary::Enumerable.url)
        #RubyDictionary::Scraper.scrape(RubyDictionary::Enumerable, RubyDictionary::Enumerable.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Enumerable)
      when /string(s)?\b|2/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::String, RubyDictionary::String.url)
        #RubyDictionary::Scraper.scrape(RubyDictionary::String, RubyDictionary::String.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::String)
      when /symbol(s)?\b|3/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Symbol, RubyDictionary::Symbol.url)
        #RubyDictionary::Scraper.scrape(RubyDictionary::Symbol, RubyDictionary::Symbol.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Symbol)
      when /numeric(s)?\b|4/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Numeric, RubyDictionary::Numeric.url)
        #RubyDictionary::Scraper.scrape(RubyDictionary::Numeric, RubyDictionary::Numeric.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Numeric)
      when /array(s)?\b|5/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Array, RubyDictionary::Array.url)
        #RubyDictionary::Scraper.scrape(RubyDictionary::Array, RubyDictionary::Array.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Array)
      when /hash(es)?\b|6/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Hash, RubyDictionary::Hash.url)
        #RubyDictionary::Scraper.scrape(RubyDictionary::Hash, RubyDictionary::Hash.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Hash)
      when /dir\b|7/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Dir, RubyDictionary::Dir.url)
        #RubyDictionary::Scraper.scrape(RubyDictionary::Dir, RubyDictionary::Dir.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Dir)
      when /range(s)?\b|8/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Range, RubyDictionary::Range.url)
        #RubyDictionary::Scraper.scrape(RubyDictionary::Range, RubyDictionary::Range.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Range)
      when /proc(s)?\b|9/
        RubyDictionary::Scraper.scrape_names(RubyDictionary::Proc, RubyDictionary::Proc.url)
        #RubyDictionary::Scraper.scrape(RubyDictionary::Proc, RubyDictionary::Proc.url)
        RubyDictionary::Method.klass_menu(RubyDictionary::Proc)
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
