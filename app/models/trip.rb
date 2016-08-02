class Trip < ActiveRecord::Base
validates :title, presence: true
has_many    :objectives
has_many    :locations, through: :objectives
belongs_to  :user
accepts_nested_attributes_for :objectives

  def objectives_attributes=(objectives_attributes)
    objectives_attributes.values.each do |objective_attribute|
      objective = Objective.find_or_create_by(objective_attribute)
      self.objectives << category
    end
  end

end