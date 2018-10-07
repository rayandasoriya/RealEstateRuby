class ReplyMailer < ApplicationMailer
  default from: 'realestateapp12345@gmail.com'

  def new_reply_mail
    @reply = params[:reply]
    @user = User.find(Query.find(@reply.query_id).user_id)
    mail(to: @user.email, subject: 'New Reply on your Enquiry')
    puts @user
  end
end
