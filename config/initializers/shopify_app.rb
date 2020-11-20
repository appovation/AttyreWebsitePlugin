ShopifyApp.configure do |config|
  config.application_name = "AttyreDelivery"
  config.api_key = 'ba72c5ddc7495c2c85b4fa6add05b13a'
  config.secret = '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'
  config.old_secret = ""
  config.scope = "read_products, read_orders" # Consult this page for more scope options:
  # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2020-10"
  config.shop_session_repository = 'Shop'
  config.allow_jwt_authentication = true

  config.webhooks = [
    {
      topic: 'orders/create',
      address: "#{ENV['APP_URL']}/orders_create",
      format: 'json'
    }
  ]
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
