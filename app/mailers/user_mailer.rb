class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def invitation(member)
    @member = member
    @process = member.user_process
    mail(:to => member.email,
         :subject => I18n.t(:mail_invitation_subject))
  end
end
