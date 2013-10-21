require 'spec_helper'

describe AnswersController do

  before { login }

  describe "PATCH update" do
    it "should erase the result for an invalid answer" do
      answer = FactoryGirl.create :answer
      result = FactoryGirl.create :result, valid_answer: false, answer: answer
      answer.reload.result.should == result

      patch :update, id: answer.to_param, problem_id: answer.problem.to_param, answer: answer.attributes
      answer.reload.result.should be_nil
    end
  end

end

