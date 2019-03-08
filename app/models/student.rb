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
require 'pry'


class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students


# use find_all
  def self.search(name_text)
        if !name_text.empty?
          #  binding.pry
           @answer = self.all.find_all do |student|
           if student.name.downcase.include?(name_text)
              student.name
           end
          end
       else !name_text.empty? || name_text == nil
            Student.all
       end
      #  binding.pry
  end


end
