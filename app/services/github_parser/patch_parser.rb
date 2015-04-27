module GithubParser
  class PatchParser
    def initialize patch
      @patch = patch
    end

    def find_index_for_line(line)
      step = 1
      modifying_symbols_blocks.each do |group, symbols|
        if group.added_lines.include_line? line
          block_start = group.added_lines.start - 1
          index = 0
          while block_start < line do
            if symbols[index] != '-'
              block_start += 1
            end
            step += 1
            index += 1
          end
          break
        else
          step += symbols.size
        end
      end
      step
    end

    def added_lines
      line_of_changes.map { |position| position.added_lines.lines }.flatten
    end

    private

    def line_of_changes
      @patch.scan(/@@.+@@/).map { |position| ChangePositionGroup.new(position) }
    end

    def lines_blocks
      result = {}
      current_block = ''
      @patch.each_line do |line|
        position_pattern = line.scan(/@@.+@@/)
        if position_pattern.present?
          current_block = ChangePositionGroup.new(position_pattern.first)
          result[current_block] = []
        else
          result[current_block] << line
        end
      end
      result
    end

    def modifying_symbols_blocks
      hash = lines_blocks
      hash.each do |k, v|
        hash[k] = v.map do |line|
          line.first =~ /\+|-/ ? line.first : nil
        end
      end
      hash
    end
  end
end
