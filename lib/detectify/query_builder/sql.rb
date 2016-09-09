module Detectify
  module QueryBuilder
    class SQL < Base
      def build
        @query ||= begin
          query = ["#{domain_clause}#{or_operator}#{subdomain_clause}"]
          query << domain if need_domain_clause?
          query << subdomain if need_subdomain_clause?
          query.compact
        end
      end

      private

      def domain_clause
        "LOWER(#{Detectify.config.domain_column}) = ?" if need_domain_clause?
      end

      def subdomain_clause
        "LOWER(#{Detectify.config.subdomain_column}) = ?" if need_subdomain_clause?
      end

      def or_operator
        ' OR ' if need_domain_clause? && need_subdomain_clause?
      end
    end
  end
end
