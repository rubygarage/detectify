require 'spec_helper'

RSpec.describe Detectify::Middleware do
  describe '#call' do
    let(:app) { ->(env) { [200, env, 'hello'] } }
    let(:middleware) { Detectify::Middleware.new(app) }
    let(:request) { Rack::MockRequest.new(middleware) }

    subject { request.get('/') }

    before do
      allow(Detectify::Detector).to receive(:new).with('http://example.org/')
                                                 .and_return(detector_double)
    end

    context 'when entity found' do
      let(:detector_double) { double('detector', detect: 'some_entity') }

      it { expect(subject['Detectify-Entity']).to eq('some_entity') }
    end

    context 'when entity not found' do
      let(:detector_double) { double('detector', detect: nil) }

      it { expect(subject['Detectify-Entity']).to eq(nil) }
    end
  end
end
