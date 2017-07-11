class PagesController < ApplicationController
  def show
    render params[:page]
    rescue ActionView::MissingTemplate
    raise ActionController::RoutingError, 'Not Found'
  end
end
