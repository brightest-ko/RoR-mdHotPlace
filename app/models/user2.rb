class User2 < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save {self.email = email.downcase}                                       #이메일을 저장하기 전, 주소를 소문자로 변환
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i        #정규식을 이용해 이메일 형식을 지정
  VALID_PHONE_REGEX = /\A01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})\Z/

  has_many :comments
  has_many :bookmarks
     
  validates:user_name, presence:true, length: {maximum: 50} ,uniqueness: true    # devise login uniqueness: true
  validates:email, presence:true, uniqueness:{case_sensitive:false},
                  length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
                  #validates (존재를 확인), presence(오직 하나만 존재),
                  #uniqueness(이메일소문자)
  validates:phone, length:{maximum:13}, format: {with: VALID_PHONE_REGEX}
  validates:level, presence:true
  validates:user_id, presence:true
  validates:encrypted_password, presence:true


  #login
  def login=(login)
    @login = login
  end

  def login
    @login || self.user_id || self.email
  end

  #def email_required?
  #  false
  #end
  
   #use this instead of email_changed? for rails >= 5.1
  #def will_save_change_to_email?
  #  false
  #end
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["(user_delete = 'no' and lower(user_id) = :value) OR (user_delete = 'no' and lower(email) = :value)", { :value => login.downcase }]).first
    elsif conditions.has_key?(:user_id) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, authentication_keys: [:login]
end
