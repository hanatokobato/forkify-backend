# == Schema Information
#
# Table name: states
#
#  id               :bigint           not null, primary key
#  abbreviation     :string(5)        not null
#  described_as     :string
#  name             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  country_id       :integer          not null
#  shipping_zone_id :bigint
#
# Indexes
#
#  index_states_on_abbreviation  (abbreviation)
#  index_states_on_country_id    (country_id)
#  index_states_on_name          (name)
#
class State < ApplicationRecord
  belongs_to :country
  belongs_to :shipping_zone, optional: true

  validates :name,              presence: true, length: { maximum: 150 }
  validates :abbreviation,      presence: true, length: { maximum: 12 }

  def abbreviation_name(append_name = "")
    ([abbreviation, name].join(" - ") + " #{append_name}").strip
  end

  def abbrev_and_name
    abbreviation_name
  end

  class << self
    def form_selector
      order('country_id DESC, abbreviation ASC').map { |state| [state.abbrev_and_name, state.id] }
    end

    def all_with_country_id c_id
      where country_id: c_id
    end
  end
end
