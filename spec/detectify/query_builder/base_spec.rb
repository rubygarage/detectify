require 'spec_helper'

RSpec.describe Detectify::QueryBuilder::Base do
  let(:domain) { 'DOMAIN' }
  let(:subdomain) { 'SUBDOMAIN' }
  subject { Detectify::QueryBuilder::Base.new(domain, subdomain) }

  describe '#initialize' do
    it 'sets domain in downcase' do
      expect(subject.domain).to eq(domain.downcase)
    end

    it 'sets subdomain in downcase' do
      expect(subject.subdomain).to eq(subdomain.downcase)
    end
  end
end
