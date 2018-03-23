defmodule Sorting do

  def insert(x,[]) do [x] end #Puts first element in list
  def insert(x,[head|tail]) when x < head do
    [x,head|tail]
  end
  def insert(x,[head|tail]) do
      [head|insert(x,tail)]
  end

  def isort(l) do isort(l, []) end
  def isort([], sorted) do sorted end
  def isort([head | tail], sorted) do
    isort(tail, insert(head, sorted))
  end


  def msort(l) do
    case l do
      [] -> []
      [x] -> [x]
      _ ->
        {left, right} = msplit(l, [], [])
        merge(msort(left), msort(right))
    end
  end
  # def msort([]) do [] end
  # def msort([x]) do [x] end
  # def msort(l) do
  #   {left, right} = msplit(l, [], [])
  #   merge(msort(left), msort(right))
  # end

  def merge(left,[]) do left end
  def merge([],right) do right end
  def merge([left|lt], [right|rt]) when left < right do
      [left | merge(lt,[right|rt])]
  end
  def merge([left|lt], [right|rt]) do
      [right | merge([left|lt],rt)]
  end

#Takes the list and two (possibly empty) lists as argument
  def msplit([],left,right), do: {left, right}
  def msplit([element|rest], left, right) do
      msplit(rest, [element|right], left)
  end


  def qsort([]) do [] end
  def qsort([p |l]) do
    {small, large} = qsplit(p, l, [], [])
    small = qsort(small)
    large = qsort(large)
    append(small, [p| large])
  end

  def qsplit(_, [], small, large) do {small, large} end
  def qsplit(p, [h | t], small, large) do
    if h < p do
      qsplit(p, t, [h | small], large)
    else
      qsplit(p, t, small, [h | large])
    end
  end

  def append(small, large) do
    case small do
      [] -> large
      [h | t] -> [h | append(t, large)]
    end
  end

  def nreverse([]) do [] end
  def nreverse([h|t]) do
    r = nreverse(t)
    append(r, [h])
  end

  def reverse(l) do
    reverse(l, [])
  end
  def reverse([], r), do: r
  def reverse([h | t], r) do
    reverse(t, [h | r])
  end


end
