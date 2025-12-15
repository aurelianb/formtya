require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'associations' do
    it { should have_many :answers }
    it { should belong_to :foorm }
  end

  describe 'scopes' do
    let!(:form_1) { create(:foorm) }
    let!(:form_2) { create(:foorm) }
    let!(:submission_1) { create(:submission, foorm: form_1) }
    let!(:submission_2) { create(:submission, foorm: form_2) }

    it 'returns the correct submission for given form' do
      submissions = Submission.for_form(form_1.id)
      expect(submissions).to include(submission_1)
      expect(submissions).not_to include(submission_2)
    end
  end
end
