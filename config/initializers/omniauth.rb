Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
           assertion_consumer_service_url: 'https://era.library.ualberta.com/auth/saml/callback',
           idp_cert: 'MIIEUzCCAzugAwIBAgIJAJ0Fn4JwMfuOMA0GCSqGSIb3DQEBCwUAMIG/MQswCQYDVQQGEwJDQTEQMA4GA1UECAwHQW'\
           'xiZXJ0YTERMA8GA1UEBwwIRWRtb250b24xHjAcBgNVBAoMFVVuaXZlcnNpdHkgb2YgQWxiZXJ0YTEqMCgGA1UECwwhSW5mb3JtYXRpb24'\
           'gU2VydmljZXMgJiBUZWNobm9sb2d5MRowGAYDVQQDDBFsb2dpbi51YWxiZXJ0YS5jYTEjMCEGCSqGSIb3DQEJARYUdGFudG9uaW9AdWFs'\
           'YmVydGEuY2EwHhcNMTUxMjIzMTYzMTM2WhcNMjUxMjIwMTYzMTM2WjCBvzELMAkGA1UEBhMCQ0ExEDAOBgNVBAgMB0FsYmVydGExETAPB'\
           'gNVBAcMCEVkbW9udG9uMR4wHAYDVQQKDBVVbml2ZXJzaXR5IG9mIEFsYmVydGExKjAoBgNVBAsMIUluZm9ybWF0aW9uIFNlcnZpY2VzIC'\
           'YgVGVjaG5vbG9neTEaMBgGA1UEAwwRbG9naW4udWFsYmVydGEuY2ExIzAhBgkqhkiG9w0BCQEWFHRhbnRvbmlvQHVhbGJlcnRhLmNhMII'\
           'BIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy2lwlJ2ZgU7S1zqY4RpMh1AcZuO0vT6By4xPdEutCouzMmXDin99iTA67aV6j0wH'\
           'cJgez54P5ju2XGq/X+J0v5hH1BkRE8jA7MG2Sv4FAmtjAbSd9u6b4kwzPAvbP++GW/k7klBTZeo8ARISIuQ3Q6RHSode7ee5YSaHvhMPM'\
           '/j1IGLZgmHcacifiexE+++JyjUW07TPRiMxYikCDUpsX1C0xUlnefrz+WuIqYlgdqJ22ecnHxjEJqqAZz3IOCeIL1N2zKfq9J6JsW7G3f'\
           '1nCinv2gOffrAeLPlubdaipd6lfH18S1OihtqyKj4W/fJACQDbsMmv1zWlzmEwCrIHRQIDAQABo1AwTjAdBgNVHQ4EFgQUu8s6Z+kZRJI'\
           'nHgo27W3PAVf4OqAwHwYDVR0jBBgwFoAUu8s6Z+kZRJInHgo27W3PAVf4OqAwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEA'\
           'v+Uf77Zr6v/dJO8Nt/CV3Xy+I81AZWrDcmayVH3/ZhIuXAsdcvV5HyPlQoX7ylDQtkyvz/4SczJV4vn19aesTmXanAEjK8wEh6v1YX+80'\
           'SdKWW0yk6TEV887QXKWD8NgqFztetIZk2c0r7KxcELvMPamnrd6HgmGlMl5ajNKVf/9VRkXBVrigDWYFiFDaskpfU4dhKIn41pvx1ZF/Z'\
           'Bv9UHNNDXoHLRQKjQeoARtqUeS0ISh8/zcONfjyOqhK3D3IHjwQA11Fhxx/bwyYxnfPWpSG7oPhSvO42KAuruyR544NwaaBBx0KkfaoZr'\
           'WMXHa4Ddq6h762kJ4ducpXZTzPQ==',
           idp_slo_target_url: 'https://login.ualberta.ca/saml2/idp/SingleLogoutService.php',
           idp_sso_target_url: 'https://login.ualberta.ca/saml2/idp/SSOService.php',
           issuer: 'https://era.library.ualberta.com',
           name_identifier_format: 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient',
           request_attributes: [
             { name: 'mail',
               name_format: 'urn:oasis:names:tc:SAML:2.0:attrname-format:basic',
               friendly_name: 'Email address' },
             { name: 'displayName',
               name_format: 'urn:oasis:names:tc:SAML:2.0:attrname-format:basic',
               friendly_name: 'Display name' },
             { name: 'givenName',
               name_format: 'urn:oasis:names:tc:SAML:2.0:attrname-format:basic',
               friendly_name: 'Given name' },
             { name: 'sn',
               name_format: 'urn:oasis:names:tc:SAML:2.0:attrname-format:basic',
               friendly_name: 'Family name' }
           ],
           attribute_statements: {
             email: ['mail'],
             first_name: ['givenName'],
             last_name: ['sn'],
             display_name: ['displayName']
           }

  provider :developer unless Rails.env.production?

  # By default in development mode, omniauth raises an exception when authentication fails
  # comment this line if you want to see the stacktrace from the actual provider when in `development`
  # Uncomment the line below to turn this behavior off
  on_failure { |env| Users::OmniauthCallbacksController.action(:failure).call(env) }

  OmniAuth.config.logger = Rails.logger
end
