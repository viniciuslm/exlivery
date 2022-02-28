defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Vinicius",
        address: "Rua Cassiano Campolina, 141",
        email: "viniciuslm@gmail.com",
        cpf: "1234567900",
        age: 44
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "Success an create or update the user"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Vinicius",
        address: "Rua Cassiano Campolina, 141",
        email: "viniciuslm@gmail.com",
        cpf: "1234567900",
        age: 10
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
