defmodule IconeIdentidadeTest do
  use ExUnit.Case
  doctest IconeIdentidade

  test "deve verificar se executou corretamente o main" do
    assert IconeIdentidade.main("Elixir") == :ok
  end

  test "deve criar a estrutura de imagem  com o hexadecimal" do
      [p | _tail] = IconeIdentidade.hash_input("Elixir").hex
      assert p == 161
  end

  test "deve verificar se a cor foi criada " do
    cor = IconeIdentidade.criar_cor(%IconeIdentidade.Imagem{color: nil, grid: nil, 
        hex: [161, 46, 176, 98, 236, 169, 209, 230, 198, 159, 207, 139, 96, 55, 135, 195], 
        pixel_map: nil}).color
    assert {161, 46, 176} == cor
  end

  test "deve criar a tabela do grid" do 
    [p1 | _tail] = IconeIdentidade.criar_tabela(%IconeIdentidade.Imagem{color: {161, 46, 176}, grid: nil, hex: [161, 46, 176, 98, 236, 169, 209, 230, 198, 159, 207, 139, 96, 55, 135, 195], pixel_map: nil}).grid
    assert p1 == {161, 0}  
  end

  test "deve verificar se alguma posicao do grid é par" do
    novo_icone = %IconeIdentidade.Imagem{color: {161, 46, 176}, grid: nil, 
    hex: [161, 46, 176, 98, 236, 169, 209, 230, 198, 159, 207, 139, 96, 55, 135, 195], pixel_map: nil}
    
    novo_icone = 
    IconeIdentidade.criar_tabela(novo_icone)
    |> IconeIdentidade.remover_impar

    [item | _tail] = novo_icone.grid
    {valor, _indice} = item
    assert rem(valor, 2) == 0
  end

  test "verifica se condiz o valor do pixel 1 com  o esperado" do
    novo_icone = %IconeIdentidade.Imagem{color: {161, 46, 176}, grid: nil, 
    hex: [161, 46, 176, 98, 236, 169, 209, 230, 198, 159, 207, 139, 96, 55, 135, 195], pixel_map: nil}
    
    novo_icone = 
    IconeIdentidade.criar_tabela(novo_icone)
    |> IconeIdentidade.remover_impar
    |> IconeIdentidade.constroi_pixel

    [pixel_f | _tail] = novo_icone.pixel_map

    assert {{50, 0}, {100, 50}} == pixel_f
    end


end