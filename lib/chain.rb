class Chain
  attr_reader :block_headers

  def initialize
    @block_headers = []
  end

  def add_block(block)
    block_headers.push(block.header) if valid_add?(block)
  end

  def length
    block_headers.length
  end

  private

  def valid_add?(block)
    length == 0 || block.header.hash_prev_block == end_of_chain.hash
  end

  def end_of_chain
    block_headers[-1]
  end
end
