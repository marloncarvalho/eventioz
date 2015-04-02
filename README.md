# Eventioz

It's a simple Ruby Wrapper to the Eventioz API. Eventioz is a Brazilian Ticket Platform used by many events in Brazil. This wrapper simplifies the use
of their API, providing a layer of abstraction. This is the first release and there're many improvements required. First off, we haven't done any tests
until now.

Feel free to send Pull Requests and ask for improvements. If you find any bug, fill an issue!

## Installation

Add this line to your application's Gemfile:

    gem 'eventioz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eventioz

## Usage

First off, you have to log in to the Eventioz:

    account = Eventioz.login(
        :login => 'youremail@yourdomain.com',
        :password => 'yourpassword')

Don't worry. This gem doesn't store your username and password in any way. It uses it only to sign in and get the API Key.
Once it has the API Key, it discards the username and password. Once you have the account data, you can access your organizers,
events and registrations. The next example shows how you can access the organizers.

    Eventioz::Organizer.all(account)

To access all events that belong to a Organizer:

    Eventioz::Event.all(account, organizer.cached_slug)

To access all registrations from an event:

    Eventioz::Registration.all(account, event.cached_slug)

## Contributing

1. Fork it ( https://github.com/marloncarvalho/eventioz/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
