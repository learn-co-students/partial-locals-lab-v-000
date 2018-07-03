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
# Found Youtube: https://www.youtube.com/watch?v=jKSm8kOWd_0

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(search)
    if search == ""
      @student_search = Student.all
    else
      @student_search = Student.where('name LIKE ?', "%#{search}%")
    end
  end

#   def index
#   if params[:store]
#     @coupon = Coupon.where('store LIKE ?', "%#{params[:store]}%")
#   else
#     @coupon = Coupon.all
#   end
# end

end
