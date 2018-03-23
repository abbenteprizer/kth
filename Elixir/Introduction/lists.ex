defmodule Lists do

    def nth(n,l) do
        case n do
        n when n > 0 -> nth(n-1,tl(l))
        n when n == 0 -> hd(l)
        end
    end

    def len(l) do
      length(l)
    end

    def len2(l) do
      case l do
        [] -> 0
        _ -> 1 + len2(tl(l))
      end
    end

    def len3([]) do 0 end
    def len3([_head | tail]) do 1 + len(tail) end

    def sum(l) do
      case l do
        [] -> 0
        _ -> hd(l) + sum(tl(l))
      end
    end

    def sum2([]) do 0 end
    def sum2([head | tail]) do head + sum2(tail)

    end

    def duplicate([]) do [] end #Since we don't want 0 as an element
    def duplicate([head|tail]) do [head, head | duplicate(tail)] end
    # If we had only head|tail in the recursion we would just return l

    def add(x,[]) do [x] end #Returns x at and of the list
    def add([x,x|tail]) do [x|tail] end #returns l if we find x
    def add(x,[head|tail]) do [head|add(x,tail)] end #recursion

    def remove(x,[]) do [] end
    def remove(x,[x|tail]) do tail end
    def remove(x,[head|tail]) do [head|remove(x,tail)] end

    def unique([]) do [] end
    def unique([head|tail]) do [head|remove(head,unique(tail))] end

    def pack(l) do [] end # Not finished with this


#  Has time squared time complexity -> really bad
#  Since it copies the left operand of "++"
    def reverse([]) do [] end
    def reverse([head|tail]) do reverse(tail) ++ [head] end

    def naive_but_ok_reverse(l) do
      naive_but_ok_reverse(l, [])
    end

    def naive_but_ok_reverse([h|t], ack) do
      naive_but_ok_reverse(t, [h]++ack)
    end

    # def naive_but_ok_reverse([h|t], ack) do
    #   naive_but_ok_reverse(t, [h|ack])
    # end

    def naive_but_ok_reverse([]) do [] end
    def naive_but_ok_reverse([],ack) do ack end







end
