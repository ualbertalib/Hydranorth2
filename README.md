# HydraNorth2

[![Build Status](https://travis-ci.org/ualbertalib/Hydranorth2.svg?branch=master)](https://travis-ci.org/ualbertalib/Hydranorth2)
[![Coverage Status](https://coveralls.io/repos/github/ualbertalib/Hydranorth2/badge.svg?branch=master)](https://coveralls.io/github/ualbertalib/Hydranorth2?branch=master)

## TODO! Add information to me!


## Running the Tests

Setup dependencies and run the test suite:

   ```sh
   $ bundle install
   $ rake db:migrate
   ```

You can run the Fedora and Solr servers in one window with:

   ```sh
   $ rake hydra:test_server
   ```

And run the test suite in another window:

   ```sh
   $ rake spec
   ```

You can then run rubocop with:

  ```sh
  $ rubocop
  ```

  Or may also use the following rake task to do everything at once (rubocop/setup test servers/run rspec):

  ```sh
  $ rake hydranorth:ci
  ```

## Configuring Shibboleth
This is not ideal and hopefully a temporary solution. But currently in development you must host your own shibboleth service provider (SP) and connect with http://testshib.org Identiy Provider (IdP) (or use another IdP of your choice) to use authentication in this application. To set this up you can do the following:
  * Install apache on your machine (for Ubuntu: `$ sudo apt-get install apache2`)
  * Install and configured a Shibboleth Service Provider (SP) daemon (shibd)
    * For Ubuntu: http://federation.belnet.be/?q=node/24
    * For RPM:
    https://wiki.shibboleth.net/confluence/display/SHIB2/NativeSPLinuxRPMInstall
    * For Mac OS X:
    https://wiki.shibboleth.net/confluence/display/SHIB2/NativeSPMacInstall
    * For configuration of shibd you mainly need to edit shibboleth2.xml to point to your IP address and testshib.org
  * Install mod_shib for apache (for ubuntu: `$ sudo apt-get install libapache2-mod-shib2`)
  * Install Passenger and mod passenger for apache (For Ubuntu: `$ sudo gem install passenger` and `$ sudo apt-get install libapache2-mod-passenger` and configure it accordingly. (You can use `$ passenger-install-apache2-module` to configure on Ubuntu)
  * Change apache config to get it all working together. My config file looks something like the following:
```
<VirtualHost *:80>
  ServerName 129.128.46.172
  DocumentRoot /directory/of/Code/Hydranorth2/public
  RailsEnv development

	<Location />
    Allow from all
    Options -MultiViews
    Require all granted
   </Location>

	<Location /Shibboleth.sso>
		SetHandler shib-handler
    PassengerEnabled off
	</Location>

	<Location /auth/CCID/callback>
		AuthType shibboleth
		ShibRequestSetting requireSession 1
		ShibUseHeaders On
		Require valid-user
	</Location>

	Alias /shibboleth-sp /usr/share/shibboleth
	<Location /shibboleth-sp>
		Satisfy any
	</Location>

  # ... etc #
</VirtualHost>
```
  * visit '/Shibboleth.sso/Metadata' to download and review the metadata, rename to a filename of your preference
  * upload the SP metadata to http://testshib.org/register.html or your Identiy Provider (IdP)
  * Run Solr and Fedora servers
  * Go to your IP Address that apache is listening to, and hydranorth2 should be up and running on passenger. You should now be able to login by using shibboleth!

Some helpful links for more information:
* http://www.jeesty.com/shibboleth
* https://docs.gitlab.com/ce/integration/shibboleth.html
