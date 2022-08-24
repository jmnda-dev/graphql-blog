defmodule App.Accounts.ProfileAdmin do
  import Ecto.Query
  alias AppWeb.Upload

  def form_fields(_) do
    [
      avatar: nil,
      avatar_upload: %{type: :file},
      about: nil,
      description: nil,
      occupation: nil,
      company: nil,
      github: nil,
      linkedin: nil,
      twitter: nil
    ]
  end

  def custom_show_query(_conn, _schema, query) do
    from(p in query, preload: [:user])
  end

  def before_insert(conn, changeset) do
    current_user = conn.assigns[:current_user]

    img_path = save_upload(conn, changeset, "profile", "avatar_upload")

    {
      :ok,
      changeset
      |> Ecto.Changeset.put_assoc(:user, current_user)
      |> Ecto.Changeset.put_change(:avatar, img_path)
    }
  end

  def before_update(conn, changeset) do
    current_user = conn.assigns[:current_user]

    img_path = save_upload(conn, changeset, "profile", "avatar_upload")

    {
      :ok,
      changeset
      |> Ecto.Changeset.put_assoc(:user, current_user)
      |> Ecto.Changeset.put_change(:avatar, img_path)
    }
  end

  defp save_upload(conn, %{changes: changes, data: data} = _changeset, schema_name, field) do
    case Upload.handle_upload(conn, schema_name, field) do
      nil ->
        changes[:avatar] ||
          data.avatar
          |> Upload.put_image_url()

      img_path ->
        img_path
        |> Upload.put_image_url()
    end
  end
end
