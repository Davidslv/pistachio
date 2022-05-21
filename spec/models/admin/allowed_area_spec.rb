require 'rails_helper'

RSpec.describe Admin::AllowedArea, type: :model do
  subject { described_class.new(attributes) }

  let(:attributes) { {} }

  describe '#save' do
    context 'when area is empty' do
      it { expect(subject.save).to be(false) }
    end

    context 'when area is empty string' do
      let(:attributes) { super().merge(area: '') }

      it { expect(subject.save).to be(false) }
    end

    context 'when area is valid' do
      let(:attributes) { super().merge(area: 'Southwark 034A') }

      it { expect(subject.save).to be(true) }

      context 'when saving the same area more than once' do
        before do
          subject.save
        end

        it 'returns false on second insert' do
          expect(described_class.new(attributes).save).to be(false)
        end

        it 'returns error' do
          resource = described_class.new(attributes)
          resource.save

          expect(resource.errors.messages[:area]).to eq(['has already been taken'])
        end
      end
    end
  end
end
