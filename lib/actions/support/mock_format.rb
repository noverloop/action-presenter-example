class MockFormat
  attr_accessor :format

  def initialize(format)
     self.format = format.to_sym
  end

  def method_missing(meth, *args, &block)
    if meth == format
      block.call(*args)
    end
  end
end