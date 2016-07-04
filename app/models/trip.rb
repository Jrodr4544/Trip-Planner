class Trip < ActiveRecord::Base

has_many    :objectives
belongs_to  :user

end