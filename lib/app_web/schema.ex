defmodule AppWeb.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(AppWeb.Schema.BlogTypes)
  import_types(AppWeb.Schema.AccountTypes)

  alias AppWeb.Resolvers

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.Blog.list_posts/3)
    end

    @desc "Get a post by slug"
    field :post, :post do
      arg(:slug, non_null(:string))
      resolve(&Resolvers.Blog.get_post_by_slug/3)
    end

    @desc "Get a user"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.find_user/3)
    end

    field :comments, list_of(:comment) do
      resolve(&Resolvers.Blog.list_comments/3)
    end
  end

  def context(ctx) do
    source = Dataloader.Ecto.new(App.Repo)

    loader =
      Dataloader.new()
      |> Dataloader.add_source(App.Blog, source)
      |> Dataloader.add_source(App.Accounts, source)

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
