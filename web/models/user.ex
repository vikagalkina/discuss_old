defmodule Discuss.User do
  use Discuss.Web, :model

  @derive {Poison.Encoder, only: [:email]}

  schema "users" do
    field :token, :string
    field :email, :string
    field :provider, :string
    has_many :topics, Discuss.Topic
    has_many :comments, Discuss.Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end