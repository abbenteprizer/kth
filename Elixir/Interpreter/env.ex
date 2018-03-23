defmodule Env do
  def new() do
    []
  end
  def add(id, str, env) do
    [{id,str}|env]
  end

# takes id and env as argument
  def lookup(id, [head|rest]) do
    {key,value} = head
    case head do
      [] -> :nil
      key -> head
      _ -> lookup(id, rest)
    end
  end

# Takes a list of ids and an env
#  def remove([],_) do [] end
#  def remove(_,[]) do [] end
#  def remove([first_id|rest_id], {key,value}|rest) do
#    case key do
#      first_id ->
#      _ -> remove()
#    end
#    remove(,rest)
#  end

  def remove(ids, env) do
    List.foldr(ids, [], fn(ids,env) ->
      List.keydelete(env,ids,0) end)
  end
end
