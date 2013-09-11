require_relative '../../db/config'

class StudentsTeacher < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher
end
