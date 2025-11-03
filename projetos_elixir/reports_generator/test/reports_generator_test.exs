defmodule ReportsGeneratorTest do
  use ExUnit.Case
  doctest ReportsGenerator

  describe "build/1" do
    test "build the report"
    file_name = "report_test.csv"

    response = ReportsGenerator.build(file_name)

    expected_response = "GabirU"

    assert response == expected_response
  end
end
