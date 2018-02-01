class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def downcase_name
    self.name.downcase
  end

  def self.search(query)
    @results = []
    if query.empty?
      @results = Student.all
    else
      Student.all.each do |student|
        if student.downcase_name.include?(query)
          @results << student
        end
      end
    end
    @results
  end
end
