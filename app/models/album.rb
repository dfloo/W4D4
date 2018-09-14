# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :text             not null
#  year       :integer          not null
#  live?      :boolean          default(FALSE)
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true
  validates :live?, inclusion: { in: [true, false] }
end
