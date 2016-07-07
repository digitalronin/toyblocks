require_relative 'spec_helper'

describe Chain do
  subject(:chain) { described_class.new }
  let(:block0) { Block.new(x_hash: "GENESIS", hash_prev_block: nil) }
  let(:block1) { Block.new(x_hash: "B1", hash_prev_block: "GENESIS") }
  let(:block2) { Block.new(x_hash: "B2", hash_prev_block: "B1") }

  it "returns empty list of block headers" do
    expect(chain.block_headers).to eq([])
  end

  it "has length zero when empty" do
    expect(chain.length).to eq(0)
  end

  it "adds a block, when empty" do
    chain.add_block block0
    expect(chain.block_headers).to eq([block0.header])
  end

  it "adds a block that points back to the end of the chain" do
    chain.add_block block0
    chain.add_block block1

    expect(chain.block_headers).to eq([block0.header, block1.header])
  end

  it "doesn't add a block that doesn't point to the end of the chain" do
    chain.add_block block0
    chain.add_block block2

    expect(chain.block_headers).to eq([block0.header])
  end
end
