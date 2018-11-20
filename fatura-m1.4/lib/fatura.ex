defmodule Fatura do

  @moduledoc """
    Este módulo executamos funções de faturas
  """
  
  @doc """
    Ao receber `fatura` retorna um array de faturas
      ## Exemplos
      iex> Fatura.criar_fatura(["Telefone", "Agua", "Luz"])
      ["Telefone", "Agua", "Luz"]
  """
  def criar_fatura(fatura) do
   fatura
  end

  @doc """
    Ao receber `fatura` retorna um array de faturas ordenado
      ## Exemplos
      iex> Fatura.ordena_fatura(Fatura.criar_fatura(["Telefone", "Agua", "Luz"]))
      ["Agua", "Luz", "Telefone"]
  """
  def ordena_fatura(faturas) do
    Enum.sort(faturas)
  end
end