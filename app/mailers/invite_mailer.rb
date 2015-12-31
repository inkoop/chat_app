class InviteMailer < ApplicationMailer
  def invite_mail(user_email, url, chat_room_name)
    @user_email = user_email
    @url = url
    @chat_room_name = chat_room_name
    mail(to: @user_email, subject: "Invitation for joinig a chat room - Chatapp")
  end
end
