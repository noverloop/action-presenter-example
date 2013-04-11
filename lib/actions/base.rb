module Actions
  class Base
    extend Forwardable

    attr_accessor :rails, :presenter, :router

    def_delegators :@rails, :render, :session, :cookie, :request, :flash, :params, :respond_to,
                            :presenter, :presenter=, :head, :redirect_to, :default_url_options


    def initialize(controller, router=nil)
      @rails = controller
      @router ||= Router.new
    end

    def execute!
      perform
      present
      respond
    end

    def perform
    end

    def present
      self.presenter ||= {}
    end

    def respond
      respond_to do |format|
        format.html { render }
        format.json { render :json => presenter }
      end
    end

    def default_url_options
     { :host => request.env["HTTP_HOST"]}
    end
  end
end