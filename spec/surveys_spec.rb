require "spec_helper"

describe SurveyGuru::Survey do
  
  context "responders" do
    
    it "should respond to page" do
      @survey = SurveyGuru::Survey.new
      @survey.should respond_to(:page)
    end
    
  end
  
end