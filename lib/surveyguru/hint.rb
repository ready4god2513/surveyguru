module SurveyGuru
  
  class Hint
    
    attr_accessor :val
    
    def initialize(str)
      @val = str.to_s
    end
    
    def to_s
      @val
    end
    
  end
  
end