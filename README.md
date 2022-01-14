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
