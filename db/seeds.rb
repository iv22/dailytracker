# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).

user = User.create_with(password: 'ok7777').find_or_create_by(email: 'ok@mail.ru') do |user|
  user.first_name = 'Mike'
  user.last_name = 'Dow'
  user.role = User.roles[:admin]
  user.confirmed_at = Time.now
end

user.update_attribute(:confirmed_at, Time.now) if user.confirmed_at.nil?

company = Company.create!(name: 'Test Company')

company.company_users.create(user: user)

teams = Team.create!([
  { name: "Diamond", company: company },
  { name: "Ruby", company: company },
  { name: "Cristal", company: company },
  { name: "Green", company: company },
  { name: "Opal", company: company }
])

users = User.create!([
  {
    email: 'or@mail.ru',
    password: 'or7777',
    first_name: "John",
    last_name: "Smith",
    role: 2,
    phone: +375292582728
  },
  { 
    email: 'on@mail.ru',
    password: 'on7777',
    first_name: "Michael",
    last_name: "Norton",
    role: 2,
    phone: +375292582728
  },
  {
    email: 'om@mail.ru',
    password: 'om7777',
    first_name: "Harry",
    last_name: "Stapleton",
    role: 2,
    phone: +375292582728
  },
  {
    email: 'ow@mail.ru',
    password: 'ow7777',
    first_name: "Mary",
    last_name: "Green",
    role: 2,
    phone: +375292582728
  },
  {
    email: 'os@mail.ru',
    password: 'os7777',
    first_name: "Dmitry",
    last_name: "Novitsky",
    role: 2,
    phone: +375292582728
  },
  {
    email: 'oh@mail.ru',
    password: 'oh7777',
    first_name: "Harry",
    last_name: "Potter",
    role: 2,
    phone: +375292582728
  }
])

team_users = TeamUser.create!([
  { user: users[0], team: teams[0], is_team_lead: true },
  { user: users[1], team: teams[0], is_team_lead: false },
  { user: users[2], team: teams[0], is_team_lead: false },
  { user: users[3], team: teams[1], is_team_lead: true },
  { user: users[4], team: teams[1], is_team_lead: false },
  { user: users[5], team: teams[1], is_team_lead: false }
])
