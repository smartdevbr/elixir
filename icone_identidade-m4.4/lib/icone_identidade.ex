defmodule IconeIdentidade do
  @moduledoc """
  Documentation for IconeIdentidade.
  """


  def main(input) do
    input
    |> hash_input
    |> criar_cor
    |> criar_tabela
  end

  def criar_cor(%IconeIdentidade.Imagem{hex: [r, g, b | _tail]} = imagem) do
    %IconeIdentidade.Imagem{imagem | color: {r,g,b} }
  end

  def criar_tabela(%IconeIdentidade.Imagem{hex: hex} = imagem) do
    hex
    |> Enum.chunk(3)
  end


  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    %IconeIdentidade.Imagem{hex: hex}
  end

end
