class Chain
  attr_reader :blocks

  def initialize
    @blocks = []
  end

  def add_block(block)
    blocks.push block
  end

  def valid?
    list = blocks.dup
    current  = list.shift
    while list.any? do
      next_block = list.shift
      return false unless next_block.previous_block_hash == current.hash
      current = next_block
    end

    true
  end

end
