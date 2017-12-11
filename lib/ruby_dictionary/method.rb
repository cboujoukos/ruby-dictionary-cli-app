class RubyDictionary::Method
  extend Findable::ClassMethods
  attr_reader :definition

  @@all = []
  @callseq = []

  def self.list_public_instance_methods
    #RubyDictionary::SB.scrape_string
    #self.all.each{|m| print "#{m.name}   :   "}
    self.all.each{|m| puts m.name}
  end

  def self.define(klass)
    doc = Nokogiri::HTML(open(klass.url))
    @definition = doc.css("div#description p").inner_html.gsub(/<code>|<\/code>/,"").gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
  end

  def self.klass_menu(klass)
    input = nil
    puts "\n"
    puts self.define(klass)
    puts "\nEnter 'list' to see a list of public instance methods, or enter the name of a method to define, or enter 'menu' to go back"
    until input == "menu" || input == "exit"
      input = gets.strip.downcase
      case
      when input == "list"
        klass.list_public_instance_methods
        puts "\n"
      when input == "menu" || input == "exit"
        self.list_data_types
    #  when input == "exit"
    #    puts "How do I terminate the program??"
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

  def self.all
    @@all
  end

  def self.list_data_types
    @data_types = ["1. Enumerables", "2. Strings", "3. Symbols", "4. Numeric", "5. Arrays", "6. Hashes"]
    puts @data_types
    puts "Enter the data type or mixin you would like to explore, or type exit."
  end

  def method_menu

  end

end
