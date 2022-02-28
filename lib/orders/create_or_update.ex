defmodule Exlivery.Orders.CreateOrUpdate do
  alias Exlivery.Orders
  alias Exlivery.Users.Agent, as: UserAgent
  alias Orders.Agent, as: OrderAgent
  alias Orders.Item
  alias Orders.Order

  def call(%{user_cpf: user_cpf, items: items}) do
    with {:ok, user} <- UserAgent.get(user_cpf),
         {:ok, items} <- build_items(items),
         {:ok, order} <- Order.build(user, items) do
      OrderAgent.save(order)
    end
  end

  defp build_items(items) do
    items
    |> Enum.map(&build_item/1)
    |> handle_build()
  end

  defp build_item(%{
         description: description,
         category: category,
         unit_price: unit_price,
         quantity: quantity
       }) do
    case Item.bulid(description, category, unit_price, quantity) do
      {:ok, item} -> item
      {:error, _reason} = error -> error
    end
  end

  defp handle_build(items) do
    if Enum.all?(items, &is_struct/1), do: {:ok, items}, else: {:error, "Invalid items"}
  end
end
