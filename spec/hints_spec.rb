require "spec_helper"

describe SurveyGuru::Hint do
  
  context "building hints" do
    
    it "should allow a string to be passed in" do
      @hint = SurveyGuru::Hint.new("This is my hint")
      @hint.val.should == "This is my hint"
    end
    
  end
  
end