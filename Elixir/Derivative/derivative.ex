defmodule Derivative do
  @type literal() :: {:const, number()}
                  | {:const, atom()}
                  | {:var, atom()}

  @type expr() :: {:add, expr(), expr()}
                | {:mul, expr(), expr()}
                | literal()

  def test() do test = {:add, {:mul, {:const, 2}, {:mul, {:mul,{
    {:var,:v}, {:var, :v}}}, {:var, :v}}}, {:add, {:mul, {:const, 3},
    {:var, :v}}, {:const, 5}}}
    deriv(test, :v)
  end

  def test2() do test2 = {:add, 4, {:mul, {:const, 2}, {:var, :v}}} end
  def d(t) do deriv(t, :v) end


  def deriv({:const, _}, _), do: {:const, 0}
  def deriv({:var, v}, v), do: {:const, 1}
  def deriv({:var, y}, _), do: {:var, y}
  def deriv({:add, e1, e2}, v) do
    {:add, deriv(e1, v), deriv(e2, v)}
  end
  def deriv({:mul, e1, e2}, v) do
    {:add, {:mul, e1, deriv(e2, v)}, {:mul, e2, deriv(e1, v)}}
  end
  def deriv({:exp, {:var, v}, {:const, c}}, v) do
    {:mul, {:const, c}, {:exp, {:var, v}, {:const, c - 1}}}

    {:mul, {:const, c}, {:exp, {:var, v}, {:const, c - 1}}}
  end

end
