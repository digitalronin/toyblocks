class BlockHeader
  attr_reader :x_hash,
              :version,
              :hash_prev_block,
              :hash_merkle_root,
              :timestamp,
              :target,
              :nonce

  def initialize(params)
    @x_hash          = params.fetch(:x_hash)
    @hash_prev_block = params.fetch(:hash_prev_block)
    @timestamp       = params.fetch(:timestamp)
  end

  def hash
    x_hash
  end

  def to_h
    { hash: hash, hash_prev_block: hash_prev_block }
  end
end
