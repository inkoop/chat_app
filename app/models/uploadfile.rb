class Uploadfile < ActiveRecord::Base
	belongs_to :user
	belongs_to :chat_room

  has_attached_file :attachment

  validates_attachment :attachment, presence: true
  #content_type: { content_type: "image/jpeg" }
  validates_attachment_content_type :attachment, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'application/pdf', 'application/xlsx', 'text/plain', 'audio/mpeg3']

  def self.uploadattachment(user_id, chat_room_id, attachment)
    @upload = Uploadfile.new
    @upload.time = DateTime.now
    @upload.user_id = user_id
    @upload.chat_room_id = chat_room_id
    @upload.attachment = attachment
    @upload.save
    @upload
  end
end
