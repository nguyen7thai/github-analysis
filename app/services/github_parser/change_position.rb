module GithubParser
  class ChangePosition
    attr_accessor :start, :step_count, :is_adding

    def initialize change_string
      @is_adding = change_string[0] == '+'
      @start = change_string[1].to_i
      @step_count = change_string[3].to_i
    end

    def lines
      (start..(step_count + start)).to_a
    end
  end
end
