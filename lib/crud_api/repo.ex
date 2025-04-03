defmodule CrudApi.Repo do
  use Ecto.Repo,
    otp_app: :crud_api,
    adapter: Ecto.Adapters.SQLite3
end
