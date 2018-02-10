class User < ApplicationRecord
  has_many :entries

  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true

  def start_date
    created_at.to_date
  end

  def start_year
    start_date.strftime('%Y')
  end
end
