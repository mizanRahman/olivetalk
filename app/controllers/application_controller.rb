class ApplicationController < ActionController::Base
  add_breadcrumb :index, :root_path
  protect_from_forgery
end
