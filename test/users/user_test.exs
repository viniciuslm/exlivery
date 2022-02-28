defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params valid, retunrs the user" do
      response =
        User.build(
          "Rua Cassiano Campolina, 141",
          "Vinicius",
          "viniciuslm@gmail.com",
          "02577788614",
          44
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when the are invalid params, retunrs an error" do
      response =
        User.build(
          "Rua Cassiano Campolina, 141",
          "Vinicius Moreira",
          "viniciuslm@gmail.com",
          "02577788614",
          15
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
