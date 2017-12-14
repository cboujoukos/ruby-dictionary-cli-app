# CLI Controller
require 'pry'
class CLI

  def call
    Scraper.scrape_index
    puts "Welcome to the Ruby Dictionary!"
    scrape_slow_classes
    list_klasses
    main_menu
    goodbye
  end

  def scrape_slow_classes
    @array = Klass.list[0]
    Scraper.scrape_klass(@array)
    @enum = Klass.list[2]
    Scraper.scrape_klass(@enum)
  end

  def list_klasses
    Klass.all.each.with_index{|k,i| puts "#{i + 1}. #{k.name}"}
  end

  def klass_menu(klass)
    input = nil
    puts "\n"
    puts klass.definition
    puts "\nEnter 'i' to see a list of public instance methods\nEnter 'c' to see a list of public class methods\nEnter 'all' to see all public methods available\nEnter the name of a method to learn more\nEnter 'menu' or 'back' to go back to the list of Classes and Mixins\nOr enter 'exit' to quit"
    until input == "menu" || input == "back"
      input = gets.strip.downcase
      case
      when input == "i" || input == "instance"
        klass.list_inst_methods
        puts "\n"
      when input == "c" || input == "class"
        klass.list_klass_methods
        puts "\n"
      when input == "all"
        klass.list_all_methods
        puts "\n"
      when input == "menu" || input == "back"
        list_klasses
      when input == "exit"
        puts "Happy Coding!!!"
        exit
      else
        if klass.find_by_name(input) == nil
          puts "Im sorry, I can't find a method by that name, try again or type 'menu' to go to the main menu or type 'exit' to quit"
        else
          method = klass.find_by_name(input)
          puts "\n##{method.name}\n"
          method.callseq.each do |seq|
            puts seq
          end
          puts "\n#{method.description}"
          if method.examples != ""
            puts "\nExamples:\n#{method.examples}\n\n"
          end
        end
      end
    end
  end

  def main_menu
    input = nil
    puts "Enter the Class or Mixin you would like to explore, or type 'exit'"
    #Klass.all.each do |k|
    #  Scraper.scrape_klass(k)
    #end
    until input == "exit"

      input = gets.strip.downcase
      case input
      when "list"
        list_klasses
      when /array(s)?\b|1/
        klass_menu(@array)
      when /dir(s)?\b|2/
        @dir = Klass.list[1]
        Scraper.scrape_klass(@dir)
        klass_menu(@dir)
      when /enumerable(s)?\b|3/
        klass_menu(@enum)
      when /hash(es)?\b|4/
        @hash = Klass.list[3]
        Scraper.scrape_klass(@hash)
        klass_menu(@hash)
      when /numeric(s)?\b|5/
        @num = Klass.list[4]
        Scraper.scrape_klass(@num)
        klass_menu(@num)
      when /proc(s)?\b|6/
        @prok = Klass.list[5]
        Scraper.scrape_klass(@prok)
        klass_menu(@prok)
      when /range(s)?\b|7/
        @range = Klass.list[6]
        Scraper.scrape_klass(@range)
        klass_menu(@range)
      when /string(s)?\b|8/
        @string = Klass.list[7]
        Scraper.scrape_klass(@string)
        klass_menu(@string)
      when /symbol(s)?\b|9/
        @symbol = Klass.list[8]
        Scraper.scrape_klass(@symbol)
        klass_menu(@symbol)
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
