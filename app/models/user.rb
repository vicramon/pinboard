class User < ActiveRecord::Base
  has_many :boards
  include Authem::User
end
