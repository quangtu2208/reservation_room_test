# Users
5.times do |n|
  name = "Admin-#{n+1}"
  email = "admin-#{n+1}@admin.com"
  password = "123456"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    admin: true,
    activated: true,
    activated_at: Time.zone.now)
end

99.times do |n|
  name = FFaker::Name.name
  email = "user-#{n+1}@user.com"
  password = "123456"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end
