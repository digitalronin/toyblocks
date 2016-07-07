require_relative 'spec_helper'

describe Block do
  let(:params) { { x_hash: "HASH", hash_prev_block: "PREV" } }
  subject(:block) { described_class.new params }

  specify { expect(block.header.hash).to eq("HASH") }
  specify { expect(block.header.hash_prev_block).to eq("PREV") }
end
