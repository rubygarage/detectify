require 'spec_helper'

RSpec.describe Detectify::Detector do
  describe '#detect' do
    let(:builder) { Detectify::QueryBuilder::SQL }

    subject { Detectify::Detector.new(url, builder).detect }

    context 'when path should be ignored' do
      let(:url) { 'https://sub.example.com/assets/some_asset.jpg' }

      before { Detectify.config.ignore_urls += [%r{/assets/}] }

      it { is_expected.to be_nil }
    end

    context 'when path should not be ignored' do
      let(:entity_class) { Class.new }
      let(:builder_double) { double('builder', build: ['some_query']) }
      let(:url) { 'https://sub.example.com/some_resource' }

      before do
        Detectify.config.entity_class = entity_class

        allow(builder).to receive(:new).with('sub.example.com', 'sub')
                                       .and_return(builder_double)

        allow(entity_class).to receive(:where).with('some_query')
                                              .and_return(['some_entity'])
      end

      it { is_expected.to eq('some_entity') }
    end

    after { Detectify.reset_config }
  end
end
