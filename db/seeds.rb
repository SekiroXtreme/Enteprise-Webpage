user1 = User.find_or_initialize_by(email: 'admin@gmail.com')
user1.password = '291ABASD932'
user1.password_confirmation = '291ABASD932'
user1.save
