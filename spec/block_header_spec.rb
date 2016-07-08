require_relative 'spec_helper'

describe BlockHeader do
  let(:timestamp) { 1467975258 } # 2016-07-08 11:54:18 +0100
  let(:params) { { x_hash: "HASH", hash_prev_block: "PREV", timestamp: timestamp } }
  subject(:header) { described_class.new params }

  specify { expect(header.hash).to eq("HASH") }
  specify { expect(header.hash_prev_block).to eq("PREV") }
  specify { expect(header.timestamp).to eq(timestamp) }

  it "returns a hash" do
    expect(header.to_h).to eq({hash: "HASH", hash_prev_block: "PREV"})
  end
end
