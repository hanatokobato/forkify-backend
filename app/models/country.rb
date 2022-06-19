# == Schema Information
#
# Table name: countries
#
#  id           :bigint           not null, primary key
#  abbreviation :string(5)
#  active       :boolean          default(FALSE)
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_countries_on_name  (name)
#
class Country < ApplicationRecord
  has_many :states

  validates :name,  presence: true,       :length => { :maximum => 200 }
  validates :abbreviation,  presence: true,       :length => { :maximum => 10 }

  after_save :expire_cache

  scope :active_countries, -> { where(active: true) }
  scope :inactive_countries, -> { where(active: false) }

  def abbreviation_name(append_name = "")
    ([abbreviation, name].join(" - ") + " #{append_name}").strip
  end

  def abbrev_and_name
    abbreviation_name
  end

  def self.form_selector
    Rails.cache.fetch("Country-form_selector") do
      data = Country.active_countries.order('abbreviation ASC').map { |c| [c.abbrev_and_name, c.id] }
      data.blank? ? [[]] : data
    end
  end

  private

  def expire_cache
    Rails.cache.delete("Country-form_selector")
  end
end
