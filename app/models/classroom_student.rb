# == Schema Information
#
# Table name: classroom_students
#
#  id           :integer          not null, primary key
#  classroom_id :integer
#  student_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ClassroomStudent < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :student

  def oldest_student
    students.where("birthday is not null").order("birthday asc").first
  end
end
