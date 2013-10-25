class ResultsCalculator

  delegate :pollution, :public_support, :corporate_support, :health, 
    :satisfaction, :population, :balance, :characteristics, to: :object
  delegate :name, to: :@city

  def initialize(city, last_problem = Problem.last)
    @city = city
    @results = @city
      .answers
      .select{|answer| answer.problem.ends_at <= last_problem.ends_at }
      .map(&:result)
      .compact
  end

  def object
    @object ||= begin
      city = CityWrapper.new(
        pollution: 0,
        public_support: 5,
        corporate_support: 5,
        health: 0,
        satisfaction: 5,
        population: 10,
        balance: 5,
        characteristics: []
      )

      @results.each do |result|
        city = CityWrapper.new(
          pollution: city.pollution,
          public_support: city.public_support,
          corporate_support: city.corporate_support,
          health: city.health,
          satisfaction: city.satisfaction,
          population: city.population,
          balance: city.balance,
          delta_pollution: result.delta_pollution,
          delta_public_support: result.delta_public_support,
          delta_corporate_support: result.delta_corporate_support,
          delta_balance: result.delta_balance,
          characteristics: city.characteristics + result.characteristics
        )
      end

      city
    end
  end
end

