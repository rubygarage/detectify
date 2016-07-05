require 'uri'

module Detectify
  class Detector
    attr_reader :request_uri

    def initialize(request_url, query_builder = QueryBuilder::SQL)
      @request_uri   = URI(request_url)
      @query_builder = query_builder
    end

    def detect
      @entity ||= Detectify.entity_class.where(*query).first unless ignore?
    end

    private

    def ignore?
      @request_uri.to_s[Regexp.union(*Detectify.config.ignore_urls)]
    end

    def query
      @query_builder.new(domain, subdomain).build
    end

    def domain
      request_uri.host
    end

    def subdomain
      chunks = request_uri.host.split('.')
      chunks[0...(1 - Detectify.config.tld_length - 2)].join
    end
  end
end
