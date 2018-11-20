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

  @doc """
    Ao receber `faturas` e um elemento de `fatura` retorna se existe ou não
      ## Exemplos
      iex> Fatura.fatura_existe?(Fatura.criar_fatura(["Telefone", "Agua", "Luz"]), "Luz")
      true
  """
  def fatura_existe?(faturas, fatura) do
    Enum.member?(faturas, fatura)
  end

  
end