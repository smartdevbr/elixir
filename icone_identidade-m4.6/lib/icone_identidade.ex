defmodule IconeIdentidade do
  @moduledoc """
  
  Módulo para criar um icone de identidade, ao passar uma `String qualquer` é gerado uma imagem através do que for imputado
  """

  @doc """
    Ao passar um valor para `input` gera uma imagem e retorna `:ok`
      ##Exemplo 
      iex> IconeIdentidade.main("Elixir")
      :ok
  """
  def main(input) do
    input
    |> hash_input
    |> criar_cor
    |> criar_tabela
    |> remover_impar
    |> constroi_pixel
    |> desenhar
    |> salvar(input)
  end

  @doc """
    salva a Imagem
  """
  def salvar(imagem, input) do
    File.write("#{input}.png", imagem)
  end

  @doc """
    Gera um binario da imagem
  """
  def desenhar(%IconeIdentidade.Imagem{color: cor, pixel_map: pixel_map}) do
    imagem = :egd.create(250, 250)
    preencha = :egd.color(cor)

    Enum.each pixel_map, fn{start, stop} -> 
      :egd.filledRectangle(imagem, start, stop, preencha)
    end
    :egd.render(imagem)
  end

  @doc """
    Ao passar um valor para uma estrutura de `imagem` que é `%IconeIdentidade.Imagem{}` com as informacoes do `hex` gera 
    a cor
      ##Exemplo 
        iex> IconeIdentidade.criar_cor(%IconeIdentidade.Imagem{color: nil, grid: nil, hex: [161, 46, 176, 98, 236, 169, 209, 230, 198, 159, 207, 139, 96, 55, 135, 195], pixel_map: nil}).color
        {161, 46, 176}
  """
  def criar_cor(%IconeIdentidade.Imagem{hex: [r, g, b | _tail]} = imagem) do
    %IconeIdentidade.Imagem{imagem | color: {r,g,b} }
  end

  @doc """
    Constroi os pixels para gerar a imagem
  """
  def constroi_pixel(%IconeIdentidade.Imagem{grid: grid} = imagem) do
    pixel_map = Enum.map grid, fn{_valor, indice} -> 
      h = rem(indice, 5) * 50
      v = div(indice, 5) * 50
      t_esquerda = {h, v}
      i_direita = {h+50, v+50}
      {t_esquerda, i_direita}
    end
    %IconeIdentidade.Imagem{imagem | pixel_map: pixel_map}
  end

  @doc """
    Ao passar um valor para uma estrutura de `imagem` que é `%IconeIdentidade.Imagem{}` com as informacoes do `hex` gera 
    o grid e para verificar se o grid foi inserido basta consultar o grid
      ##Exemplo 
        iex>IconeIdentidade.criar_tabela(%IconeIdentidade.Imagem{color: {161, 46, 176}, grid: nil, hex: [161, 46, 176, 98, 236, 169, 209, 230, 198, 159, 207, 139, 96, 55, 135, 195], pixel_map: nil}).grid
        [
          {161, 0},
          {46, 1},
          {176, 2},
          {46, 3},
          {161, 4},
          {98, 5},
          {236, 6},
          {169, 7},
          {236, 8},
          {98, 9},
          {209, 10},
          {230, 11},
          {198, 12},
          {230, 13},
          {209, 14},
          {159, 15},
          {207, 16},
          {139, 17},
          {207, 18},
          {159, 19},
          {96, 20},
          {55, 21},
          {135, 22},
          {55, 23},
          {96, 24}
        ]
  """
  def criar_tabela(%IconeIdentidade.Imagem{hex: hex} = imagem) do
    grid = hex
    |> Enum.chunk(3)
    |> Enum.map(&espelhar/1)
    |> List.flatten
    |> Enum.with_index

    %IconeIdentidade.Imagem{imagem | grid: grid}
  end

  @doc """
    Função será chamado após ter a tabela, ao ser chamada irá remover todos os números impares da `grid`
  """
  def remover_impar(%IconeIdentidade.Imagem{grid: grid} = imagem) do
    new_grid = Enum.filter grid, fn {valor, _indice}  -> 
      rem(valor, 2) == 0
    end
    %IconeIdentidade.Imagem{ imagem | grid: new_grid}
  end

  @doc """
    Ao passar um array deve espelhar as duas primeiras posicoes
      ##Exemplo 
      iex> IconeIdentidade.espelhar([1,2,3])
      [1, 2, 3, 2, 1]
  """
  def espelhar(linha) do
    [pri, sec | _tail] = linha
    linha ++ [sec, pri]
  end

  @doc """
    Ao passar um valor para `input` gera uma imagem e retorna `ok`
      ##Exemplo 
      iex> IconeIdentidade.hash_input("Elixir")
      %IconeIdentidade.Imagem{
        color: nil,
        grid: nil,
        hex: [161, 46, 176, 98, 236, 169, 209, 230, 198, 159, 207, 139, 96, 55, 135,
        195],
        pixel_map: nil
      }
  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    %IconeIdentidade.Imagem{hex: hex}
  end

end
