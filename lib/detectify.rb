require 'detectify/version'
require 'detectify/config'
require 'detectify/query_builder/base'
require 'detectify/query_builder/sql'
require 'detectify/detector'
require 'detectify/middleware'

module Detectify
  def self.configure
    yield(config)
  end

  def self.config
    @config || reset_config
  end

  def self.reset_config(config = Config.new)
    @config = config
  end

  def self.entity_class
    if config.entity_class.is_a?(String)
      Object.const_get(config.entity_class)
    else
      config.entity_class
    end
  end
end

require 'detectify/railtie' if defined?(::Rails)
