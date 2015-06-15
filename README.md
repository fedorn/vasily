![Vasily](https://cloud.githubusercontent.com/assets/429423/8151229/e22ae34a-12d5-11e5-8fe1-337c8209fe24.png)
# Vasily

[![Join the chat at https://gitter.im/fedorn/vasily](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/fedorn/vasily?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

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
Then you can use it to initialize client:
```ruby
client = Vasily::Client.new('auth_token')
client.status # => 200
```
Let's analyze some documents!
```ruby
doc1 = Vasily::Document.new("Председатель совета директоров ОАО «МДМ Банк» Олег Вьюгин — о том, чему приведет обмен санкциями между Россией и Западом в следующем году. Беседовала Светлана Сухова.", "doc1")
doc2 = Vasily::Document.new("Не перепутает Генри Форда и компанию «Форд» в документах", "doc2")
doc3 = Vasily::Document.new("Штаб-квартира компании Форд Моторс располагается в городе Дирборн.", "doc3")
batch_id, status = client.queue([doc1, doc2, doc3]) # => ["abcdefgh-1111-2222-3333-abcdefabcdef", "IN_PROGRESS"]
status = client.request(batch_id) # => "FINISHED"
```
To retrieve entities:
```ruby
entities = client.retrieve([batch_id])
puts JSON.pretty_generate(entities)
[
  {
    "status": "SUCCESS",
    "tag": "doc1",
    "entities": [
      {
        "span": "Председатель совета директоров ОАО «МДМ Банк» Олег Вьюгин",
        "category": "PERSON",
        "beginOffset": 0,
        "endOffset": 57
      },
      ...
    ]
  },
  {
    "status": "SUCCESS",
    "tag": "doc2",
    "entities": [
      ...
    ]
  },
  ...
]
```
To perform search:
```ruby
search_result = client.search('ORGANIZATION:форд')
puts JSON.pretty_generate(search_result)
[
  {
    "status": "SUCCESS",
    "tag": "doc2",
    "entities": [
      {
        "span": "Генри Форда",
        "category": "PERSON",
        "beginOffset": 14,
        "endOffset": 25
      },
      {
        "span": "компанию «Форд»",
        "category": "ORGANIZATION",
        "beginOffset": 28,
        "endOffset": 43
      }
    ]
  },
  ...
]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fedorn/vasily.

