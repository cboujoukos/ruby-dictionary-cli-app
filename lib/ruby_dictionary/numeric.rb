class RubyDictionary::Numeric < RubyDictionary::Method

  @@url = "https://ruby-doc.org/core-2.4.2/Numeric.html"
  @@all = []


  def self.define_numeric
    doc = Nokogiri::HTML(open("http://ruby-doc.org/core-2.4.2/Numeric.html"))
    @definition = doc.css("div#description p").inner_html.gsub(/<code>|<\/code>/,"").gsub(/&lt;|&gt;/, '&lt;' => "<", '&gt;' => ">")
  end

  def self.list_public_instance_methods
    #RubyDictionary::SB.scrape_numeric
    #self.all.each{|m| print "#{m.name}   :   "}
    self.all.each{|m| puts m.name}
  end

  def self.numeric_menu
    input = nil
    puts self.define_numeric
    puts "\nEnter 'list' to see a list of public instance methods, or enter the name of a method to define, or enter 'menu' to go back"
    until input == "menu" || input == "exit"
      input = gets.strip.downcase
      case
      when input == "list"
        self.list_public_instance_methods
      when input == "menu"
        RubyDictionary::Method.list_data_types

      else
        if RubyDictionary::Numeric.find_by_name(input) == nil
          puts "Im sorry, I can't find a method by that name, try again or type 'menu' to go to the main menu or type 'exit'"
        else
          method = RubyDictionary::Numeric.find_by_name(input)
          puts "\n##{method.name}\nReturn Value: #{method.return_statement}\n\n#{method.description}"
          if method.examples != ""
            puts "\nExamples:\n#{method.examples}"
          end
        end
      end
    end
  end

  def self.all
    @@all
  end

  def self.url
    @@url
  end

end
