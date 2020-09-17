class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchasses
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角の漢字・ひらがな・カタカナで入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角の漢字・ひらがな・カタカナで入力してください' }
    validates :fam_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角のカタカナで入力してください' }
    validates :fir_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角のカタカナで入力してください' }
    validates :birth_date
  end
end
