require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'associations' do
    it { should belong_to :submission }
    it { should belong_to :form_item }
  end
end
