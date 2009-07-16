class HomeController < ApplicationController
  def index
    f = File.new("#{RAILS_ROOT}/log/test", "w+")
    f.close
    render :text => "home"
  end
end
