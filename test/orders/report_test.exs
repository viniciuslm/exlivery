defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "create the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "02577788614,pizza,2,35.5japonesa,3,20.50,132.50\n" <>
          "02577788614,pizza,2,35.5japonesa,3,20.50,132.50\n"

      assert response == expected_response
    end
  end
end
