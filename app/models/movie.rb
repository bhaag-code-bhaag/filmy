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
#  poster      :string(255)
#

class Movie < ActiveRecord::Base
  validates :name, presence: true

  mount_uploader :poster, PosterUploader
end
