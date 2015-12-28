require 'rails_helper'

describe ChatRoom do
  context "#search_room" do
    context "new chatroom" do
      #hash    
      let(:user_arg){ {email: "yo@gmail.com",password: "pass1234"} }
      let(:chatroom_name_arg) {"incubex"}
      #model data
      let!(:user) {User.create(email: "yo@gmail.com",password: "pass1234")}
      let!(:chatroom) {ChatRoom.create(name: "incubex",is_public: true)}
      it "user is move to new public chatroom" do
          expect(ChatRoom.search_room(chatroom_name_arg, user)).to eq(chatroom)
      end  
    end
    context "existing chatroom" do
      #hash    
      let(:user_arg){ {email: "yo@gmail.com",password: "pass1234"} }
      let(:chatroom_name_arg) {"school"}
      #model data
      let!(:user) {User.create(email: "yo@gmail.com",password: "pass1234")}
      let!(:chatroom) {ChatRoom.create(name: "school",is_public: true)}

      context "public chatroom" do
        it "user is move to existing public chatroom" do
          expect(ChatRoom.search_room(chatroom_name_arg, user)).to eq(chatroom)
        end  
      end

      context "private chatroom" do
        before do
          chatroom.update is_public: false
          UserChatRoom.create(user_id: user.id, chat_room_id: chatroom.id)
        end
        it "user is move to existing private chatroom" do
          expect(ChatRoom.search_room(chatroom_name_arg, user)).to eq(chatroom.reload)
        end  
      end

      context "no access" do
        before do
          chatroom.update is_public: false
        end
        it "user has no access to existing private chatroom" do
          expect(ChatRoom.search_room(chatroom_name_arg, user)).to eq(nil)
        end  
      end
    end

  end
end
