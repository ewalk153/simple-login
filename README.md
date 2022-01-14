# SimpleLogin

Demonstration of setting up login from scratch with Rails.

- Core of login/profiles
- Extension of one time password code for 2FA

# Setup

1. Run `bundle` to install the dependencies
2. Run `bin/setup` to prepare the database (sqlite3 to keep things simple)
3. Add a user account with the rails console: `bin/rails c` to launch and then User.create("your-email@your-domain.com", "a-really-secure-password")
4. Launch the app with `bin/rails s` and access it: `open "http://localhost:3000"`
