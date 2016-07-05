# Detectify

Detectify provides a simple way to retrieve an ActiveRecord entity based on the domain/subdomain request information.

## Installation

Add this line to your application's Gemfile:

`gem 'detectify', github: 'rubygarage/detectify'`

and then execute: `$ bundle`

Finally, restart the server to apply the changes.

## Usage

Start off by generating an initializer: `$ bundle exec rails g detectify:install`, this will create file `config/initializers/detectify.rb` in your application directory. You can configure Detectify for your application needs via initializer. After this you can access detected entity via `env['Detectify-Entity']`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rubygarage/detectify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
