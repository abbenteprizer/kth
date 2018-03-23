defmodule Sesame do

  def init() do
    spawn_link(fn() -> start()end)
  end


  def start() do
    receive do
      "s" -> s()
      _ -> start()
    end
  end

  def s() do
    IO.puts("you're now in s()")
    receive do
      "e" -> se()
      "s" -> s()
      _ -> start()
    end
  end

  def se() do
  #not implemented
  end

# and so on...

end
