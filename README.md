# Detectify
[![Gem Version](https://badge.fury.io/rb/detectify.svg)](https://badge.fury.io/rb/detectify)
[![Code Climate](https://codeclimate.com/github/rubygarage/detectify/badges/gpa.svg)](https://codeclimate.com/github/rubygarage/detectify)
[![Coverage Status](https://coveralls.io/repos/github/rubygarage/detectify/badge.svg?branch=master)](https://coveralls.io/github/rubygarage/detectify?branch=master)
[![Build Status](https://travis-ci.org/rubygarage/detectify.svg?branch=master)](https://travis-ci.org/rubygarage/detectify)

Detectify provides a simple way to retrieve an ActiveRecord entity based on the domain/subdomain request information.

It’s a Ruby gem, similar to Houser, that helps you retrieve an Active Record entity from a database with a URL. You know Houser is a multi-tenancy gem that can send database requests using subdomain names. But Houser is a relatively old Ruby library. For modern Rails-based SaaS apps, we wanted more flexibility. That's why we've developed Detectify.
For more information, you can read here [Detectify review](https://rubygarage.org/blog/how-we-retrieve-tenant-data-in-a-multi-tenant-app).

## Installation

Add this line to your application's Gemfile:

`gem 'detectify', github: 'rubygarage/detectify'`

and then execute: `$ bundle`

Finally, restart the server to apply the changes.

Detectify only supports applications built with Ruby 2.2.2 and Rails 4.2 or higher.

## Usage

Start off by generating an initializer:

`$ bundle exec rails g detectify:install`

this will create file `config/initializers/detectify.rb` in your application directory.

You can configure Detectify for your application needs via initializer. After this you can access detected entity via: `request.env['Detectify-Entity']`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rubygarage/detectify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
***
<a href="https://rubygarage.org/"><img src="https://rubygarage.s3.amazonaws.com/assets/assets/rg_color_logo_horizontal-919afc51a81d2e40cb6a0b43ee832e3fcd49669d06785156d2d16fd0d799f89e.png" alt="RubyGarage Logo" width="415" height="128"></a>

RubyGarage is a leading software development and consulting company in Eastern Europe. Our main expertise includes Ruby and Ruby on Rails, but we successfully employ other technologies to deliver the best results to our clients. [Check out our portfolio](https://rubygarage.org/portfolio) for even more exciting works!
