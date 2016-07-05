module Detectify
  module QueryBuilder
    class Base
      attr_reader :domain, :subdomain

      def initialize(domain, subdomain)
        @domain    = domain
        @subdomain = subdomain
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
