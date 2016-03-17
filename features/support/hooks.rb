# Example of overwriting role data with a hash of custom data
Before('@invalid_user') do
  @user = Huzzah::Role.new(:dedric, password: 'password')
end

Before('@dedric') do
  @dedric = Huzzah::Role.new(:dedric)
end

Before('@carey') do
  @carey = Huzzah::Role.new(:carey)
end

# Use the Huzzah::Cucumber::DSL to close the browsers of all role instances.
After do
  close_browsers
end