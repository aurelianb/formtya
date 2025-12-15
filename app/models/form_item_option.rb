class FormItemOption < ApplicationRecord
  belongs_to :form_item

  validates :label, presence: true
  validates :value, presence: true
end
