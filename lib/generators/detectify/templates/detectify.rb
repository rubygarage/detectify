Detectify.configure do |config|
  # Set the model that Detectify will use to detect entity.
  # Default value is 'Account'.
  # config.entity_class = 'Account'

  # Set the column that will be used to find entity by domain.
  # If you don't need such lookup, you can simply set
  # domain_column value as nil. Default value is 'domain'
  # config.domain_column = 'domain'

  # Set the column that will be used to find entity by subdomain.
  # If you don't need such lookup, you can simply set
  # subdomain_column value as nil. Default value is 'subdomain'.
  # config.subdomain_column = 'subdomain'

  # Set your top level domain length.
  # For more information about TLD visit http://bit.ly/1jIeoL9
  # By length, means count of dots in your TLD.
  # For example, tld_length for 'example.co.uk' domain will be 2,
  # for 'example.com' will be 1. Default value is 1.
  # config.tld_length = 1

  # Array of regular expressions, that will be used to determine
  # whether it is necessary to detect entity. You can add as much as you want,
  # for example, config.ignore_urls += [%r{/assets/}]. Default values is [].
  # config.ignore_urls += [%r{/assets/}]
end
