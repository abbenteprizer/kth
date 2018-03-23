defmodule Eager do
  def eval_expr({:atm, id}, _,_) do
    {:ok, id}
  end
  def eval_expr({:var, id}, env, _) do
    case Env.lookup(id,env) do
      nil -> :error
    end
      ...
        {_, str} ->
      ...
  end
end
def eval_expr({:cons, he, te}, env, prg) do
  case eval_expr(..., ...) do
    :error -> :error
    {:ok, ...} ->
    case eval_expr(..., ...) do
      :error -> ...
      {:ok, ts} ->  ...
    end
  end
end
