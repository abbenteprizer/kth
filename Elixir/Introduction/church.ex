defmodule Church do

    def to_church(0) do
    fn(_,y) -> y end
    end
    def to_church(n) do
        fn(f,x) -> f.( (to_church(n-1)).(f,x) ) end
    end

    def to_integer(church) do
        church.(fn(x) -> 1 + x end, 0)
    end

    def succ(n) do
      fn(f,x) -> f.(n.(f,x) ) end
    end

    def add(n,m) do
        fn(f,x) -> n.(f,m.(f,x)) end
    end

    def mul(n,m) do
      fn(f,x) -> n.( fn(y) -> m.(f,y) end, x) end
    end

    def pred(n) do
      fn(f, x) ->
        ( n.(
          fn(g) -> fn(h) -> h.(g.(f)) end end,
          fn(_) -> x end)
          ).(fn(u) -> u end)
      end
    end
    def pred(n) do
        fn(f, x) ->
              ( n.(                                # n is a Church numeral
          fn(g) -> fn(h) -> h.(g.(f)) end end,     #  apply this function n times
          fn(_) -> x end)                          #  to this function
          ).(fn(u) -> u end)                       # apply it to thee identity function
        end
      end
    end
