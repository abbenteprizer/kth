def huffman_tree([{tree,_}]), do: tree
def huffman_tree([{a,af},{b,bf}|rest]) do
  huffman_tree(build_tree({{a,b},af+bf},rest))
end

def build_tree({a, af}, []), do: [{a, af}]
def build_tree({a, af}, [{b, bf} | rest]) when af < bf do
  [{a, af}, {b, bf} | rest]
end
def build_tree({a, af}, [{b, bf} | rest]) do
  [{b, bf} | build_tree({a, af}, rest)]
end
