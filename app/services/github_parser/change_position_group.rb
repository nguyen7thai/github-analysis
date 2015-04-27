module GithubParser
  class ChangePositionGroup
    def initialize string
      position = string.delete('@@').strip
      changes = position.split(' ')
      @removed_lines = ChangePosition.new(changes.first)
      @added_lines = ChangePosition.new(changes.last)
    end

    def added_lines
      @added_lines
    end

    def removed_lines
      @removed_lines
    end
  end
end
