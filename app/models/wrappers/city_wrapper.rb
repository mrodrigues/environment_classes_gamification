class CityWrapper
  ATTRIBUTES = [:pollution, :public_support, :corporate_support, :health, :satisfaction, :population, :balance]
  attr_writer  *ATTRIBUTES
  attr_accessor :delta_pollution, :delta_public_support, :delta_corporate_support, :delta_balance, :characteristics

  def initialize(attributes)
    self.characteristics = attributes.delete :characteristics || []
    attributes.each {|attr, value| send("#{attr}=", value.to_f)}
  end

  ATTRIBUTES.each do |attr|
    define_method attr do
      apply(attr)
    end
  end

  def apply(attribute)
    # If it's the first turn, or in other words, there's no result yet,
    # returns the base values instead of the modified ones
    return instance_variable_get "@#{attribute}" if delta_pollution.nil?
    functions = {
      pollution: ->{ delta_pollution + @pollution },
      public_support: ->{ 0.5 * delta_public_support + @public_support },
      corporate_support: ->{ delta_corporate_support + @corporate_support },
      health: ->{ - pollution / 10 + @health },
      satisfaction: ->{ (public_support - pollution) / 10 + @satisfaction },
      population: ->{ (1 + (1 + health)/10) * @population },
      balance: ->{ (population * satisfaction) / 100 + corporate_support/10 + delta_balance + @balance }
    }

    functions[attribute].call
  end
end
