# SimpleLogin

Demonstration of setting up login from scratch with Rails.

- Core of login/profiles
- Extension of one time password code for 2FA, for [example](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en&gl=US).

This was inspired by [DHH's comment on the Remote Ruby podcast](https://remoteruby.transistor.fm/160) that an experienced developer should be able to create a secure login feature using what's in the box with rails. Writing the originally login took less than an hour thanks to the `has_secure_password` feature built into Rails.

# Setup

1. Run `bundle` to install the dependencies
2. Run `bin/setup` to prepare the database (sqlite3 to keep things simple)
3. Add a user account with the rails console: `bin/rails c` to launch and then `User.create("your-email@your-domain.com", "a-really-secure-password")`
4. Launch the app with `bin/rails s` and access it: `open "http://localhost:3000"`

For fun, this app also encrypts the totp token in the database (`User#encrypts :totp_secret`).

The credentials saved in this app won't work for you because they use my `config/master.key`. I'm not sharing ;)

You can comment out this line if you want to play with this code without setting up encryption credentials. Otherwise, to setup your own keys, you'll need to create your own encryption keys with `bin/rails db:encryption:init` and then add them to the rails credentails with `bin/rails credentials:edit`. More info on this can be found with `bin/rails credentials:help`. By default, creds are not versioned by environment. To add something to just one environment, pass them as an argument: `bin/rails credentials:edit --environment development`.

More on [active_record_encryption](https://guides.rubyonrails.org/active_record_encryption.html) and [custom credentials](https://guides.rubyonrails.org/security.html#custom-credentials)
