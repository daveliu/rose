class HomeController < ApplicationController
  def index
    f = File.new("#{RAILS_ROOT}/log/test", "w+")
    f.close
    render :text => "home"
  end

  def test
    f = File.new("#{RAILS_ROOT}/log/test", "r")
    render :text => "aa#{f.to_s}"
  end
end
