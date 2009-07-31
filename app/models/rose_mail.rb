class RoseMail < ActionMailer::Base
  def test
    @subject = "test"
    @recipients = ["wjp_712@yahoo.com.cn", "wjp712@gmail.com"]
    @from = 'wjp712@gmail.com'
    @sent_on = Time.now
    @body = "test gmail server"
  end
end
