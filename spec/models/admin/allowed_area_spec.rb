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
    end
  end
end
