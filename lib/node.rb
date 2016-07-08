class Node
  def initialize
    @blockchain = Chain.new
    @forks      = []
  end

  def add_block(block)
    @blockchain.add_block(block) || handle_fork(block)
  end

  def chain
    @blockchain.block_headers.map(&:to_h)
  end

  private

  def handle_fork(block)
    conflicting_valid_block?(block) ? create_fork(block) : resolve_fork(block)
  end

  def conflicting_valid_block?(block)
    penultimate = @blockchain.block_headers[-2]
    block.header.hash_prev_block == penultimate.hash
  end

  def create_fork(block)
    @forks.push(@blockchain)
    @forks.push(create_branch block)
  end

  def create_branch(block)
    branch = @blockchain.dup
    branch.block_headers.pop
    branch.add_block(block)
    branch
  end

  def resolve_fork(block)
    if winner = @forks.find {|branch| branch.add_block(block) }
      @blockchain = winner
      @forks      = []
    end
  end
end
