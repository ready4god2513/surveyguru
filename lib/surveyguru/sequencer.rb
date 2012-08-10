module SurveyGuru

  class Sequencer

    def whilst(&block)
      yield
    end

    def method_missing(m, *args, &block)  
      SurveyGuru::Question.find(m)
    end

  end

end