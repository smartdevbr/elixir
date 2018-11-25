defmodule FaturaTest do
  use ExUnit.Case
  doctest Fatura

  test "deve criar uma lista de faturas" do
    faturas = Fatura.criar_faturas(["Telefone"], [5, 10])
    assert faturas == [
      %Fatura.Conta{fatura: "Telefone", vencimento: 5},
      %Fatura.Conta{fatura: "Telefone", vencimento: 10}
    ]
  end

  test "deve ordenar uma lista de faturas" do
    faturas = Fatura.criar_faturas(["Telefone", "Agua"], [5])
    refute Fatura.ordena_fatura(faturas) == [
      %Fatura.Conta{fatura: "Telefone", vencimento: 5},
      %Fatura.Conta{fatura: "Agua", vencimento: 5}
    ]
  end

  test "deve verificar se a conta existe" do
    faturas = Fatura.criar_faturas(["Telefone", "Agua"], [5, 10])
    assert Fatura.fatura_existe?(faturas,  %Fatura.Conta{fatura: "Telefone", vencimento: 5}) == true
  end

end
