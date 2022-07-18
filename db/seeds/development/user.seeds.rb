unless User.exists?
  User.create(
    email: 'challenge@test.com',
    name: 'admin',
    password: '$dm!nhola123',
    password_confirmation: '$dm!nhola123'
  )
end
