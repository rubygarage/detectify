require 'spec_helper'

RSpec.describe Detectify::Config do
  describe 'Default values' do
    subject { Detectify::Config.new }

    it { expect(subject.entity_class).to eq('Account') }
    it { expect(subject.tld_length).to eq(1) }
    it { expect(subject.ignore_urls).to eq([]) }
    it { expect(subject.domain_column).to eq('domain') }
    it { expect(subject.subdomain_column).to eq('subdomain') }
  end
end
