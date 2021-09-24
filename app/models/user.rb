class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birthdate, presence: true
  
  # passwordが6文字以上・半角英数字混合でなければ登録できない
  validates :password, :password_confirmation, length:{minimum:6}, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}

  # 名前・名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない
  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' }

  # 名前カナ・名字カナがカタカナでなければ登録できない
  validates :fn_furigana, :ln_furigana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい' }
end
