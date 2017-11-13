class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :seats, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
         
  mount_uploader :image, ImagesUploader

   class << self
     def find_for_facebook_oauth(auth)
       where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
         user.email = auth.info.email
         user.password = Devise.friendly_token[0,20]
         user.name = auth.info.name
       end
     end

     def find_for_twitter_oauth(auth)
       where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
         user.email = User.create_unique_email
         user.password = Devise.friendly_token[0,20]
         user.name = auth.info.name
       end
     end

     def create_unique_string
       SecureRandom.uuid
     end

     def create_unique_email
       User.create_unique_string + "@example.com"
     end
   end

   private

   def user_params
    params.require(:user).permit(:name, :email, :image, :occupation, :description)
   end
end
