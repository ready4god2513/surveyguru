module SurveyGuru
  
  class Question
    
    attr_accessor :name
    
    def initialize(str, *args, &block)
      @name = str
      @type = SurveyGuru::Type.new
    end
    
  end
  
end