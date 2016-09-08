module Detectify
  module QueryBuilder
    class Base
      attr_reader :domain, :subdomain

      def initialize(domain, subdomain)
        @domain    = domain.downcase if domain.is_a?(String)
        @subdomain = subdomain.downcase if subdomain.is_a?(String)
      end

      def build
        raise(NotImplementedError)
      end

      private

      def need_domain_clause?
        Detectify.config.domain_column && domain
      end

      def need_subdomain_clause?
        Detectify.config.subdomain_column && subdomain
      end
    end
  end
end
