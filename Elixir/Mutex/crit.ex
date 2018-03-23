defmodule Crit do

  def do_it(thing, lock) do
    case Cell.get(lock) do
      :taken ->
        do_it(thing, lock)
      :open ->
        Cell.set(lock, :taken)
        do_ya_critical_thing(thing)
        Cell.set(lock, :open)
    end
  end

  def do_ya_critical_thing(thing) do
    IO.puts("This is a critcal operation #{thing}")
  end

end
