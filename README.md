# Lingorb

Yet another duoling unofficial API binding. This is a port of https://github.com/KartikTalwar/Duolingo !

Released rubygem `duolingo` is too old and not following current unofficial API spec, so I recreated.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lingorb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lingorb

## Usage

!!!TODO: Write usage instructions here!!!

```ruby
# I want Ruby API like that
cli = Lingorb.authenticate(@user, @passwd)
user = cli.current_user
p user.gain_xp_history
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/udzura/lingorb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
