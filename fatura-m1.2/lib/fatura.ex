defmodule Fatura do
  def criar_fatura do
    ["Telefone", "Luz", "Agua"]
  end

  def ordena_fatura(faturas) do
    Enum.sort(faturas)
  end
end