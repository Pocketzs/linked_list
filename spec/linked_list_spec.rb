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

    it 'can count how many nodes in the list' do
      expect(list.count).to eq(1)
    end

    it 'can generate a string containing data from every node' do
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

    it 'should count the number of nodes in the list' do
      expect(list.count).to eq(2)
    end

    it 'generates a string list of all node data' do
      expect(list.to_string).to eq("doop deep")
    end
  end
end