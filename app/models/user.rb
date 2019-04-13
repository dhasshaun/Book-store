class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JWTBlacklist
  has_many :orders, dependent: :destroy
  validates :email, uniqueness: true
end
