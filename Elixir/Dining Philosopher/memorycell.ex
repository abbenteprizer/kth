defmodule Memorycell do

  def start do
    spawn_link(fn -> loop(%{} ) end )
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, {:ok, Map.get(map, key)})
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end

  def getval(pid, key) do
    send(pid, {:get, key, self()})
    receive do
      {:ok, val} -> val
    end
  end

  def tellme(pid) do
    send(pid, {:return, self()})
    receive do
      {:ok, sum} -> sum
    end
  end

  def sumstart do
    spawn_link(fn -> sum(10) end )
  end
  def sum(s) do
    receive do
      {:add, x} -> sum(s + x)
      {:return, from} -> send(from, {:ok, s})
    end
  end

end
