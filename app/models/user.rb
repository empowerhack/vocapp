class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:facebook]

  has_many :terms
  has_many :answers
  has_many :upvotes
  has_many :downvotes
  has_many :upvoted_answers, through: :upvotes, source: :answer
  has_many :downvoted_answers, through: :downvotes, source: :answer

 def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
   end
 end

 def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
 end

  def has_upvoted?(answer)
    upvoted_answers.include? answer
  end

  def has_downvoted?(answer)
    downvoted_answers.include? answer
  end
end
