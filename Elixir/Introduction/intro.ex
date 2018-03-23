defmodule Intro do
  def product(0, _) do 0 end
  def product(m, n) do
    n + product(m-1, n)
  end

  def exp(x, y) do
    case y do
      0 -> 1
      _ -> product(x, exp(x, y-1))
    end
  end

  def exp2(_,0) do 1 end
  def exp2(x,y) do
    case rem(y,2) do
      0 -> exp2(x,div(y,2)) * exp2(x,div(y,2))
      1 -> exp2(x,y-1) * x
    end
  end
end
