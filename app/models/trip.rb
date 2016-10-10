class Trip < ActiveRecord::Base
validates :title, presence: true
has_many    :objectives
has_many    :locations, through: :objectives
belongs_to  :user
accepts_nested_attributes_for :objectives

  def objectives_attributes=(objectives_attributes)
    # raise objectives_attributes.inspect
    objectives_attributes.try(:values).try(:each) do |objective_attribute|
      objective = Objective.find_or_create_by(objective_attribute)
      self.objectives << objective
    end
  end   

end