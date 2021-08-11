class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many         :successes, dependent: :destroy
  has_many         :emotions, dependent: :destroy
  has_many         :messages, dependent: :destroy
  has_many         :notes, dependent: :destroy
  has_many         :comments, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :nickname
    validates :name,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）入力のみ可能です" }
    validates :birthday
    validates :phone, format: { with: /\A[0-9]{10,11}\z/, message: "は半角数字（ハイフンは含まない）入力のみ可能です" }
  end

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角（英字・数字）の混合入力のみ可能です" }

end
