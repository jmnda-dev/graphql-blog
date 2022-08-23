defmodule App.Blog.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    many_to_many :posts, App.Blog.Post, join_through: "posts_tags"

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> lowercase_tag(attrs["name"])

  end

  defp lowercase_tag(_changeset, nil), do: nil

  defp lowercase_tag(changeset, tag_name) do
    changeset
    |> put_change(:name, String.downcase(tag_name))
  end

end
