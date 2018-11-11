class User < ApplicationRecord
  has_many :entries

  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
  validates :time_zone, presence: true, inclusion: TZInfo::Timezone.all_identifiers

  def start_date
    created_at.to_date
  end

  def end_date
    (start_date - 1.day) + 6.years
  end
end
