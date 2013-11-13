class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Item::ItemException, with: :show_item_exception

  protected

  def show_item_exception(e)
    render js: "window.show_item_exception('#{e.message}')"
  end

end
