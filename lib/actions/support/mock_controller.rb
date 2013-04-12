class MockController
  attr_accessor :format, :session, :flash, :params, :presenter

  def initialize(opts={})
    self.params = opts.fetch :params
    self.format = params[:format] || "html"
    self.session = opts[:session] || {}
    self.flash = opts[:flash] || {}
  end

  def respond_to &block
    block.call(MockFormat.new(self.format))
  end

  def render

  end
end
