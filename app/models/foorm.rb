class Foorm < ApplicationRecord
  has_many :form_items, dependent: :destroy
  accepts_nested_attributes_for :form_items, allow_destroy: true

  validates :title, presence: true
  validates :uuid, uniqueness: true

  before_create :set_uuid

  private
  def set_uuid
    self.uuid = SecureRandom.base36(12)
  end
end
