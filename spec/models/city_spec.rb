require 'spec_helper'

describe City do
  let(:city) { FactoryGirl.create :city }

  describe "#valid_answers" do
    let(:valid_answer) do
      valid_answer = FactoryGirl.build :answer, city: city
      valid_answer.result = FactoryGirl.create :result, answer: valid_answer, valid_answer: true
      valid_answer
    end

    let(:invalid_answer) do
      invalid_answer = FactoryGirl.build :answer, city: city
      invalid_answer.result = FactoryGirl.create :result, answer: invalid_answer, valid_answer: false
      invalid_answer
    end

    before do
      city.answers << valid_answer
      city.answers << invalid_answer
    end

    it "should only includes the valid answers" do
      city.valid_answers.should include valid_answer
      city.valid_answers.should_not include invalid_answer
    end
  end
end
