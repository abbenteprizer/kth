defmodule Huffman do
  def sample do
    'the quick brown fox jumps over the lazy dog
    this is a sample text that we will use when we build
    up a table we will only handle lower case letters and
    no punctuation symbols the frequency will of course not
    represent english but it is probably not that far off'
  end

  def text, do: 'this is something that we should encode'
  def test do
    sample = sample()
    tree = huffman_tree(sort(tree(text)))

    encode = encode_table(tree)
    #decode = decode_table(tree)
    text = text()
    seq = encode(text, encode)
    decode(seq, encode)#changed from decode
  end

  def tree(sample) do
    freq = freq(sample)
    #huffman(freq)
  end


#Computes the frequencies for all characters used in sample
  def freq(sample) do freq(sample, %{}) end
  def freq([],freq) do freq end
  def freq([char|rest], freq) do
    freq(rest, Map.put(freq, char, Map.get(freq,char,0) + 1))
#Map.get gets the current value for the char in the map freq
  end


#Sorts the set of tuples
  def sort(freq) do #freq as argument
    l = Map.to_list(freq) # converts to list of tuples
    sortList([],l) # sorts in ascending frequency
  end

  def insert(x,[]) do [x] end #Puts first element in list
  def insert({key1,val1}, [{key2,val2}|rest]) do
    if val2 >= val1 do
      [{key1,val1}|[{key2,val2}|rest]]
    else
      [{key2,val2}|insert({key1,val1},rest)]
    end
  end

  def sortList(l,[]) do
    l # Returns the sorted list
  end
  def sortList(l, [head|tail]) do
    insert(head,l) |> sortList(tail)
  end
  def sortList([],[head|tail]) do
    sortList([head],tail)
  end

  #Ordered freq as argument
  def huffman_tree([tree]) do tree end #when everything is in one tuple
  def huffman_tree([{key1,val1}|[{key2,val2}|tail]]) do
    node = {{{key1,val1},{key2,val2}},val1+val2}
    insert(node,tail) |>huffman_tree()
  end



  def encode_table(tree,code) do
    case tree do

      {{left,right},_} -> encode_table(left,[0|code]) ++ encode_table(right,[1|code])
      {char,_} when is_integer(char) -> [{char,Enum.reverse(code)}]
      end
  end
  def encode_table(tree) do
    encode_table(tree,[])
  end

  #def decode_table(tree) do
#    #implement
#  end

#takes text and encode table
  def encode([hd|tl], table) do
    findcode(hd,table) ++ encode(tl,table)
  end
  def encode([],_) do [] end
#char and encoding table as argument
  def findcode(char,[min|rest]) do
    {char2,code} = min
    if char == char2 do
      code
    else
      findcode(char,rest)
    end
  end
  def findcode(char,[]) do
    :"char not in table"
  end


  def decode([], _), do: []
  def decode(seq, table) do
    {char, rest} = decode_char(seq, 1, table)
    [char | decode(rest, table)]
  end
  def decode_char(seq, n, table) do
    {code, rest} = Enum.split(seq, n)
    case List.keyfind(table, code, 1) do
      {char, _} -> {char,rest}
      nil -> decode_char(rest, n+1, table)
    end
  end
# def decode(seq, tree), do: decode(seq, tree, tree)
# def decode([], char, _), do: [char]
# def decode([0 | seq], {left, _}, tree) do
#   decode(seq, left, tree)
# end
# def decode([1 | seq], {_, right}, tree) do
#   decode(seq, right, tree)
# end
# def decode(seq, char, tree) do
#   [char|decode(seq,tree,tree)]
#  end
########################
#From seminar
#def encode([], _) do [] end
#def encode([char|rest], table) do
#  seq = lookup(char, table)
#  seq ++ encode(rest, table)
#end
#
#def lookup(char, [{char,seq}|_]) do seq end
#def lookup(char, [_|rest]) do
#  lookup(char, rest)
#end




#  def decode(seq, tree) do
#  # To implement...
#  end
end
