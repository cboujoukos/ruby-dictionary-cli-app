Building a CLI gem

1. Plan out, imagine UI
2. Build out project structure
3. Start with the file run, shebang line, and relative requirements
4. stub out the interface
5. Start making things real
6. Discover objects
7. Program


A command line interface that allows a user to browse Public instance methods for different data types.

user types ruby-dictionary

Welcomes the user
asks what Class the user wants to explore
prompts for input of Primitive data type

lists public instance methods for the selected data type

Which method do you want to learn more about?
prompts user to enter #method
returns description and examples


I think I should create separate Scraper and Method classes

FINDABLE?

pry(RubyDictionary::Method)> string_methods.detect{|n| n.name == "downcase"}
=> #<RubyDictionary::Method:0x000000017e12a0 @name="downcase">
