defmodule Merge do
#   # def msort(l) do
#   #   case l do
#   #     [] -> []
#   #
#   #     _ ->
#   #       {left, right} = msplit(l, [], [])
#   #       merge(msort(left), msort(right))
#   #   end
#   # end
#   def msort([]) do [] end
#   def msort(_) do
#     {left, right} = msplit(l,[],[])
#     merge(msort(left), msort(right))
#   end
#
#   def merge(left,[]) do left end
#   def merge([],right) do right end
#   def merge([left|lt], [right|rt]) do
#     if left < right
#       [left|merge(lt,right)]
#     else
#       [right|merge(left,rt)]
#     end
#   end
#
# #Takes the list and two (possibly empty) lists as argument
#   # def msplit([element|rest], left, right) do
#   #   case element  do
#   #     [] -> {left, right}
#   #     _  -> msplit(rest, [element|right], left)
#   #   end
#   # end
#   def msplit([], left, right) do {left, right} end
#   def msplit([element|rest], left, right) do
#     msplit(rest, [element|right], left)
#   end


# Returns a sorted list using the merge sort algorithm.
  # def msort([]) do [] end
  # def msort([x]) do [x] end
  # def msort(l) do
  #   {l1, l2} = split(l, [], [])
  #   merge(msort(l1), msort(l2))
  # end
  def msort(l) do
    case l do
      [] -> []

      _ ->
        {left, right} = split(l, [], [])
        merge(msort(left), msort(right))
    end
  end

  # Split a list into two equal sized lists using Enum.
  def split([], l1, l2) do {l1, l2} end
  def split([x | tail], l1, l2) do
    split(tail, [x | l2], l1)
  end

  # Merges two list in order by iterating through them one
  # item at time.
  def merge([], l2) do l2 end
  def merge(l1, []) do l1 end
  def merge([x1 | l1], [x2 | _] = l2) when x1 < x2 do
    [x1 | merge(l1, l2)]
  end
  def merge(l1, [x2 | l2]) do
    [x2 | merge(l1, l2)]
  end

end
