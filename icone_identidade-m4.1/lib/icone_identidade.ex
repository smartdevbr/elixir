defmodule IconeIdentidade do
  @moduledoc """
  Documentation for IconeIdentidade.
  """


  def main(input) do
    input
    |> hash_input
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    %IconeIdentidade.Imagem{hex: hex}
  end

end
