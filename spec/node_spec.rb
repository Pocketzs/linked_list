require './lib/node'

RSpec.describe Node do
  context 'when a node is created' do
    let(:node) {Node.new("plop")}
    it 'exists' do
      expect(node).to be_instance_of(Node)
    end

    it 'has data' do
      expect(node.data).to eq('plop')
    end

    it 'has a slot for next node that starts nil' do
      expect(node.next_node).to be_nil
    end
  end
end