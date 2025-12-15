require 'rails_helper'

RSpec.describe FormItem, type: :model do
  describe 'associations' do
    it { should have_many :answers }
    it { should have_many :form_item_options }
    it { should belong_to :foorm }
  end

  describe 'validations' do
    it { should validate_presence_of :label }
    it { should validate_presence_of :item_type }
  end
end
