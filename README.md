# Seeit

A command line utility that creates screenshots of websites.

## Usage

The utilities assume that you've set up a PROJECT_DIRECTORY. The project
directory should contain a settings.json file.

### settings.json

```
{
  "name":"Macapinlac.com",
  "widths": [
    { "large": 2048 },
    { "medium": 1024 }
  ],
  "structure": [
    { "home": "http://macapinlac.com" },
    { "now": "http://macapinlac.com/now" },
    { "notes": "http://macapinlac.com/blog" },
    { "blog-post": "http://macapinlac.com/blog/keyboard-shortcuts-arduino-learning" },
    { "blog-category": "http://macapinlac.com/blog/tag:Projects" }
  ]
}
```

### Commands

The following command will create a 'baseline' directory in the project
directory where the screenshots will be saved.

```ruby
seeit_build_baseline --project_dir=PROJECT_DIR
```

You can create a 'version' of screenshots. This will use the current date as the
version name.

```ruby
seeit_build_version --project-dir=PROJECT_DIR
```

or specify a version name.

```ruby
seeit_build_version --project-dir=PROJECT_DIR --version-name=SOMENAME
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Todo

* [ ] Ability to compare versions of websites
* [ ] Ability to compare versions according to the baseline

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rsmacapinlac/seeit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Seeit project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rsmacapinlac/seeit/blob/master/CODE_OF_CONDUCT.md).
