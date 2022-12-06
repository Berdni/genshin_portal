class Hero < ApplicationRecord
  extend FriendlyId
  extend Enumerize
  include ImageUploader::Attachment(:icon)

  ELEMETNS = %i[anemo cryo electro geo hydro pyro dendro].freeze

  friendly_id :name, use: :slugged

  enumerize :rarity, in: { epic: 4, legendary: 5 }, scope: true, i18n_scope: 'rarity'
  enumerize :element, in: ELEMETNS, scope: true, i18n_scope: 'element'

  validates :name, presence: true, uniqueness: true
  validates :rarity, presence: true
  validates :element, presence: true
end
