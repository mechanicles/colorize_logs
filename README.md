# ColorizeLogs

As developers, we often deal with current controller's action, its main view page and the layout associated with it. To
trace and debug these logs information, we check the logs through our console.

However, by default, the logs are all in the same color, which makes it difficult to find the ones which we're working
on. To simplify our lives and speed up the debugging process, we want to assign different colors to these logs.
This will make it much easier for us to spot the right information and save time when we're fixing issues and improving
our software.

To ease our development time, we can use this gem. It will colorize the logs for controller's action, view, layout,
and etc.

![colorize_logs](https://user-images.githubusercontent.com/77895/270565495-a75fc46d-b574-4fbe-9976-998abbf0b7b7.png)

## Installation

Add this line to your application’s Gemfile:

```ruby
group :development do
  gem "colorize_logs"
end
```

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install colorize_logs

## Usage

Create an initializer file `config/initializers/colorize_logs.rb` and add the following code:

```ruby
# frozen_string_literal: true

colorize_logs_formatter = ColorizeLogs::Formatter.new

colorize_logs_formatter.configure do
  match(/Processing by/) do |msg|
    msg.red
  end

  match(/Rendering layout/) do |msg|
    msg.green
  end

  match(/Rendering.*within layouts/) do |msg|
    msg.green
  end
end

::Rails.logger.formatter = colorize_logs_formatter
```

That's it. Restart your server and you should see the logs in different colors.


## Credits

This gem is inspired by [Shog](https://github.com/phallguy/shog) gem. All the credits goes to the author of Shog gem.
I had to create this one as original gem is not maintained anymore and I wanted minimal stuff from it.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the 
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, 
push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mechanicles/colorize_logs. This project is 
intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the 
[code of conduct](https://github.com/mechanicles/colorize_logs/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).