class HomeController < ApplicationController
  def index
  end

  def test
    mail = RoseMail.create_test
    RoseMail.deliver(mail)
    render :text => "success"
  end
end
