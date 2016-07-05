module Detectify
  class Config
    attr_accessor :entity_class, :tld_length, :ignore_urls,
                  :domain_column, :subdomain_column

    def initialize
      @entity_class     = 'Account'
      @tld_length       = 1
      @ignore_urls      = []
      @domain_column    = 'domain'
      @subdomain_column = 'subdomain'
    end
  end
end
