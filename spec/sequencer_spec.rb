require "spec_helper"

describe SurveyGuru::Sequencer do
  
  context "responders" do
    
    let(:sequencer) { SurveyGuru::Sequencer.new }
    
    it "should respond to whilst" do
      sequencer.should respond_to(:whilst)
    end
    
    it "should respond to method_missing" do
      sequencer.whatever.class.name.should == "SurveyGuru::Question" 
    end
    
  end
  
end