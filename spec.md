# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
    RubyDictionary::CLI class provides CLI for main menu and RubyDictionary::Method class adds CLI functionality for detailed view
- [x] Pull data from an external source
    RubyDictionary::Scraper class scrapes several pages of Ruby Documentation
- [x] Implement both list and detail views
    Main menu allows navigation between different Ruby classes and a once a class is selected the user can find more information on any method (thanks to the Findable module).
