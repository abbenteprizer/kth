defmodule h do

  def text, do: 'this is something we should encode'

  def tree do

  end

  def encode_table(tree) do
      encode_table(tree, [])
  end

  def encode_table({a,b}, path) do
      ta = encode_table(a, [0|path]) # should be path ++ [0] but we can
      tb = encode_table(a, [1|path]) # reverse it instead
      ta ++ tb
  end
  def encode_table(char,path) do
    [{char, reverse(path)}]
  end

  def reverse(seq) do Enum.reverse(seq) end
end
