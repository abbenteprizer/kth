defmodule M do
    def main do
        name = IO.gets("what is your name? ") |> String.trim
        IO.puts "hello #{name}"
        
    end

    def init do
    data_stuff()
    end

    def data_stuff do
       my_str = "my sentence"
       IO.puts "Length : #{String.length(my_str)}"
       longer_str = my_str <> " " <> "is longer"
       IO.puts "long length : #{String.length(longer_str)}"
       IO.puts " Equal : #{"egg" === "egg"}"
       IO.puts "my ? #{String.contains?(my_str, "my")}"
       IO.puts "first = #{String.first(my_str)}"
       IO.puts "index 4 : #{String.at(my_str,4)}"
       IO.puts "slice : #{String.slice(my_str,3,7)}"

       IO.inspect String.split(longer_str, " ")

       IO.puts String.reverse(longer_str)
       IO.puts String.capitalize(longer_str)
       4 * 10 |> IO.puts
       
    end

    def mathstuff do
        IO.puts "5+4 = #{5+4}"
        IO.puts "5-4 = #{5-4}"
        IO.puts "5*4 = #{5*4}"
        IO.puts "5/4 = #{5/4}"
        IO.puts "div(5,4) = #{div(5,4)}"
        IO.puts "rem(5,4) = #{rem(5,4)}"
    end

    def tests do
        IO.puts "4 == 4.0 : #{4 == 4.0}"
        IO.puts "4 === 4.0 : #{4 === 4.0}"
        IO.puts "4 != 4.0 : #{4 != 4.0}"
        IO.puts "4 !== 4.0 : #{4 !== 4.0}"    
        IO.puts "5 > 4 : #{5 > 4}"    

        case 2 do
            1 -> IO.puts "enterded 1"
            2 -> IO.puts "entered 2"
            _ -> IO.puts "default"
        end
        age = 17
        IO.puts "ternary : #{if age > 18, do: "can vote", else: "cant vote"}"

        
    end

    def tuples do
        my_stats = {173,5.3,:albert}

        IO.puts "tuple #{is_tuple(my_stats)}"

        mystats2 = Tuple.append(my_stats, 29)

        IO.puts "hej #{elem(mystats2,3)}"

        IO.puts "size : #{tuple_size(mystats2)}"

        mystats3 = Tuple.delete_at(mystats2,0)
        IO.puts "#{elem(mystats3,0)}"

        mystats4 = Tuple.insert_at(mystats3 , 0, 24)

        many_zeroes = Tuple.duplicate(0,5)


    end
 
    def listf do
        list1 = [1,2,3]
        list2 = [2,4,5]

        list3 = list1 ++ list2

        IO.puts 6 in list2

        [head | tail] = list3
        IO.puts "head: #{head}"
        IO.write "tail"
        IO.inspect tail
    end

    def display_list([word|words]) do
        IO.puts word
        display_list(words)
    end
    def display_list([]), do: nil

    def mapsnstuff do
        bättre = %{"kista" => "sollentuna", "sollentuna"=>"slyte"}
        IO.puts"bättre än kistaskräp #{bättre["kista"]}"
    
        bättre2 = %{:kista => :sollentuna, :sollentuna =>:slyte}
        IO.puts"bättre än kistaskräp #{bättre2[:sollentuna]}"

        capitals = %{sverige: "stockholm", skåne: "köpenhamn"}
        IO.puts "skånes huvudstad är : #{capitals.skåne}"
    end

    def pmatch do
        [length,width] = [20,40]
        IO.puts "width #{width}"

        [_, [_, a]] = [20,[30,40]]
        IO.puts "get num : #{a}"
    end
    
    def anonf do
        get_sum = fn(x,y) -> x+y end

        IO.puts "5+5 = #{get_sum.(5,5)}"

        get_less = &(&1-&2)

        IO.puts "5-3 : #{get_less.(5,3)}"


        add_sum = fn
            {x,y}-> IO.puts "#{x} + #{y} = #{x+y}"
            {x,y,z} -> IO.puts "#{x} + #{y} + #{z} = #{x+y+z}"
        end

        add_sum.({1,2,3})

        IO.puts do_it()

    end

    def do_it(x \\ 1, y \\ 1 ) do 
        x+y
    end


    def recurs do

        IO.puts "factorial #{factorial(4)}"
        IO.puts "factorail #{factorial(4)}"

    end
    def factorial(n) do
        case n do
        0 -> 1
        _ -> n * factorial(n-1)
        end
    end

    def factorail2(num) do
        if num <= 1 do 1
        else
        result = num * factorail2(num-1)
        result
        end
    end


    def looping do
        
        IO.puts "sum : #{sum([1,2,3])}"

        loop(5,1)
    end

    def sum([]), do: 0

    def sum([h|t]), do: h + sum(t)

    def loop(0,_), do: nil
    def loop(max, min) do
        if max < min do
            loop(0,min)
            else
            IO.puts " num : #{max}"
            loop(max-1,min)
        end
    end

    def enums do
        IO.puts "all Even list : #{Enum.all?([1,2,3],
        fn(n) -> rem(n,2) == 0 end)}"

        IO.puts "any Even list : #{Enum.any?([1,2,3],
        fn(n) -> rem(n,2) == 0 end)}"

        Enum.each([1,2,3], fn(n) -> IO.puts n end)

        dbl_list = Enum.map([1,2,3], fn(n) -> n* 2 end)
        IO.inspect dbl_list

        sum_vals = Enum.reduce([1,2,3], fn(n,sum) -> n+sum end)
        IO.puts "sum: #{sum_vals}"   

        IO.inspect Enum.uniq([1,2,2])     
    end

    def advlist do

        dbl_list = for n <- [1,2,3], do: n*2
        IO.inspect dbl_list

        even_list = for n <- [1,2,3,4], rem(n,2) == 1, do: n
        IO.inspect even_list
    end

    def exceptions do
        err = try do
            5/0

        rescue
            ArithmeticError -> "cant divide zero"
        end
        
        IO.puts err
    end

    def conc do
        spawn(fn() -> loop(50,1) end)
        spawn(fn() -> loop(100,50) end)
        name = "Albert"
        send(self(), {:french, "bob"})

        receive do
            {:german, name} -> IO.puts "guten tag #{name}"
            {:french, name} -> IO.puts "bonjour #{name}"

            after
            500 -> IO.puts "time up"
        end
    end
end

