class ApplicationController < ActionController::Base
  protect_from_forgery
  attr_accessor :presenter
  helper_method :presenter

  def self.decorate_with_action action_name
    proc = Proc.new do
      controller_name = self.params["controller"].camelize
      klass = "Actions::#{controller_name}::#{action_name.to_s.camelize}".constantize
      klass.new(self).execute!
    end
    self.send(:define_method, action_name, proc)
  end

end
