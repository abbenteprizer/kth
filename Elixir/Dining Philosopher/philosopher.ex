defmodule Philosopher do

  def start(hunger, right, left, name, ctrl) do
    spawn_link(fn name -> sleep() end)
  end

  def sleep(t) do
    :timer.sleep(:rand.uniform(t))
    
  end

  IO.puts("#{name} received a chopstick!")
end
