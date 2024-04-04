# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string
#  house_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord
    belongs_to :house,
        class_name: :House,
        primary_key: :id,
        foreign_key: :house_id

    validates :name, presence: true
    validates :house_id, presence: true
end
