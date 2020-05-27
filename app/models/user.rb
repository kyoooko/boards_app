# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  birthday        :date
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 16 },
    format: {
      with: /\A[a-z0-9]+\z/,
      message: 'は小文字英数字で入力してください'
    }
  validates :password,
    length: { minimum: 8 }

    # テスト駆動開発（間違ったメソッド定義）
    # def age
    #   0
    # end
    
    # テスト駆動開発（正しいメソッド定義）
    def age
      now=Time.zone.now
      (now.strftime("%Y%m%d").to_i - birthday.strftime("%Y%m%d").to_i) / 10000
    end
end
