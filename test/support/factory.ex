defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Vinicius",
      email: "viniciuslm@gmail.com",
      cpf: "02577788614",
      age: 44,
      address: "Rua Cassiano Campolina, 141"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de Peperoni",
      category: :pizza,
      unit_price: Decimal.new("35.5"),
      quantity: 2
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua Cassiano Campolina, 141",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de Salmão",
          category: :japonesa,
          unit_price: Decimal.new("20.50"),
          quantity: 3
        )
      ],
      total_price: Decimal.new("132.50"),
      user_cpf: "02577788614"
    }
  end
end
