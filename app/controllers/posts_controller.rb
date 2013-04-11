class PostsController < ApplicationController
  respond_to :js, :html
  decorate_with_action :index
  decorate_with_action :show
  decorate_with_action :new
  decorate_with_action :edit
  decorate_with_action :create
  decorate_with_action :update
  decorate_with_action :destroy
end
