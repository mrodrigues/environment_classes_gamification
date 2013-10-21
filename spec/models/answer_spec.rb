require 'spec_helper'

describe Answer do
  describe "permissions" do
    let(:ability) { Ability.new(user) }
    let(:user) { FactoryGirl.create :user }
    let(:answer) { FactoryGirl.create :answer, city: FactoryGirl.create(:city, user: user) }

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
  end
end
