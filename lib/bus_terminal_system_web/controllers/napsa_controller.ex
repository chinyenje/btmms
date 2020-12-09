defmodule BusTerminalSystemWeb.NapsaController do
  use BusTerminalSystemWeb, :controller

  @valid_contribution_params %{

      "provider_id"  => :string,
      "employer_account_number"  => :string,
      "year"  => :string,
      "month"  => :string,
      "principal_amount"  => :string,
      "penalty_amount"  => :string,
      "total_amount"  => :string,
      "number_of_employees"  => :string,

      "ssn" => :string,
      "national_id" => :string,
      "surname" => :string,
      "firstname" => :string,
      "othername" => :string,
      "date_of_birth" => :string,
      "gross_wage" => :string,
      "employee_share" => :string,
      "employer_share" => :string,
      "siebel_id" => :string

  }

  def connect(conn, params \\ %{}) do
    Skooma.valid?(params, @valid_contribution_params) |> case do
      :ok -> json(conn, %{status: 0, message: "SUCCESS", reason: ""})
      {:error, message} -> json(conn, %{status: 1, message: "FAILED", reason: message})
    end
  end
  
end