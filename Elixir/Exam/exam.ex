defmodule Exam do

  ###2017-06-07###

  #2.1 Works now
  def transf(_,_,[]) do [] end
  def transf(x,y,[h|t]) do
    case x do
      ^h -> transf(x,y,t)
      _ -> [y*h | transf(x,y,t)]
    end
  end


  # Works
  # def transf(_,_,[]) do [] end
  # def transf(x,y,[x|r]) do transf(x,y,r) end
  # def transf(x,y,[h|r]) do [h * y | transf(x,y,r)] end


  #2.2
  # Not tail recursive
  def sum([]) do 0 end
  def sum([h|t]) do h + sum (t) end

  # Tail recursive
  def sumt(l) do sumt(l, 0) end
  def sumt([], s) do s end
  def sumt([h|t], s) do
    sumt(t, h+s)
  end

  #2.3 Not finished
  # def min(tree) do min(tree, :inf) end
  # def min({node, value, left, right}, m) do
  #   if value < m do
  #     min(left, min(right, value))
  #   else
  #     min(left, min(right, m))
  #   end
  #   # min(node, value, left, right)
  # end


@spec fib(integer()) :: integer()
def fib(0) do 0 end
def fib(1) do 1 end
def fib(n) do
  fib(n-1) + fib(n-2)
end

def test() do
  fib(:banan)
end


end
