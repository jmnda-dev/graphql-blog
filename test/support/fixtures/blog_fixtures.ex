defmodule App.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        excerpt: "some excerpt",
        featured_image: "some featured_image",
        published: true,
        slug: "some slug",
        tags: [],
        title: "some title"
      })
      |> App.Blog.create_post()

    post
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        comment: "some comment"
      })
      |> App.Blog.create_comment()

    comment
  end
end
