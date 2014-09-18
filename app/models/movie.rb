# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  tag_line    :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Movie < ActiveRecord::Base
  validates :name, presence: true
end
