# Idea Inbox 📬 - Phoenix edition

_Note: Work in progress!_

Idea Inbox is a simple example web app that prompts the user for ideas around a topic and allows them to vote in previously suggested ideas.

It serves as an example application for people to try out new languages and frameworks.

## Idea Inbox 📬 basics

[Read the basics here](https://github.com/pgaspar/idea-inbox-sinatra#idea-inbox--basics).

## TODO ✅

- [x] Idea submission
- [ ] Voting
- [ ] Idea comments
- [ ] Real-time idea comments and voting using sockets
- [ ] Admin panel w/ some authentication

## Phoenix edition stack

This Idea Inbox edition is built using Phoenix. I used my work on [pgaspar/elixir-and-phoenix-bootcamp](https://github.com/pgaspar/elixir-and-phoenix-bootcamp) and the [Phoenix Guides](https://hexdocs.pm/phoenix/overview.html#content) as basis for this work.

* Phoenix 1.3.4
* Elixir 1.7.1
* Bootstrap 2.1.1 (I used the same css as the [original Sinatra implementation](https://github.com/pgaspar/idea-inbox-sinatra))

To run the app, make sure you have Elixir installed and then:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Contributing

I'm still discovering Idea Inbox and I'd be very excited to do it with other people!

I'll be pushing a few other implementations soon(ish) as I explore other technologies, but please share your implementations as well!

Comments, suggestions, other implementations, etc. will be very welcome.

## Acknowledgments

Idea Inbox 📬 is based on [oquefaltaemcoimbra.pt](http://oquefaltaemcoimbra.pt) ([pgaspar/oqfc](https://github.com/pgaspar/oqfc)), the work of a few Coimbra residents on the look for ideas of how to improve their city.

The idea of building the same app using multiple languages / frameworks comes from various other projects, like [TodoMVC](https://github.com/tastejs/todomvc).
