require_relative '../../db/config'

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Teacher < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true, email: true

  has_many :student_teachers, :foreign_key => :teacher_id
  has_many :students, :through => :student_teachers

end


# teacher = Teacher.create!(name: "New Teacher", email: "agustin.gsoyette@monahan.net", phone: "123.123.4567")
