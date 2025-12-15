class Submission < ApplicationRecord
  belongs_to :foorm
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  scope :for_form, ->(form_id) { includes(answers: :form_item).where(foorm_id: form_id) }
end
