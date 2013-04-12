require "spec_helper"
describe Actions::Posts::New do
  let (:params) { {:id => 10} }
  let(:controller) { MockController.new(:params => params) }
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
    action.execute!
    controller.presenter.should_not be_nil
    controller.presenter.should be_instance_of Post
  end


end