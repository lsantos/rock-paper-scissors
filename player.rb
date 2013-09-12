class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def inspect
    name
  end

  def to_s
    inspect
  end

  def valid?
    !name.empty?
  end
end