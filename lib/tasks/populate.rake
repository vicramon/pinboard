namespace :db do
  task populate: :environment do
    User.destroy_all

    User.create(name: 'Vic Ramon', email: 'vic@vicramon.com')
    5.times do
      User.create(name: Faker::Name.name, email: Faker::Internet.email)
    end

  end
end
