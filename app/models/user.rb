class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_secure_password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  attachment :profile_image

  validates :name, length: { maximum: 20}
  validates :name, length: { minimum: 2}
  validates :name, presence: true
  validates :introduction, length: { maximum: 50 }

    def update_with_password(params, *options)
        params.delete(:current_password)
        if params[:password].blank?
            params.delete(:password)
            params.delete(:password_confirmation) if params[:password_confirmation].blank?
        end
        result = update(params, *options)
        clean_up_passwords
        result
    end
end
