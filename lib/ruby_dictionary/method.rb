class RubyDictionary::Klass
  extend Findable::ClassMethods
  attr_accessor :definition, :url, :name, :description, :examples, :see_also, :return_statement, :test_desc, :callseq, :method_type


  def initialize(name=nil,description=nil,examples=nil,return_statement=nil)
    @name = name
    @description = description
    @examples = examples
    @return_statement = return_statement
  end

  def self.list_all_methods
    self.all.each{|m| puts m.name}
  end

  def self.list_public_inst_methods(klass)
    klass.inst_methods.each{|m| puts m.name}
  end

  def self.list_public_klass_methods(klass)
    klass.klass_methods.each{|m| puts m.name}
  end

#  def self.define(klass)
#    doc = Nokogiri::HTML(open(klass.url))
#    @definition = doc.css("div#description p, div#description pre, div#description pre span, div#description a, div#description h2").text.gsub(/<span.{1,25}>|<\/span>/,"").gsub(/<code>|<\/code>/,"").gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&").gsub("¶ ↑","\n")
#  end

  ###div#description p:first-child a, div#description p:nth-child(2) a

  def self.define(klass)
    doc = Nokogiri::HTML(open(klass.url))
    @definition = doc.css("div#description p:first-child, div#description p:nth-child(2)").text.gsub(/<span.{1,25}>|<\/span>/,"").gsub(/<code>|<\/code>/,"").gsub(/&lt;|&gt;|&amp;/, '&lt;' => "<", '&gt;' => ">", '&amp;' => "&")
  end

  def self.klass_menu(klass)
    input = nil
    puts "\n"
    puts self.define(klass)
    puts "\nEnter 'i' to see a list of public instance methods, 'c' to see a list of public class methods, 'all' to see all public methods, or enter the name of a method to define, or enter 'menu' to go back"
    until input == "menu" || input == "exit"
      input = gets.strip.downcase
      case
      when input == "i" || input == "instance"
        list_public_inst_methods(klass)
        puts "\n"
      when input == "c" || input == "class"
        list_public_klass_methods(klass)
        puts "\n"
      when input == "all"
        self.list_all_methods
        puts "\n"
      when input == "menu" || input == "exit"
        self.list_data_types
        klass.all.clear
    #  when input == "exit"
    #    puts "How do I terminate the program??"

      else
        if klass.find_by_name(input) == nil
          puts "Im sorry, I can't find a method by that name, try again or type 'menu' to go to the main menu or type 'exit'"
        else
          method = klass.find_by_name(input)
          puts "\n##{method.name}\n"
          if method.callseq.length > 0
            method.callseq.each do |seq|
              puts seq
            end
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

  def self.klass_methods
    @@klass_methods
  end

  def self.inst_methods
    @@inst_methods
  end

  def self.list_data_types
    @data_types = ["1. Arrays", "2. Dir", "3. Enumerables", "4. Hashes", "5. Numeric", "6. Procs", "7. Ranges", "8. Strings", "9. Symbols"]
    puts @data_types
    puts "Enter the data type or mixin you would like to explore, or type exit."
  end

end
