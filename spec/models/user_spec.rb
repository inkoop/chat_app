require 'rails_helper'

describe "User" do 
  
  context "#authendicateuser" do
    #let(:chatroomprivate) {ChatRoom.create(name: "office",is_public: false)}
    
    context "user is present and room is present" do
      #hash    
      let(:user_arg){ {email: "yo@gmail.com",password: "pass1234"} }
      let(:chatroom_name_arg) {"school"}
      #model data
      let!(:user) {User.create(email: "yo@gmail.com",password: "pass1234")}
      let!(:chatroom) {ChatRoom.create(name: "school",is_public: true)}

      context "public" do
        it "user is move to public chatroom" do
          expect(User.authendicateuser(user_arg, chatroom_name_arg)).to eq([user, chatroom])
        end  
      end
  
      context "private" do
        before do
          chatroom.update is_public: false
          UserChatRoom.create(user_id: user.id, chat_room_id: chatroom.id)
        end
        it "user is move to private chatroom" do
          expect(User.authendicateuser(user_arg, chatroom_name_arg)).to eq([user, chatroom.reload])
        end 
      end

      context "no access" do
        before do
          chatroom.update is_public: false
        end
        it "user has no access to private chatroom" do
          expect(User.authendicateuser(user_arg, chatroom_name_arg)).to eq([user, nil])
        end
      end
    end

    context "user is new and room is present" do
      #hash    
      let(:user_arg){ {email: "man@gmail.com",password: "man1234"} }
      let(:chatroom_name_arg) {"school"}
      #model data
      let!(:user) {User.create(email: "man@gmail.com",password: "man1234")}
      let!(:chatroom) {ChatRoom.create(name: "school",is_public: true)}

      context "public" do
        it "user is created and move to public chatroom" do
          expect(User.authendicateuser(user_arg, chatroom_name_arg)).to eq([user, chatroom])
        end
      end

      context "private" do
        before do
          chatroom.update is_public: false
          UserChatRoom.create(user_id: user.id, chat_room_id: chatroom.id)
        end
        it "user is created and move to private chatroom" do
          expect(User.authendicateuser(user_arg, chatroom_name_arg)).to eq([user, chatroom])
        end
      end
      
      context "no access" do
        before do
          chatroom.update is_public: false
        end
        it "user is created and no access to private chatroom" do
          expect(User.authendicateuser(user_arg, chatroom_name_arg)).to eq([user, nil])
        end
      end
    end

    context "user is new and room is new" do
      #hash    
      let(:user_arg){ {email: "new@gmail.com",password: "new1234"} }
      let(:chatroom_name_arg) {"computer"}
      #model data
      let!(:user) {User.create(email: "new@gmail.com",password: "new1234")}
      let!(:chatroom) {ChatRoom.create(name: "computer",is_public: true)}

      context "public" do
        it "new user is move to new public chatroom" do
          expect(User.authendicateuser(user_arg, chatroom_name_arg)).to eq([user, chatroom])
        end
      end
    end

    context "user is present and room is new" do
      #hash    
      let(:user_arg){ {email: "yo@gmail.com",password: "pass1234"} }
      let(:chatroom_name_arg) {"computer"}
      #model data
      let!(:user) {User.create(email: "yo@gmail.com",password: "pass1234")}
      let!(:chatroom) {ChatRoom.create(name: "computer",is_public: true)}
      context "public" do        
        it "user is move to new public chatroom " do
          expect(User.authendicateuser(user_arg, chatroom_name_arg)).to eq([user, chatroom])
        end
      end
    end
  end
end
