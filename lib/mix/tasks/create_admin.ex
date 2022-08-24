defmodule Mix.Tasks.Blog.CreateAdmin do
  @moduledoc """
  Mix task to create an admin user from the command line.
  """
  use Mix.Task

  alias App.Accounts
  require Logger

  @shortdoc "Create an admin user."
  @requirements ["app.config", "app.start"]
  def run(args) do
    {switches, _, _} = OptionParser.parse(args, strict: [email: :string, password: :string])

    email = Keyword.get_lazy(switches, :email, fn -> ExPrompt.string_required("Email: ") end)
    password = Keyword.get_lazy(switches, :password, fn -> ExPrompt.password("Password: ") end)

    params = %{
      email: email,
      password: password,
      roles: ["admin", "owner"]
    }

    case Accounts.register_user(params) do
      {:ok, user} ->
        user

      {:error, %{errors: errors} = _changeset} ->
        Logger.error(inspect(errors))
    end
  end
end
