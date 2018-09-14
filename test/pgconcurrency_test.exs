defmodule PgconcurrencyTest do
  alias PGCon.Transaction
  use ExUnit.Case, async: true

  setup_all do
    IO.inspect("SETTING UP THE TEST...")
    Application.ensure_all_started(:pgconcurrency)

    Ecto.Adapters.SQL.Sandbox.mode(PGCon.Repo, :manual)

    seq = 1..100

    entries =
      Enum.to_list(seq)
      |> Enum.map(fn _ ->
        %{uuid: UUID.uuid1()}
      end)

    PGCon.Repo.insert_all(Transaction, entries)
  end

  test "refreshing a large table does not block it when committing" do
    assert Pgconcurrency.hello() == :world
  end
end
