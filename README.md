![Vasily](https://cloud.githubusercontent.com/assets/429423/8151229/e22ae34a-12d5-11e5-8fe1-337c8209fe24.png)
# Vasily

Vasily is a gem for using [textocat.com](http://textocat.com/) [API](http://docs.textocat.com/) from Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vasily'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vasily

## Usage

To use API, first you need to obtain (free) token from [textocat.com](http://textocat.com).
Then you can use it to initialize client.
```ruby
client = Vasily::Client.new('auth_token')
client.status # => 200
```
Let's analyze some documents!
```ruby
doc1 = Vasily::Document.new("Председатель совета директоров ОАО «МДМ Банк» Олег Вьюгин — о том, чему приведет обмен санкциями между Россией и Западом в следующем году. Беседовала Светлана Сухова.", tag: "doc1")
doc2 = Vasily::Document.new("Не перепутает Генри Форда и компанию «Форд» в документах", tag: "doc2")
doc3 = Vasily::Document.new("Штаб-квартира компании Форд Моторс располагается в городе Дирборн.", tag: "doc3")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fedorn/vasily.

