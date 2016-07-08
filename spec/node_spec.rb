require_relative 'spec_helper'

describe Node do
  subject(:node) { described_class.new }

  let(:block0)  { Block.new(x_hash: "GENESIS",  hash_prev_block: nil)       }
  let(:block1a) { Block.new(x_hash: "B1A",      hash_prev_block: "GENESIS") }
  let(:block1b) { Block.new(x_hash: "B1B",      hash_prev_block: "GENESIS") }
  let(:block2a) { Block.new(x_hash: "B2A",      hash_prev_block: "B1A")     }
  let(:block2b) { Block.new(x_hash: "B2B",      hash_prev_block: "B1B")     }

  it "adds blocks" do
    node.add_block block0
    node.add_block block1a
    node.add_block block2a

    expect(node.chain).to eq([
      { hash: "GENESIS",  hash_prev_block: nil       },
      { hash: "B1A",      hash_prev_block: "GENESIS" },
      { hash: "B2A",      hash_prev_block: "B1A"     },
    ])
  end

  it "resolves conflicts" do
    node.add_block block0
    node.add_block block1a
    node.add_block block1b # now we have a forked chain
    node.add_block block2b # the 'b' branch of the chain wins

    expect(node.chain).to eq([
      { hash: "GENESIS",  hash_prev_block: nil       },
      { hash: "B1B",      hash_prev_block: "GENESIS" },
      { hash: "B2B",      hash_prev_block: "B1B"     },
    ])
  end

end

