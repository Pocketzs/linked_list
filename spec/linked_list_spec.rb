require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  let(list) { LinkedList.new }
  
  context "when a linkedlist is created" do
    it 'exists' do
      expectlist).to be_instance_of(LinkedList)
    end

    it 'has a nil head' do
      expectlist.head).to be nil
    end

    it 'has count 0 to start with' do
      expectlist.count).to eq(0)
    end
  end

  context "when a node is appended" do
    before do
    list.append("doop")
    end
    it 'creates a node and adds to the head' do
      expectlist.head).to be_instance_of(Node)
    end

    it 'has data' do
      expectlist.head.data).to eq("doop")
    end

    it 'has nil for next node' do
      expectlist.head.next_node).to be nil
    end

    it 'counts how many nodes in thelist' do
      expectlist.count).to eq(1)
    end

    it 'generates a string containing data from every node' do
      expectlist.to_string).to eq("doop")
    end
  end

  context "when two nodes are appended" do
    before do
    list.append("doop")
    list.append("deep")
    end

    it 'keeps the first appended node as the head' do
      expectlist.head.data).to eq("doop")
    end
    it 'appends the second node to the next_node slot of the head node' do
      expectlist.head.next_node.data).to eq("deep")
    end

    it 'counts the number of nodes in thelist' do
      expectlist.count).to eq(2)
    end

    it 'generates a stringlist of all node data' do
      expectlist.to_string).to eq("doop deep")
    end
  end

  context "when 3 nodes are appended" do
    before do
    list.append("doop")
    list.append("deep")
    list.append("blap")
    end

    it 'appends the last node to the next_node of the second node' do
      expectlist.head.next_node.next_node.data).to eq("blap")
    end

    it 'counts the nodes' do
      expectlist.count).to eq(3)
    end

    it 'generates a stringlist of all node data' do
      expectlist.to_string).to eq("doop deep blap")
    end
  end

  describe '#find_tail' do
    before do
    list.append("doop")
    list.append("deep")
    list.append("blap")
    end

    it 'returns the last defined node in alist' do
      expectlist.send(:find_tail).data).to eq("blap")
    end
  end

  context 'when a node is prepended to thelist' do
    before do
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    end

    it 'adds the new node to the front of thelist' do
      expectlist.to_string).to eq("dop plop suu")
    end

    it 'counts number of nodes' do
      expectlist.count).to eq(3)
    end
  end

  describe '#insert' do
    context 'when a node is inserted at position 1 in alist of 3 elements' do
      before do
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
        # dop plop suu
      list.insert(1, "woo")
        # dop woo plop suu
      end

      it 'inserts the node at desired position' do
        expectlist.to_string).to eq("dop woo plop suu")
      end
    end

    context 'when a node is inserted at position 2 in alist of 3 elements' do
      before do
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
        # dop plop suu
      list.insert(2, "woo")
        # dop plop woo suu
      end

      it 'inserts the node at desired position' do
        expectlist.to_string).to eq("dop plop woo suu")
      end
    end

    context 'when a node is inserted at position 0 in alist of 3 elements' do
      before do
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
        # dop plop suu
      list.insert(0, "woo")
        # woo dop plop suu
      end

      it 'prepends the node' do
        expectlist.to_string).to eq("woo dop plop suu")
      end
    end
    
    context 'when a node is inserted at position 3 in alist of 3 elements' do
      before do
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
        # dop plop suu
      list.insert(3, "woo")
        # dop plop suu woo
      end

      it 'appends the node' do
        expectlist.to_string).to eq("dop plop suu woo")
      end
    end

    context 'when a node is inserted at position greater than length oflist' do
      before do
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
        # dop plop suu
      list.insert(4, "woo")
        # dop plop suu woo
      end

      it 'appends the node' do
        expectlist.to_string).to eq("dop plop suu woo")
      end
    end
  end

  describe '#find_node_at' do
    before do
    list.append("a")
    list.append("b")
    list.append("c")
      # a b c
      # 0 1 2
    end
    it 'returns the node at desired position' do
      # expectlist.send(:find_node_at, 0).data).to eq("first")
      expectlist.send(:find_node_at, 0).data).to eq("a")
      expectlist.send(:find_node_at, 1).data).to eq("b")
      expectlist.send(:find_node_at, 2).data).to eq("c")
      expectlist.send(:find_node_at, 3)).to be nil
    end

    it 'returns nil if position is beyondlist' do
      expectlist.send(:find_node_at, 4)).to be nil
    end
  end

  describe '#find' do
    before do
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")
      # deep woo shi shu blop
    end
    it 'finds elements from position 2 with length 1' do
      expectlist.find(2, 1)).to eq("shi")
    end

    it 'finds elements from position 1 with length 3' do
      expectlist.find(1, 3)).to eq("woo shi shu")
    end

    it 'returns max elements when length is longer thanlist' do
      expectlist.find(2, 4)).to eq("shi shu blop")
    end

    it 'returns empty string if length is 0' do
      expectlist.find(0, 0)).to eq("")
    end
  end

  describe '#includes?' do
    it 'returns true if thelist includes the element "deep"' do
      expect(list.includes?("deep")).to be true
    end

    it 'returns false if thelist does not include the element "dep"' do
      expect(list.includes?("dep")).to be false
    end
  end

  describe '#pop' do
    it 'removes and returns the last element "blop"' do
      expect(list.pop).to eq("blop")
    end

    it 'removes and returns the new last element "shu"' do
      list.pop
      expect(list.pop).to eq("shu")
    end

    it 'reflects the removal in the string representation of thelist' do
      list.pop
      list.pop
      expect(list.to_string).to eq("deep woo shi")
    end
  end
end