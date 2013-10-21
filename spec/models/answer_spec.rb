require 'spec_helper'

describe Answer do
  describe "permissions" do
    let(:ability) { Ability.new(user) }
    let(:user) { FactoryGirl.create :user }
    let(:answer) { FactoryGirl.build :answer, city: FactoryGirl.create(:city, user: user) }

    it "should not be able to create an answer to a different user" do
      answer.city = FactoryGirl.create(:user).city
      ability.should_not be_able_to :create, answer
    end

    it "should not be able to update an answer to a different user" do
      answer.city = FactoryGirl.create(:user).city
      ability.should_not be_able_to :update, answer
    end

    it "should be able to update an answer without a result" do
      ability.should be_able_to :update, answer
    end

    it "should not be able to update an answer if the result is a valid answer" do
      answer.result = FactoryGirl.create :result, valid_answer: true, answer: answer
      ability.should_not be_able_to :update, answer
    end

    it "should be able to update an answer if the result is a invalid answer" do
      answer.result = FactoryGirl.create :result, valid_answer: false, answer: answer
      ability.should be_able_to :update, answer
    end

    it "should not be able to create an answer for a past problem" do
      old_problem = FactoryGirl.create :problem, ends_at: 1.week.ago
      answer.problem = old_problem
      ability.should_not be_able_to :create, answer
    end
  end
end
