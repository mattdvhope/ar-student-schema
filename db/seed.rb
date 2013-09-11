require_relative 'config'
require_relative '../app/models/teacher.rb'
require_relative '../app/models/student.rb'
require_relative '../app/models/students_teachers.rb'

require 'faker'

def seed_teachers
  9.times do
  Teacher.create :name   => Faker::Name.name,
                 :email  => Faker::Internet.email,
                 :phone  => Faker::PhoneNumber.phone_number
  end
end


def seed_student
  50.times do
  Student.create :first_name => Faker::Name.first_name,
                 :last_name  => Faker::Name.last_name,
                 :email      => Faker::Internet.free_email,
                 :phone      => Faker::PhoneNumber.phone_number,
                 :birthday   => Date.today - rand(15..40)*365,
                 :gender     => ['Male', 'Female'].sample
  end
end


def seed_give_student_to_teacher
  
  num_teachers = Teacher.count
  num_students = Student.count

  Student.all.each do |student|
    # student = Student.find(rand(num_students)+1)
    teacher = Teacher.find(rand(num_teachers)+1)
    
    student.teachers << teacher
  end

end


# p StudentsTeacher.all

# seed_teachers
# seed_student

# seed_give_student_to_teacher


