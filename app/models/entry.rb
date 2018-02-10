class Entry < ApplicationRecord
  validates :body, presence: true

  def self.grouped_by_date(date_array)
    entries_hash = where('created_at::DATE IN (?)', date_array).
        group_by { |entry| entry.created_at.to_date.to_s}

    entries_hash.each do |date, entry|
      entries_hash[date] = entry.first if entry.present?
    end

    entries_hash
  end
end
