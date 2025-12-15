require 'rails_helper'

RSpec.describe "/submissions", type: :request do
  let!(:foorm) { create(:foorm, form_items: [ form_item, form_item_2 ]) }
  let(:form_item) { build(:form_item, item_type: "text") }
  let(:form_item_2) { build(:form_item, item_type: "dropdown", form_item_options: [ form_item_option ]) }
  let(:form_item_option) { build(:form_item_option) }
  let(:create_attributes) do
    {
      submitter: "Name",
      foorm_id: foorm.id,
      answers_attributes: [
      {
        form_item_id: form_item.id,
        value: "Answer 1"
      },
      {
        form_item_id: form_item_2.id,
        value: "Answer 2"
      }
      ]
    }
  end

  describe "/create" do
    before do
      post "/submissions", params: { submission: create_attributes }
    end

    it "creates the answers" do
      expect(Answer.count).to eq 2
    end

    it "attaches the submission to form" do
      expect(Submission.last.foorm_id).to eq foorm.id
    end

    it "saves the correct answers" do
      answer = Answer.first
      expect(answer.value).to eq "Answer 1"
      expect(answer.form_item_id).to eq form_item.id

      answer = Answer.last
      expect(answer.value).to eq "Answer 2"
      expect(answer.form_item_id).to eq form_item_2.id
    end
  end
end
