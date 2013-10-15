require 'spec_helper'

describe Problem do
  describe "::current" do
    it "should return nil if there's no current problem" do
      Problem.current.should be_nil
    end

    it "should return the problem if there's only one" do
      problem = FactoryGirl.create :problem, ends_at: 1.week.from_now
      Problem.current.should == problem
    end

    it "should return the problem which end's still not reached" do
      old_problem = FactoryGirl.create :problem, ends_at: 1.week.ago
      new_problem = FactoryGirl.create :problem, ends_at: 1.week.from_now
      Problem.current.should == new_problem
    end

    it "should return nil if there's only past problems" do
      old_problem = FactoryGirl.create :problem, ends_at: 1.week.ago
      oldest_problem = FactoryGirl.create :problem, ends_at: 2.weeks.ago
      Problem.current.should be_nil
    end
  end
end
