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

# the tests require that this doesn't return an array, so need to use ActiveRecord method for finding instead

  def self.search(query)
binding.pry
    if query.empty?
      results = self.all
    else
      results = self.all.collect do |student|
        student if student.name && student.name.upcase.include?(query.upcase)
      end

      results = results.compact

      if results.length == 1
        results[0]
      end
    end
  end

end
