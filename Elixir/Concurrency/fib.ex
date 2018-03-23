defmodule Fib do

  def sequential(n) do
    {t, f} = :timer.tc(fn() -> seq(n)end)
    IO.puts("answer is = #{f} and it took #{{:Trunc(t / 1000)}} ms")
  end

  def seq(0) do 0 end
  def seq(1) do 1 end
  def seq(n) do
    seq(n-1) + seq(n-2)
  end

  def comb(0, _) do 0 end
  def comb(1, _) do 1 end
  def comb(n, k) when n < k do
    seq(n)
  end


  def par(0) do 0 end
  def par(1) do 1 end
  def par(n) do
    r1 = parallel(fn() -> par(n-1) end)
    r2 = parallel(fn() -> par(n-2) end)
    f1 = collect(r1)
    f2 = collect(r2)
    f1 + f2
  end

  def parallel(f) do
    ref = make_ref()
    me = self()
    spawn(fn() ->
      res = f.()
      send(me, {:par, ref, res})
    end)
  end

  def collect(ref) do
    receive do
      {:par, ^ref, res} -> res
    end
  end

end
