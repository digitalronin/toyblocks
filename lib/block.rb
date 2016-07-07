class Block
  attr_reader :x_hash,
              :magic_number,
              :size,
              :header,
              :transactions

  def initialize(params)
    @transactions = []
    @x_hash       = params.fetch(:x_hash)
    @header       = BlockHeader.new(
      timestamp:        Time.now.to_i,
      hash_prev_block:  params.fetch(:hash_prev_block)
    )
  end

  def hash
    x_hash
  end

  def transaction_count
    transactions.length
  end

  def previous_block_hash
    header.hash_prev_block
  end

  def to_json
    { hash: hash, previous_block: header.hash_prev_block }.to_json
  end
end
