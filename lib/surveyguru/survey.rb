module SurveyGuru
  
  class Survey
    
    def page(*args, &block)
      SurveyGuru::Page.new(args, block)
    end
    
  end
  
end