namespace :db do
  task populate: :environment do

    User.destroy_all
    Board.destroy_all

    user = User.create(name: 'Vic Ramon',
      email: 'vic@vicramon.com',
      password: 'password',
      password_confirmation: 'password')

    5.times do
      User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password')
    end

    board = Board.create(name: 'My Pinboard', user: user)

    5.times do
      Item.create(
        kind: 'card',
        top: 1 + rand(600),
        left: 1 + rand(700),
        board: board,
        text: Faker::HipsterIpsum.sentence)
    end

  end
end
