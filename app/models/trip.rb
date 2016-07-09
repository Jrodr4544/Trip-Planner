class Trip < ActiveRecord::Base
validates :title, presence: true
has_many    :objectives
belongs_to  :user
end