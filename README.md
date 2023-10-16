# Blah

## Error
There is a boundary error compiling this repository;

```
$ mix compile --force
warning: forbidden reference to Blah.Context.Subcontext.Module
  (references from BlahWeb to Blah.Context are not allowed)
  lib/blah_web/controllers/page_html/home.html.heex:1
```

## Starting app

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
