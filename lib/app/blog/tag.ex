defmodule App.Blog.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :slug, :string
    field :name, :string
    many_to_many :posts, App.Blog.Post, join_through: "posts_tags"

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> Slugy.slugify([:name])
  end
end
