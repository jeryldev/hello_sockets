import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello_sockets, HelloSocketsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wCtbzOtSYU/Hnyq+tWjI2qaLocMZqLRQ9mWv/7/43syZ3GAnayFJWTMGHS0hyt9J",
  server: false

# In test we don't send emails.
config :hello_sockets, HelloSockets.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
