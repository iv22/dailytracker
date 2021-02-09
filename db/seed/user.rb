p 'Start seeding Users'
first_names = %w[Mike John Kelly]
last_names = %w[Dow Jonson Jordan]

if User.admin.count.zero?
  3.times.each do |i|
    user = User.create(email: "ok#{i}@mail.ru",
                       password: "qwerty#{i}",
                       first_name: first_names[i],
                       last_name: last_names[i],
                       role: User.roles[:admin])
    p "Added Admin: #{user.inspect}"
  end
end
