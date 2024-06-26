require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  let(:list) { LinkedList.new }
  
  context "when a linked list is created" do
    it 'exists' do
      expect(list).to be_instance_of(LinkedList)
    end

    it 'has a nil head' do
      expect(list.head).to be nil
    end

    it 'has count 0 to start with' do
      expect(list.count).to eq(0)
    end
  end

  context "when a node is appended" do
    before do
      list.append("doop")
    end
    it 'creates a node and adds to the head' do
      expect(list.head).to be_instance_of(Node)
    end

    it 'has data' do
      expect(list.head.data).to eq("doop")
    end

    it 'has nil for next node' do
      expect(list.head.next_node).to be nil
    end

    it 'counts how many nodes in the list' do
      expect(list.count).to eq(1)
    end

    it 'generates a string containing data from every node' do
      expect(list.to_string).to eq("doop")
    end
  end

  context "when two nodes are appended" do
    before do
      list.append("doop")
      list.append("deep")
    end

    it 'keeps the first appended node as the head' do
      expect(list.head.data).to eq("doop")
    end
    it 'appends the second node to the next_node slot of the head node' do
      expect(list.head.next_node.data).to eq("deep")
    end

    it 'counts the number of nodes in the list' do
      expect(list.count).to eq(2)
    end

    it 'generates a string list of all node data' do
      expect(list.to_string).to eq("doop deep")
    end
  end

  context "when 3 nodes are appended" do
    before do
      list.append("doop")
      list.append("deep")
      list.append("blap")
    end

    it 'appends the last node to the next_node of the second node' do
      expect(list.head.next_node.next_node.data).to eq("blap")
    end

    it 'counts the nodes' do
      expect(list.count).to eq(3)
    end

    it 'generates a string list of all node data' do
      expect(list.to_string).to eq("doop deep blap")
    end
  end

  describe '#find_tail' do
    before do
      list.append("doop")
      list.append("deep")
      list.append("blap")
    end

    it 'returns the last defined node in a list' do
      expect(list.send(:find_tail).data).to eq("blap")
    end
  end

  context 'when a node is prepended to the list' do
    before do
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
    end

    it 'adds the new node to the front of the list' do
      expect(list.to_string).to eq("dop plop suu")
    end

    it 'counts number of nodes' do
      expect(list.count).to eq(3)
    end
  end

  describe '#insert' do
    context 'when a node is inserted at position 1 in a list of 3 elements' do
      before do
        list.append("plop")
        list.append("suu")
        list.prepend("dop")
        # dop plop suu
        list.insert(1, "woo")
        # dop woo plop suu
      end

      it 'inserts the node at desired position' do
        expect(list.to_string).to eq("dop woo plop suu")
      end
    end

    context 'when a node is inserted at position 2 in a list of 3 elements' do
      before do
        list.append("plop")
        list.append("suu")
        list.prepend("dop")
        # dop plop suu
        list.insert(2, "woo")
        # dop plop woo suu
      end

      it 'inserts the node at desired position' do
        expect(list.to_string).to eq("dop plop woo suu")
      end
    end

    context 'when a node is inserted at position 0 in a list of 3 elements' do
      before do
        list.append("plop")
        list.append("suu")
        list.prepend("dop")
        # dop plop suu
        list.insert(0, "woo")
        # woo dop plop suu
      end

      it 'prepends the node' do
        expect(list.to_string).to eq("woo dop plop suu")
      end
    end
    
    context 'when a node is inserted at position 3 in a list of 3 elements' do
      before do
        list.append("plop")
        list.append("suu")
        list.prepend("dop")
        # dop plop suu
        list.insert(3, "woo")
        # dop plop suu woo
      end

      it 'appends the node' do
        expect(list.to_string).to eq("dop plop suu woo")
      end
    end

    context 'when a node is inserted at position greater than length of list' do
      before do
        list.append("plop")
        list.append("suu")
        list.prepend("dop")
        # dop plop suu
        list.insert(4, "woo")
        # dop plop suu woo
      end

      it 'appends the node' do
        expect(list.to_string).to eq("dop plop suu woo")
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
      # expect(list.send(:find_node_at, 0).data).to eq("first")
      expect(list.send(:find_node_at, 0).data).to eq("a")
      expect(list.send(:find_node_at, 1).data).to eq("b")
      expect(list.send(:find_node_at, 2).data).to eq("c")
      expect(list.send(:find_node_at, 3)).to be nil
    end

    it 'returns nil if position is beyond list' do
      expect(list.send(:find_node_at, 4)).to be nil
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
      expect(list.find(2, 1)).to eq("shi")
    end

    it 'finds elements from position 1 with length 3' do
      expect(list.find(1, 3)).to eq("woo shi shu")
    end

    it 'returns max elements when length is longer than list' do
      expect(list.find(2, 4)).to eq("shi shu blop")
    end

    it 'returns empty string if length is 0' do
      expect(list.find(0, 0)).to eq("")
    end
  end

  describe '#includes?' do
    before do
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")
      # deep woo shi shu blop
    end
    it 'returns true if the list includes the element "deep"' do
      expect(list.includes?("deep")).to be true
    end

    it 'returns false if the list does not include the element "dep"' do
      expect(list.includes?("dep")).to be false
    end
  end

  describe '#pop' do
    before do
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")
      # deep woo shi shu blop
    end
    it 'removes and returns the last element "blop"' do
      expect(list.pop).to eq("blop")
    end

    it 'removes and returns the new last element "shu"' do
      list.pop
      expect(list.pop).to eq("shu")
    end

    it 'reflects the removal in the string representation of the list' do
      list.pop
      list.pop
      expect(list.to_string).to eq("deep woo shi")
    end

    it 'does something if list is only head' do
      4.times { list.pop }
      expect(list.pop).to eq("deep")
      expect(list.to_string).to eq("")
    end

    it 'returns nil if list is empty' do
      5.times { list.pop }
      expect(list.pop).to be nil
    end
  end
end