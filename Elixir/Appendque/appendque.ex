defmodule Appendque do

  def app_queue({:queue, [f1| l1]}, {:queue, [f2| l2]}) do

    append(f1, reverse(l1))
    append(l2, reverse(f2))

  end

  def append(list1, []) do list1 end
  def append([], list2) do list2 end
  def append(elem1, elem2) do
      [elem1] ++ [elem2]
  end

  def reverse([]) do [] end
  def reverse([head | tail]) do
    reverse(tail) ++ [head]
  end




end
