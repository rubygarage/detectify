require 'spec_helper'

RSpec.describe Detectify::QueryBuilder::SQL do
  describe '#build' do
    subject { Detectify::QueryBuilder::SQL.new(domain, subdomain).build }

    context 'with domain and subdomain columns in config' do
      context 'with only domain' do
        let(:domain) { 'example.com' }
        let(:subdomain) { nil }

        it { is_expected.to eq(['LOWER(domain) = ?', 'example.com']) }
      end

      context 'with only subdomain' do
        let(:domain) { nil }
        let(:subdomain) { 'example' }

        it { is_expected.to eq(['LOWER(subdomain) = ?', 'example']) }
      end

      context 'with domain and subdomain' do
        let(:domain) { 'example.com' }
        let(:subdomain) { 'example' }

        it do
          is_expected.to eq([
            'LOWER(domain) = ? OR LOWER(subdomain) = ?', 'example.com', 'example'
          ])
        end
      end
    end

    context 'with domain column in config' do
      before { Detectify.config.subdomain_column = nil }

      context 'with only domain' do
        let(:domain) { 'example.com' }
        let(:subdomain) { nil }

        it { is_expected.to eq(['LOWER(domain) = ?', 'example.com']) }
      end

      context 'with only subdomain' do
        let(:domain) { nil }
        let(:subdomain) { 'example' }

        it { is_expected.to eq(['']) }
      end

      context 'with domain and subdomain' do
        let(:domain) { 'example.com' }
        let(:subdomain) { 'example' }

        it { is_expected.to eq(['LOWER(domain) = ?', 'example.com']) }
      end

      after { Detectify.reset_config }
    end

    context 'with subdomain column in config' do
      before { Detectify.config.domain_column    = nil }

      context 'with only domain' do
        let(:domain) { 'example.com' }
        let(:subdomain) { nil }

        it { is_expected.to eq(['']) }
      end

      context 'with only subdomain' do
        let(:domain) { nil }
        let(:subdomain) { 'example' }

        it { is_expected.to eq(['LOWER(subdomain) = ?', 'example']) }
      end

      context 'with domain and subdomain' do
        let(:domain) { 'example.com' }
        let(:subdomain) { 'example' }

        it { is_expected.to eq(['LOWER(subdomain) = ?', 'example']) }
      end

      after { Detectify.reset_config }
    end
  end
end
