# == Schema Information
#
# Table name: toys
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Toy < ApplicationRecord
    validates :name, uniqueness: { scope: [:toyable] }
    belongs_to :toyable, polymorphic: true
end
