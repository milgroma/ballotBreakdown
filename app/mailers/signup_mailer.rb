class SignupMailer < ActionMailer::Base
  default from: "a.s.milgrom@gmail.com"
  
  def new_signup_notification(voter)
    @voter = voter
    @total_signups = Voter.all.count
    mail(to: "milgrom.adam@gmail.com", subject: "new MyBallots signup!")
  end
end
