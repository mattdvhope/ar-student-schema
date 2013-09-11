require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class JoinTeachers < ActiveRecord::Migration
  def change
    remove_column :students, :teacher_id
    create_join_table :students, :teachers
  end
end

