defmodule IconeIdentidade.Imagem do

    @moduledoc """
    Define como é a estrutura de uma imagem
    """
    
    @doc """
    Define a estrutura da Imagem

    * :hex - hexadecimal da imagem
    * :cor - a cor da imagem
    * :grid - a grid que gera a imagem
    * :pixel_map - gera onde será preenchido com com a imagem
    """
    defstruct hex: nil, color: nil, grid: nil, pixel_map: nil
end