require "spec_helper"
describe Actions::Posts::New do
  let(:controller) { Object.new }
  subject(:action) { Actions::Posts::New.new(controller) }


  it "should respond to :execute!" do
    action.respond_to?(:execute!).should be_true
  end

  it "should respond to :perform" do
    action.respond_to?(:perform).should be_true
  end

  it "should respond to :present" do
    action.respond_to?(:present).should be_true
  end

  it "should respond to :respond" do
    action.respond_to?(:respond).should be_true
  end

  it "should set a presenter" do
    controller.should_receive(:presenter=).once
    action.execute!
  end


end