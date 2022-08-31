defmodule AppWeb.Resolvers.Blog do
  alias App.Blog

  def list_posts(_parent, _args, _resolution) do
    {:ok, Blog.list_posts()}
  end

  def get_post_by_slug(_parant, %{slug: slug}, _resolution) do
    case Blog.get_post(slug) do
      nil ->
        {:error, "Post with slug '#{slug}' not found"}

      post ->
        {:ok, post}
    end
  end

  def list_tags(_parent, _args, _resolution) do
    {:ok, Blog.list_tags()}
  end

  def get_tag_by_slug(_parant, %{slug: slug}, _resolution) do
    case Blog.get_tag(slug) do
      nil ->
        {:error, "Tag with slug '#{slug}' not found"}

      tag ->
        {:ok, tag}
    end
  end
end
