class ResultsCalculator

  def initialize(city, ends_at = DateTime.current)
    @results = city
      .answers
      .select{|answer| answer.problem.ends_at <= ends_at }
      .map(&:result)
  end

  def object
    @object ||= begin
      first_result = @results.first
      city = CityWrapper.new(
        pollution: 10,
        public_support: 10,
        corporate_support: 10,
        health: 10,
        satisfaction: 10,
        population: 10,
        balance: 10,
        delta_pollution: first_result.delta_pollution,
        delta_public_support: first_result.delta_public_support,
        delta_corporate_support: first_result.delta_corporate_support,
        delta_balance: first_result.delta_balance
      )
      @results[1..-1].each do |result|
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
          delta_balance: result.delta_balance
        )
      end

      city
    end
  end
end

