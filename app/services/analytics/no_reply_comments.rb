module Analytics
  class NoReplyComments
    def initialize comments
      @comments = comments
    end

    def call
      ids = @comments.ids
      comments = Arel::Table.new(:comments)

      positions = comments.project(comments[:commit_id], comments[:line], comments[:file_path])
                          .where(comments[:id].in ids)
                          .group('commit_id, line, file_path')
                          .having(comments[:commit_id].count.eq(1))
                          .as('positions')
      comment_without_reply = comments.join(positions)
                                      .on(comments[:commit_id].eq(positions[:commit_id]),
                                          comments[:line].eq(positions[:line]),
                                          comments[:file_path].eq(positions[:file_path]))
                                      .project(Arel.star)
      Comment.find_by_sql comment_without_reply
    end
  end
end
