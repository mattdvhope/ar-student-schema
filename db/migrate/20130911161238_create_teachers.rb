require_relative '../config'
require 'faker'

# this is where you should use an ActiveRecord migration to 

class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.timestamps
    end
  end

end
