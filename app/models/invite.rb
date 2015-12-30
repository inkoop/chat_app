class Invite < ActiveRecord::Base
	belongs_to :chat_room

  def self.invitepeople(invite_email, chat_room_id)

    token = SecureRandom.hex(8)
    until Invite.find_by(token: token).nil?
      token = SecureRandom.hex(5)
    end

    @invite = Invite.new
    @invite.email = invite_email
    @invite.chat_room_id = chat_room_id
    @invite.token = token
    @invite.is_fresh = true
    @invite.save
    @invite
  end

  def self.invite_link_is_valid(invite_token)
    valid_invite = Invite.find_by(token: invite_token)
    if valid_invite.is_fresh
      return valid_invite
    else
      return nil
    end
  end

end
