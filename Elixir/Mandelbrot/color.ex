defmodule Color do
# Calculates color depending on depth
  def convert(depth, max) do
    a = 4 * depth / max
    x = Kernel.trunc(a)
    y = trunc(255 * (a - x))
      case x do
        0 -> {y, 0, 0}
        1 -> {255, y, 0}
        2 -> {255 - y, 255, 0}
        3 -> {0, 255, y}
        4 -> {0, 255 - y, 255}
      end

  end

end
