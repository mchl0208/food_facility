import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :food_facility, FoodFacilityWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "JzlsJGJVxyzJ+gCnZsV5V99vSjHmNgQMVbKsXofyTeGHVu0fBj6DfNBagHFtoXiH",
  server: false

config :food_facility, FoodFacility.Service.Socrata,
  api_caller: &FoodFacility.Test.FakeSocrata.call_api/4

# In test we don't send emails.
config :food_facility, FoodFacility.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
