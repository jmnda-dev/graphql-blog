# App
## Get started
- Clone the repository 
```
git clone https://github.com/jmnda-dev/graphql-blog.git
cd graphql-blog
```

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Create an admin user by running `mix blog.create_admin`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Ensure you create a user and login before accessing the Admin interface on [`localhost:4000/admin`](http://localhost:4000).

You can also visit [`localhost:4000/api/graphiql`](http://localhost:4000/api/graphiql) to access the GraphQL playground.

API requests from a client will goes through the `localhost:4000/api` endpoint. You can setup this [Next.js blog app](https://github.com/jmnda-dev/graphql-blog-frontend.git) and point the Next.js blog app to this app's api endpoint.


The app already has some configs for deploying to 
heroku. Ensure you have setup a database for your Heroku app and set the following environment variables:
- `DATABASE_URL`
- `PHX_HOST(the heroku app url)`
- `PORT (usually 443)` 

Add the git url for your Heroku app by running `git remote add heroku <your-heroku-app-git-url>` and deploy by running `git push heroku main` or `git push heroku <your-branch>:main`. 


Check the Phoenix deployment guides for more information: [check phoenix deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
