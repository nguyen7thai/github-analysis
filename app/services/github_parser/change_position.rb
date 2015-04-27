module GithubParser
  class ChangePosition
    attr_accessor :start, :step_count, :is_adding

    def initialize change_string
      @is_adding = change_string.chr == '+'
      array = change_string.delete!(change_string.chr).split(',')
      @start = array.first.to_i
      @step_count = array.last.to_i
    end

    def lines
      (start..(step_count + start)).to_a
    end

    def index_of_line line
      line - start
    end

    def include_line? line
      lines.include? line
    end
  end
end
