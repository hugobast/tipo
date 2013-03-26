# Tipo

[![Code Climate](https://codeclimate.com/github/hugobast/tipo.png)](https://codeclimate.com/github/hugobast/tipo) [![Build Status](https://travis-ci.org/hugobast/tipo.png?branch=master)](https://travis-ci.org/hugobast/tipo)

This is very early work but Tipo is meant to be a pure ruby OpenType and TrueType font format reader. Support for more tables and information to come.

## Installation

Add this line to your application's Gemfile:

    gem 'tipo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tipo

## Usage

Very narrow interface:

```ruby
info = Tipo.info 'path/to/font.{otf|ttf}'
info.naming.font   # => "Font Name"
info.naming.style  # => "Italic"

info.substitution.feature_list.map do |feature|
  feature.tag
end.uniq           # => ['aalt', 'dlig', 'liga' ... ]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
