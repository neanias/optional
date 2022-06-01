# frozen_string_literal: true

require "spec_helper"

RSpec.describe Optional::Option do
  subject(:option) { described_class.new(value) }

  context "with a value" do
    let(:value) { 5 }

    describe "#unwrap" do
      subject(:unwrap) { option.unwrap }

      it { is_expected.to eq(5) }
    end

    describe "#unwrap_or" do
      subject(:unwrap_or) { option.unwrap_or(10) }

      it { is_expected.to eq(5) }
    end

    describe "#unwrap_or_else" do
      subject(:unwrap_or_else) { option.unwrap_or_else { 25 } }

      it { is_expected.to eq(5) }
    end
  end

  context "without a value" do
    let(:value) { nil }

    describe "#unwrap" do
      subject(:unwrap) { option.unwrap }

      it "raises a ContentsIsNoneError" do
        expect { unwrap }.to raise_error(described_class::ContentsIsNoneError)
      end
    end

    describe "#unwrap_or" do
      subject(:unwrap_or) { option.unwrap_or(10) }

      it { is_expected.to eq(10) }
    end

    describe "#unwrap_or_else" do
      subject(:unwrap_or_else) { option.unwrap_or_else { 25 } }

      it { is_expected.to eq(25) }
    end
  end
end
