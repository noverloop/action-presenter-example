require "spec_helper"
describe Presenter::Posts::Show do
  it "should initalize with post" do
    @post = FactoryGirl.create(:post)
    presenter = Presenter::Posts::Show.new @post
    puts presenter.posts_link
  end

  it "should cache items" do
    @post = FactoryGirl.create(:post)
    presenter = Presenter::Posts::Show.new @post

    presenter.presenter_created_at
    presenter2 = Presenter::Posts::Show.new @post
    presenter.presenter_created_at.should == presenter2.presenter_created_at
  end
end