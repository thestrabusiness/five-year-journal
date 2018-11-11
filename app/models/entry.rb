class Entry < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true

  def self.grouped_by_date(date_array)
    entries_hash = where("date(created_at::date AT TIME ZONE '#{Time.zone.name}') IN (?)", date_array).
        group_by { |entry| entry.created_at.to_date.to_s}

    entries_hash.each do |date, entry|
      entries_hash[date] = entry.first if entry.present?
    end

    entries_hash
  end
end
