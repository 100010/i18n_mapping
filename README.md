*あとでけすゾ*
```
I18nのためのdir構造とymlをコマンドから自動生成したい
https://github.com/ctran/annotate_models
みたいな。
directoryは自動生成できるようになったので、ERB使ってうまいことfileつくれるようになればとりあえずおk
```

*この状態だとgemからでは動かないのでrails console にはっつけて I18nMapping.execute(:ja, :en) みたいにつかう*



# I18nMapping

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/i18n_mapping`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'i18n_mapping'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n_mapping

## Usage

Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/i18n_mapping. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the I18nMapping project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/i18n_mapping/blob/master/CODE_OF_CONDUCT.md).
