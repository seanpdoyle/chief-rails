if Rails.configuration.x.cache.elasticache
  Chief::Application.configure do |config|
    elasticache = Dalli::ElastiCache.new(ENV['ELASTICACHE_CONFIG_ENDPOINT'])
    config.cache_store = :dalli_store, elasticache.servers
  end
end