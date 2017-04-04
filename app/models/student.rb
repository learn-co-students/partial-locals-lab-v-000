require 'pry'
# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
    has_many :classroom_students
    has_many :classrooms, through: :classroom_students

    def self.search(name="")
        @students = self.all
        if !name.empty?
            @students = @students.select do |student|
                student if student.name.downcase.include? (name.downcase)
            end
        end
#        binding.pry
        return @students
    end
end
