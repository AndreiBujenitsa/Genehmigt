class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def invitation(process)
    @process = process
    mail(:to => order.user.email,
         :subject => I18n.t(:new_process))
  end
end
