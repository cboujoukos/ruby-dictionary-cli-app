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
asks what Class/Mixin the user wants to explore
prompts for input
Displays definition of Class
asks user if they want to display instance methods or class methods
lists public instance/class/all methods for the selected data type

Which method do you want to learn more about?
prompts user to enter #method
returns description and examples


I think I should create separate Scraper and Method classes

FINDABLE?

FIND OUT HOW TO REMOVE HTML TAGS FROM DESCRIPTIONS (ie See Also links)

IS THERE A WAY TO SET UP AN ANCHOR IN MY CLI MENU SO THAT WHEN I TYPE EXIT FROM A KLASS MENU IT EXITS THE CLI MENU AND SKIPS TO #GOODBY?

ADJUST/ADD CLEAR ALL METHOD?


NEED  TO ADD A CONDITION THAT METHODS SHOULD ONLY BE ADDED TO ALL/INST_METHODS/KLASS_METHODS IF THAT METHOD CANNOT BE FOUND IN THERE.
