defmodule Cmplx do

  def new(r, i) do
    {r, i}
  end

  def add({rea, ima}, {reb, imb}) do
    {rea + reb, ima + imb}
  end

# Squares complex number
  def sqr({rea, ima}) do
    {rea * rea - ima * ima, 2 * rea * ima}
  end

  def abs({rea, ima}) do
    :math.sqrt(rea * rea + ima * ima)
  end
end
