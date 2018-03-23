defmodule Brot do
  def mandelbrot(c, m) do
  z = Cmplx.new(0,0)
  i = 0
  test(i, z, c, m)
  end

  def test(i, _z, _c, m) when i == m do 0 end
  def test(i, z, c, m) do
    a = Cmplx.abs(z)
    z_next = Cmplx.sqr(z)

    if a <= 2 do
      test(i + 1, Cmplx.add(z_next, c), c, m)
    else
      i
    end

  end


end
