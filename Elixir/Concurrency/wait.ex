defmodule Wait do

  def hello do
    receive do
      x -> IO.puts("hej #{x}")
    end
  end

end
