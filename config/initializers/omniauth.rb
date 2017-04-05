Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
           assertion_consumer_service_url: 'https://era-test.library.ualberta.ca/auth/saml/callback',
           idp_cert: 'MIIEWzCCA0OgAwIBAgIJALoiStKRScIDMA0GCSqGSIb3DQEBCwUAMIHDMQswCQYDVQQGEwJDQTEQMA4GA1UECAwHQWxiZXJ0YTERMA8GA1UEBwwIRWRtb250b24xHjAcBgNVBAoMFVVuaXZlcnNpdHkgb2YgQWxiZXJ0YTEqMCgGA1UECwwhSW5mb3JtYXRpb24gU2VydmljZXMgJiBUZWNobm9sb2d5MR4wHAYDVQQDDBVsb2dpbi11YXQudWFsYmVydGEuY2ExIzAhBgkqhkiG9w0BCQEWFHRhbnRvbmlvQHVhbGJlcnRhLmNhMB4XDTE2MDIwOTIyMzM0N1oXDTI2MDIwNjIyMzM0N1owgcMxCzAJBgNVBAYTAkNBMRAwDgYDVQQIDAdBbGJlcnRhMREwDwYDVQQHDAhFZG1vbnRvbjEeMBwGA1UECgwVVW5pdmVyc2l0eSBvZiBBbGJlcnRhMSowKAYDVQQLDCFJbmZvcm1hdGlvbiBTZXJ2aWNlcyAmIFRlY2hub2xvZ3kxHjAcBgNVBAMMFWxvZ2luLXVhdC51YWxiZXJ0YS5jYTEjMCEGCSqGSIb3DQEJARYUdGFudG9uaW9AdWFsYmVydGEuY2EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDDdlCs9X2lvzaiC7WaQLsqQ4i+xCITtKH1jP/4bhfqGFFmOrt11+wYoCnqobF3s3GU3LvnWRi+JqaTpmxzXnzOXiifq6Ji6glJcB0nq0XziLSiJrVDvZxx19CUxMSV0ef/q8xIRcnPr9als/xhNuzM2o5qsRh0eVjVK7uM4/QDim8K8NyvFTeLqIcULP7dUc7Ju1TbmF7gbYFbt3WP6I1xi2TYOIZ5b2X1MYraOLCC+AFEOW6Gt4sVA3V9wKWBg5woHn8OffGmnLMciUOcSTy7Kt1vNnWjIJkvI4W4A8q/DDq7LL6SLlh9iCcobIL48yGWNTjZ042OtNPLEXoa7fVRAgMBAAGjUDBOMB0GA1UdDgQWBBTrOiZQXHIR3263dJyBJicrXAg/8DAfBgNVHSMEGDAWgBTrOiZQXHIR3263dJyBJicrXAg/8DAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQCyseW5aWoJ7omV1hCfUeiblI093nlrLjcyfNxl+gji/GHOVaeL0rOWY8BYcHdiaJxmT9vc4JmZeRdSAZxLuc12xcKEiEBiwAFBoi4XnyzUBUs6JSzSXWUKzyVnTK1/Igu6zwRI/WwBWj5V/bQ5xmL6EI+nwnmpzCkeMmSIG6q2VaE0XN0rGbdcpp74LhZxsM+3ccBWluavw01hkLull7v9yYm2x6jE2LbLmTyphp5JpPpgmfF9tlI0nvqziD5f174XLpTHqitDMH7DWWH+pLnWNUkPKOVFa03hhb8w6CSMEF0Atzw+69bbeWCyexWIIJulrtEC/K8aBgkqyB4ZTx5J',
           certificate: '-----BEGIN CERTIFICATE-----
MIIDQDCCAiigAwIBAgIJAOCm/waPAgtVMA0GCSqGSIb3DQEBBQUAMCQxIjAgBgNV
BAMTGXBsYW5vLmxpYnJhcnkudWFsYmVydGEuY2EwHhcNMTUxMDAxMjEwMjQ5WhcN
MjUwOTI4MjEwMjQ5WjAkMSIwIAYDVQQDExlwbGFuby5saWJyYXJ5LnVhbGJlcnRh
LmNhMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsxRH61rSVigXTECa
PD0Dym6+UvEiL1WQc8ST0jYzmYlU90PCN6zbxmLTM8LEDsAKBeC3niMlXzRtFm08
u1yessogDwRGKdUAmMuGGZOAj4kLSqUUp/LWObOBSPmVXF//P/XsNTbIIPWee5jG
0K98gegzHdBf9BTv/ytGdjzNVeUcqWtazGqWcy0smAc6NZjdwx3FMoQJmZtzR1P7
lZOvGrCtczpHVwCZapD8lWVYjGZM1ww4PzUiyV2kunW/bn0wV25wzOo86JZKqfPh
bMLRvupHuS0bqlLwPAbB2Vqp4ANgitKHaBX0TadjOVCbDei0d/iLMzh3aRQ8XngB
HdDyrQIDAQABo3UwczBSBgNVHREESzBJghlwbGFuby5saWJyYXJ5LnVhbGJlcnRh
LmNhhixodHRwczovL3BsYW5vLmxpYnJhcnkudWFsYmVydGEuY2Evc2hpYmJvbGV0
aDAdBgNVHQ4EFgQUY6PzGBavmQEs7H+x5XdinkoxQnUwDQYJKoZIhvcNAQEFBQAD
ggEBAGn/0WiiOaONMIpIDj9KfCzZAjW4AQmCaaSvVqfRnXc8BX+oV3eKUcToyT8s
slG867fCdiIODQH3JsSrPkwztnPee5kwRcsd7/tpjs8lrzcTwTPAbdU5ZyiF/tCw
H1tpkYu0VnY/DKzny5iTSs6ThBesaDUESReDNMIZNnB6QnSByI6fstqs0rhxdMzX
04LeE4CwVHhM7EdMBa2ZS5BGB52o+Z2cmMZQqFv6WM7X+fJyQWaD06hfmtMvyP4o
vpRsweeCLCQfCxE+5iA2zZCOexzkq5OMWDHsmdeHmwwNkVo1EvhTAb3khH/6yMzV
i0fDCxtn9InCdldL+Vp+Pnt/Gns=
-----END CERTIFICATE-----',
           private_key: '-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzFEfrWtJWKBdM
QJo8PQPKbr5S8SIvVZBzxJPSNjOZiVT3Q8I3rNvGYtMzwsQOwAoF4LeeIyVfNG0W
bTy7XJ6yyiAPBEYp1QCYy4YZk4CPiQtKpRSn8tY5s4FI+ZVcX/8/9ew1Nsgg9Z57
mMbQr3yB6DMd0F/0FO//K0Z2PM1V5Rypa1rMapZzLSyYBzo1mN3DHcUyhAmZm3NH
U/uVk68asK1zOkdXAJlqkPyVZViMZkzXDDg/NSLJXaS6db9ufTBXbnDM6jzolkqp
8+FswtG+6ke5LRuqUvA8BsHZWqngA2CK0odoFfRNp2M5UJsN6LR3+IszOHdpFDxe
eAEd0PKtAgMBAAECggEARtZK7KpscXBCZwNW/2UTTswntR91akvqbCDiaFDQcHeG
iJjhBqz18q+848izTTJhxJlziLZWXiaa0Dg9wc+NZyPVMpt6NanwJoC7dvqF7EFF
mi1a0mSYoRKEnZ08m+HNUjuxSAt3drIyEqoIWxxPoAN91NlMW3y8wq8XnEXI46Sn
lIZ8f/e8xKJVF3A/DTjCQdrBCmqHSh2jrEmRGcjK/tdWQlq4yrKJZr8dGEso6Xne
UfkvcOBBtlkqWcLIoQduc2862BQRDPrjWMSdGHYKOeQZ8krD79HKqcCLyjsOgUPf
Shlltnw7Dhhk0gwf330PmthReknMW2KOhlAqKIP1cQKBgQDoEo6tIeG+FT4ZCGNK
wfvEMGkG6mogDROZVCYwUHm5uTbC7jhdQkrO7PkgeRWeJldSdJbolbbgTZLqXR3l
pX5jcY+uwcHykDw6IX38nRZx0hmNXJcgEqbNEetk6t2cwYh3Rqj5kGMCTWq90uwa
3eyzIXmI8zKkACIVDvdKvdaorwKBgQDFiv3ZK8bGJ1qKARxi0Ry603nmKkhtMkOJ
vuh1Konk35Oy4wIKk1CDBbST8yZcEPKolN1/mEYu+/sRtbuu7e1iz9odLVXw/FE2
nVEj6/bELUvFtswJUB7mavlMeN5fRqrwFI7ViU/I7/fjHU7gDtWo289FDviHFYhQ
Yc3kEd15YwKBgQDAYknm2rSh+EgvRlXRrngBDsSyV/e8NDrwG+NAoCYYwaLU+9i7
7u3HFon70oUKQuyWzVIg46Pj1EsbgC/9pTDeTVD4ZWVbqRhUdFlV5f+qQaqvFnet
veiLDfTfBxjKD2IKxwfjQz/gs77uOAFE0H6djP2Me1eavwWCAZMdYbymvwKBgF2P
tytk0ICJoxg57nffEvxprRKWdDdD1zkmcnML8sO0IQBZBF5952QnD6ADSefRHx05
ZK9KL/OQ5Rk+OeZgSk7Co0uubUX2O4DigcvBtt6zlW/PZFQE3p3DjM/rb2cw0UVk
d0IsBt3kykOHXhRA8nFHqqPKs2tHh4iKyjl7PKqBAoGAI3/CLRYN1FZthi98+xLQ
41HjnmDrM3ZqCySq+9dBz0gIz8P877vie+yJVC2xU7h4Y1RTpbMycgRLCv6Ma+dY
XBi+iOWcMpGPQmXWfYYSXBnpLxZ/CKEu2NvlKEY+2y6TatuTxNBi0MyUqYqbAsGh
49b0kjdCV+v8oNnw2pbHUeA=
-----END PRIVATE KEY-----
',
           idp_slo_target_url: 'https://login-uat.ualberta.ca/saml2/idp/SingleLogoutService.php',
           idp_sso_target_url: 'https://login-uat.ualberta.ca/saml2/idp/SSOService.php',
           issuer: 'https://era-test.library.ualberta.ca',
           name_identifier_format: 'urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress',
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
             # TODO: How to get values as human readable instead of URNs?
             # Shibboleth had an attribute-map.xml for mapping this...must be a way?
             email: ['urn:oid:0.9.2342.19200300.100.1.3'], #mail
             first_name: ['urn:oid:2.5.4.42'], # givenName
             last_name: ['urn:oid:2.5.4.4'],  #sn
             display_name: ['urn:oid:2.16.840.1.113730.3.1.241'] #displayName
           }

  provider :developer unless Rails.env.production?

  # By default in development mode, omniauth raises an exception when authentication fails
  # comment this line if you want to see the stacktrace from the actual provider when in `development`
  # Uncomment the line below to turn this behavior off
  on_failure { |env| Users::OmniauthCallbacksController.action(:failure).call(env) }

  OmniAuth.config.logger = Rails.logger
end
