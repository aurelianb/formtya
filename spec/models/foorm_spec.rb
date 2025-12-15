require 'rails_helper'

RSpec.describe Foorm, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:uuid) }
  end

  describe 'associations' do
    it { should have_many :form_items }
  end

  describe 'callbacks' do
    describe 'set_uuid' do
      let(:foorm) { create(:foorm) }

      it 'does not update uuid if the foorm exists' do
        expect { foorm.update(title: 'New Title') }.not_to change { foorm.uuid }
      end
      context 'when new record' do
        let(:foorm) { build(:foorm) }

        it 'does set the uuid' do
          expect { foorm.save }.to change { foorm.uuid }.from(nil)
        end
      end
    end
  end
end
