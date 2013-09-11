require_relative 'config'
require_relative '../app/models/teacher.rb'
require 'faker'

def seed_teachers
  9.times do
  Teacher.create :name   => Faker::Name.name,
                 :email  => Faker::Internet.email,
                 :phone  => Faker::PhoneNumber.phone_number
  end
end

seed_teachers
