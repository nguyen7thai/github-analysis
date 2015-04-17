module Analytics
  class NoReplyComments
    def initialize comments
      @comments = comments
    end

    def call
      comments = Arel::Table.new(:comments)
      positions = @comments.group('commit_id, line').having(comments[:commit_id].count.eq(1)).select(comments[:commit_id], comments[:line])
      positions.map do |position|
        @comments.find_by(commit_id: position.commit_id, line: position.line)
      end
    end
  end
end
