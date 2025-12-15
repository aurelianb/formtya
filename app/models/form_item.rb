class FormItem < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :form_item_options, dependent: :destroy
  accepts_nested_attributes_for :form_item_options, allow_destroy: true

  belongs_to :foorm

  validates :label, presence: true
  validates :item_type, presence: true

  enum :item_type, {
    text: "text",
    numeric: "numeric",
    dropdown: "dropdown"
  }
end
