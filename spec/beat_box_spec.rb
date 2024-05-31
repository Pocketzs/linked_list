require './lib/beat_box'
require './lib/linked_list'
require './lib/node'

RSpec.describe BeatBox do
  let(:bb) { BeatBox.new }

  it 'exists' do
    expect(bb).to be_a(BeatBox)
  end

  it 'initializes with an empty LinkedList' do
    expect(bb.list).to be_a(LinkedList)
    expect(bb.list.head).to be_nil
  end

  it 'can append data to the linked list' do
    bb.append("deep doo ditt")
    expect(bb.list.head.data).to eq("deep")
    expect(bb.list.head.next_node.data).to eq("doo")
    expect(bb.list.head.next_node.next_node.data).to eq("ditt")
  end

  it 'can append more data to the linked list' do
    bb.append("deep doo ditt")
    bb.append("woo hoo shu")
    expect(bb.list.head.data).to eq("deep")
    expect(bb.list.head.next_node.data).to eq("doo")
    expect(bb.list.head.next_node.next_node.data).to eq("ditt")
    expect(bb.list.head.next_node.next_node.next_node.data).to eq("woo")
    expect(bb.list.head.next_node.next_node.next_node.next_node.data).to eq("hoo")
    expect(bb.list.head.next_node.next_node.next_node.next_node.next_node.data).to eq("shu")
  end

  it 'can count the nodes in the linked list' do
    bb.append("deep doo ditt")
    bb.append("woo hoo shu")
    expect(bb.count).to eq(6)
  end

  it 'can convert the linked list to a string' do
    bb.append("deep doo ditt")
    bb.append("woo hoo shu")
    expect(bb.to_string).to eq("deep doo ditt woo hoo shu")
  end
end