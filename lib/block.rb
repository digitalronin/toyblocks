class Block
  attr_reader :magic_number,
              :size,
              :header,
              :transactions

  def initialize(params)
    @header = BlockHeader.new(
      x_hash:           params.fetch(:x_hash),
      hash_prev_block:  params.fetch(:hash_prev_block),
      timestamp:        params.fetch(:timestamp, Time.now.to_i),
    )
  end
end
