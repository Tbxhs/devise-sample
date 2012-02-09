class Notifier < ActionMailer::Base
  default :from => "testrails@163.com"

  def welcome_email(admin)
    @username = admin.username
    @url  = "http://devise.dev/admins/sign_in"
    mail(:to => admin.email, :subject => "Welcome to My Awesome Site").deliver
  end
end

