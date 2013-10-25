# Gerador de cidades para testes de balanceamento
class CityGenerator

  def initialize(results = [])
    @city = City.create(name: Faker::Address.city)
    results.reverse.each_with_index do |kind, index|
      problem = Problem.create!(ends_at: (1 + index).days.ago)
      answer = Answer.create!(problem: problem, city: @city)
      Result.create!(send(kind).merge(answer: answer))
    end
  end

  def result
    @result ||= ResultsCalculator.new(@city).object
  end

  def good
    {
      delta_pollution: -5,
      delta_public_support: 5,
      delta_corporate_support: -5,
      delta_balance: -5,
    }
  end

  def neutral
    {
      delta_pollution: 0,
      delta_public_support: 0,
      delta_corporate_support: 0,
      delta_balance: 0,
    }
  end

  def bad
    {
      delta_pollution: 5,
      delta_public_support: -5,
      delta_corporate_support: 5,
      delta_balance: 5,
    }
  end

  def to_s
    "#{@city.name}:\n" +
      CityWrapper::ATTRIBUTES.map {|a| "\t#{a}: #{result.send(a)}\n" }.join
  end

   def self.generate_cities(results)
     require 'database_cleaner'
     DatabaseCleaner.strategy = :truncation; DatabaseCleaner.clean
     cities = []
     results.each do |result|
       cities << CityGenerator.new(result)
     end
     cities.each_with_index {|city, i| puts results[i].join(", "); puts city }
     cities
   end
end
