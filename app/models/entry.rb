class Entry < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true

  def self.created_on(dates)
    where("date(created_at AT TIME ZONE 'UTC' AT TIME ZONE '#{Time.zone.name}') IN (?)", dates)
  end

  def self.grouped_by_date(dates)
    entries_hash = created_on(dates).group_by { |entry| entry.created_at.to_date.to_s }
    entries_hash.each { |date, entry| entries_hash[date] = entry&.first }
    entries_hash
  end
end
