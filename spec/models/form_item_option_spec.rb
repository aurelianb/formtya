require 'rails_helper'

RSpec.describe FormItemOption, type: :model do
  describe 'associations' do
    it { should belong_to :form_item }
  end

  describe 'validations' do
    it { should validate_presence_of :label }
    it { should validate_presence_of :value }
  end
end
