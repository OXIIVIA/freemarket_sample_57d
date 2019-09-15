class User < ApplicationRecord  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :sns_credentials, dependent: :destroy
  has_one  :address
  has_one  :card
  has_many :favorites

  validates :nickname, presence: true
  validates :password, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthdate_year, presence: true
  validates :birthdate_month, presence: true
  validates :birthdate_day, presence: true
  
  def self.find_for_oauth(auth)
    sns = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
    unless sns
      @user = User.create(
      name:     auth.info.name,
      image: "",
      nickname: "",
      birthdate: "",
      email:    auth.info.email,
      password: Devise.friendly_token[0,20]
      )
      sns = SnsCredential.create(
      user_id: @user.id,
      uid: auth.uid,
      provider: auth.provider
      )
    end
    sns
    @user
  end

end
