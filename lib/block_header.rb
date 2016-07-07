class BlockHeader
  attr_reader :version,
              :hash_prev_block,
              :hash_merkle_root,
              :timestamp,
              :target,
              :nonce

  def initialize(params)
    @hash_prev_block = params.fetch(:hash_prev_block)
    @timestamp       = params.fetch(:timestamp)
  end
end
