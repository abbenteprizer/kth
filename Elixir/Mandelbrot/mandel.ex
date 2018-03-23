defmodule Mandel do
  #Good command: c(Path.wildcard("./*.ex"))
  def mandelbrot(width, height, x, y, k, depth) do
    trans = fn(w, h) ->
      Cmplx.new(x + k * (w - 1), y - k * (h - 1))
    end
    rows(width, height, trans, depth, [])
  end


  def rows(_width, 0, _trans, _depth, rows), do: rows
  def rows(w, h, trans, depth, rows) do
    row = row(w, h, trans, depth, [])
    rows(w, h - 1, trans, depth, [row | rows])
  end

  def row(0, _h, _trans, _depth, row), do: row
  def row(w, h, trans, depth, row) do
    c = trans.(w, h) # Complex number of the pixel
    mandel = Brot.mandelbrot(c, depth)
    color = Color.convert(mandel, depth)
    row(w - 1, h, trans, depth, [color | row])
  end


  def demo() do
    small(-2.6, 1.2, 1.2)
  end
  def small(x0, y0, xn) do
    width = 2400
    height = 1600
    depth = 64
    k = (xn - x0) / width
    image = Mandel.mandelbrot(width, height, x0, y0, k, depth)
    # IO.inspect image

    PPM.write("small.ppm", image)
  end
end
