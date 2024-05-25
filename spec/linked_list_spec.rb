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
      expect(list.find_tail.data).to eq("blap")
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
  end
end