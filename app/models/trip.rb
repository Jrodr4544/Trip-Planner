class Trip < ActiveRecord::Base
validates :title, presence: true
has_many    :objectives
has_many    :locations, through: :objectives
belongs_to  :user


end