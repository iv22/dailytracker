# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).

User.create_with(password: 'ok7777').find_or_create_by(email: 'ok@mail.ru') do |user|
  user.first_name = 'Mike'
  user.last_name = 'Dow'
  user.role = User.roles[:admin]
end

