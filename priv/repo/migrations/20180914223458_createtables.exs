defmodule PGCon.Repo.Migrations.Createtables do
  use Ecto.Migration

  def change do
    create table("transactions") do
      add(:uuid, :uuid)
      timestamps()
    end
  end
end
