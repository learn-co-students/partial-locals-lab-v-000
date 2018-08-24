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

  def self.search(search_query)
    # https://stackoverflow.com/questions/22596861/how-can-i-match-a-partial-string-to-a-databases-objects-attribute-regexp
    if !search_query.blank?
      where('name like ?', "%#{search_query}%")
    else
      self.all
    end
  end
end
