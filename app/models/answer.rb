class Answer < ApplicationRecord
  belongs_to :submission
  belongs_to :form_item
end
