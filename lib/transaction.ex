defmodule PGCon.Transaction do
  import Ecto.Changeset
  use Ecto.Schema

  schema "transactions" do
    field(:uuid, Ecto.UUID)
    timestamps()
  end

  def create_changeset(struct, params) do
    struct
    |> cast(params, [:uuid])
    |> validate_required([:uuid])
  end
end
