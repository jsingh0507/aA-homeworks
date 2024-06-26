# == Schema Information
#
# Table name: houses
#
#  id         :bigint           not null, primary key
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class House < ApplicationRecord
    validates :address, presence: true
    has_many :residents,
        class_name: :Person,
        primary_key: :id,
        foreign_key: :house_id
end
