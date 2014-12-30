# Stubhub

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stubhub'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stubhub

## Quickstart

Starting the stub server with the seed directory as the current directory:

		$ stubhub start

Starting the stub server with a differnt seed directory

		$ stubhub start -s "~/path/to/seed/dir"

## Stub files

The stub files are matched to the URIs as follows:

| uri path            | matched file name   |
| ------------------- | ------------------- |
| resource            | resource            |
| resource.json       | resource.json       |
| /path/to/resource   | path-to-resource    |

## Contributing

1. Fork it ( https://github.com/[my-github-username]/stubhub/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
