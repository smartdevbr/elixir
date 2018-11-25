defmodule IconeIdentidade do
  @moduledoc """
  Documentation for IconeIdentidade.
  """


  def main(input) do
    input
    |> hash_input
    |> criar_cor
  end

  def criar_cor(imagem) do
     %IconeIdentidade.Imagem{hex: hex_list} = imagem
     [r, g, b | _tail] = hex_list
     [r, g, b]
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    %IconeIdentidade.Imagem{hex: hex}
  end

end
