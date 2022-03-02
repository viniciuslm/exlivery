defmodule Exlivery.Users.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, returns an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Temaki de Salmão",
          category: :japonesa,
          unity_price: Decimal.new("20.50"),
          quantity: 3
        )
      ]

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      user = build(:user)

      items = []

      response = Order.build(user, items)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
