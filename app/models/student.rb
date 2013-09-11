require_relative '../../db/config'

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class AgeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless Time.now.year - value.year > 5
      record.errors[attribute] << (options[:message] || "you need to be at least 5 years old")
    end
  end
end

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.scan(/[0-9]/).size >= 10
      record.errors[attribute] << (options[:message] || "phone number is not valid")
    end
  end
end


class Student < ActiveRecord::Base

  validates :email, uniqueness: true, presence: true, email: true
  validates :birthday, presence: true, age: true
  validates :phone, presence: true, phone: true

  def name
    self.first_name + " " + self.last_name
  end

  def age
    Time.now.year - self.birthday.year  
  end

end

# student = Student.create!(first_name: "Erin", last_name: "Malone", gender: "male", birthday: "1966-07-21", email: "mattddhere@gmai.com", phone: "443-333-4444")

# p Students.all


# student3 = Student.create!(first_name: "Eigil", last_name: "Sagafos", gender: "male", birthday: "1984-03-06", email: "eigil2@yahoo.com", phone: "222-333-4444")

# p student2

# student_young = Student.create!(first_name: "Alea", last_name: "Sagafos", gender: "female", birthday: "2001-10-30", email: "alea@yahoo.com", phone: "222-333-4444")

# p student_young

# student = Student.last

# p student.email


# puts student.first_name
# p student.name
# p student.age
