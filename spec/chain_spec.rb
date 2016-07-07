require_relative 'spec_helper'

describe Chain do
  subject(:chain) { described_class.new }

  it "returns empty list of blocks" do
    expect(chain.blocks).to eq([])
  end

  it "adds a block" do
    chain.add_block "I am a block"
    expect(chain.blocks).to eq(["I am a block"])
  end

  it "is valid when empty" do
    expect(chain).to be_valid
  end

  it "is valid when there is a single block" do
    chain.add_block "I am a block"
    expect(chain).to be_valid
  end

  it "is valid when each block points to the previous block" do
    chain.add_block Block.new(x_hash: "GENESIS", hash_prev_block: nil)
    chain.add_block Block.new(x_hash: "SECOND",  hash_prev_block: "GENESIS")

    expect(chain).to be_valid
  end

  it "is invalid when a block doesn't point to the previous block" do
    chain.add_block Block.new(x_hash: "GENESIS", hash_prev_block: nil)
    chain.add_block Block.new(x_hash: "SECOND",  hash_prev_block: "WRONG")

    expect(chain).to_not be_valid
  end

end
