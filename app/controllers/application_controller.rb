class ApplicationController < ActionController::Base
  before_action :set_header_for_iframe

  private

  def set_header_for_iframe
    response.headers.delete "X-Frame-Options"
  end
end
