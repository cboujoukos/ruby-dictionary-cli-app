# RubyDictionary

Welcome to the Ruby Dictionary gem. With this gem you will be able to do more than just print a list of methods that can be called on an object. This gem allows you to view methods available to you, and call up a description of each method along with available call sequences and examples scraped straight from ruby-docs.

This gem is powered by the Core API docs for Ruby 2.4.2 found at:
http://ruby-doc.org/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_dictionary'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_dictionary

## Usage

The program opens with a list of ruby classes and mixins. you can navigate to any of the class menus by entering the name or associated number into the command line. From there, follow the simple instructions provided in each menu to navigate through this program and you will have access to the power of the official Ruby core 2.4.2 API  docs right from your command line.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/ruby_dictionary. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RubyDictionary project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>/ruby_dictionary/blob/master/CODE_OF_CONDUCT.md).
