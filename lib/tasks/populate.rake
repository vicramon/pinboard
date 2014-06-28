namespace :db do
  task populate: :environment do

    User.destroy_all
    Board.destroy_all

    user = User.create(name: 'Vic Ramon',
      email: 'vic@vicramon.com',
      password: 'password',
      password_confirmation: 'password')

    5.times do
      User.create(name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: 'password',
                  password_confirmation: 'password')
    end

    Board.create(name: 'My Pinboard', user: user)

  end
end
