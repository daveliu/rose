class Admin::HomeController < ApplicationController
  before_filter :authenticate_admin
  layout "admin"
end
