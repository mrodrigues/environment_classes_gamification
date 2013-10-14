require 'spec_helper'

describe ResultsCalculator do
  let(:city) { FactoryGirl.create :city }
  let(:results_calculator) { ResultsCalculator.new(city) }

  it "should have base stats when there's no results yet" do
    [:pollution, :public_support, :corporate_support, :health,
    :satisfaction, :population, :balance].each do |attr|
      results_calculator.send(attr).should == 10
    end
    results_calculator.characteristics.should == []
  end

  it "should add characteristics", wip: true do
    characteristics = ["one thing", "another thing"]
    characteristics.each_with_index do |characteristic, index|
      problem = FactoryGirl.create :problem, ends_at: index.weeks.ago
      answer = FactoryGirl.create :answer, city: city, problem: problem
      result = FactoryGirl.create :result, answer: answer, characteristics: [characteristic]
    end

    results_calculator.characteristics.should == characteristics
  end
end
