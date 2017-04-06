Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shibboleth,
           # TODO: mappings will need to change when authenticating against IST's SAML
           uid_field: lambda { |request_param|
             request_param.call('uid') || request_param.call('eppn').gsub(/@.*/, '')
           },
           info_fields: {
             email: ->(request_param) { request_param.call('mail') || request_param.call('eppn') },
             name: 'givenName',
             last_name: 'sn',
             # TODO: grab more details to populate our DB fields like: address, department, title, etc.
           },
           name: 'CCID'

  provider :developer unless (Rails.env.production? ||
                              ENV['ENABLE_TMP_LOGINS'].present?)

  # By default in development mode, omniauth raises an exception when authentication fails
  # comment this line if you want to see the stacktrace from the actual provider when in `development`
  # Uncomment the line below to turn this behavior off
  on_failure { |env| Users::OmniauthCallbacksController.action(:failure).call(env) }

  OmniAuth.config.logger = Rails.logger
end
