require 'spec_helper'

RSpec.describe Detectify do
  describe '.entity_class' do
    let(:account_class) { Class.new }

    subject { Detectify.entity_class }

    context 'when Detectify.config.entity_class is a class' do
      before { Detectify.config.entity_class = account_class }

      it { is_expected.to eq(account_class) }
    end

    context 'when Detectify.config.entity_class is a string' do
      before do
        Detectify.config.entity_class = 'Account'
        Object.const_set('Account', account_class)
      end

      it { is_expected.to eq(account_class) }
    end

    after { Detectify.reset_config }
  end

  describe '.configure' do
    it 'allows to change config' do
      Detectify.configure do |config|
        config.entity_class     = 'Some Class'
        config.tld_length       = 2
        config.ignore_urls     = [%r{/assets/}]
        config.domain_column    = 'some_domain'
        config.subdomain_column = 'some_subdomain'
      end

      expect(Detectify.config.entity_class).to eq('Some Class')
      expect(Detectify.config.tld_length).to eq(2)
      expect(Detectify.config.ignore_urls).to eq([%r{/assets/}])
      expect(Detectify.config.domain_column).to eq('some_domain')
      expect(Detectify.config.subdomain_column).to eq('some_subdomain')
    end

    after { Detectify.reset_config }
  end

  describe '.reset_config' do
    before { Detectify.config.tld_length = 5 }

    context 'when config passed' do
      let(:config) do
        config = Detectify::Config.new
        config.tld_length = 2
        config
      end

      subject { Detectify.reset_config(config) }

      it 'sets config to passed' do
        expect(subject.tld_length).to eq(2)
      end
    end

    context 'when config not passed' do
      subject { Detectify.reset_config }

      it 'sets config to default' do
        expect(subject.tld_length).to eq(1)
      end
    end

    after { Detectify.reset_config }
  end

  describe '.config' do
    subject { Detectify.config }

    it { is_expected.to be_a(Detectify::Config) }
  end
end
