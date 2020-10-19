User.create!(name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  role: 1,
  status: 1,
  activated_at: Time.zone.now)

Topic.create!(name: "Github", language: 1, user_id: 1, activated_at: Time.zone.now )

