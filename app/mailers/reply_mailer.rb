class ReplyMailer < ApplicationMailer
  def new_reply_mail(user, reply)
    @reply = reply
    @user = User.where(id: Query.find(reply.query_id).pluck(:user_id))
  end
end
