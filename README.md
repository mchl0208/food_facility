# FoodFacility

Sorry this is not a project that I'm proud of, after investing a couple of hours of work I realized that I was reinventing the wheel. Making an API from an API, what's the point?

Since this is a light test, where I shouldn't have spent more than four hours, I'll proceed to explain my idea and how I would continue it if I had more time.

This is a simple web api written in elixir that takes data from another web api and contains a fairly simple distance radius filter.

## Future implementations
- A WEB/API to show the food trucks based on multiple filters: proximity, name, food inventory, status.

- Since I didn't want rely the availability of my service to fall on a third-party service, I was going to create an OBAN service to synchronize data locally every x hours.

- Implement a scoreboard where registered users would be able to rate visited establishments 

- This is a hasty decision, but depending on future features an implementation of GraphQL with Absinthe could be considered.

## How to start this project
To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

### How to start this project
This project includes a couple of basic tests, note that in the test environment the real service is not being invoked but rather the responses are being mocked.
 
To test your Phoenix server:
  * Run `MIX_ENV=test mix test`.

Show the test results.
## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
