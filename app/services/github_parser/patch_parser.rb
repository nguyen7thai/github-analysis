module GithubParser
  class PatchParser
    def initialize patch
      @patch = patch
    end

    def line_of_changes
      @patch.scan(/@@.+@@/).map do |position|
        position = position.delete('@@').strip
        changes = position.split(' ')
        changes.map { |change| ChangePosition.new(change) }
      end
    end

    def added_lines
      line_of_changes.map { |position| position[1].lines }.flatten
    end
  end
end
