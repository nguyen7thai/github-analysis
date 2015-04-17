module Analytics
  class CommentCount
    def initialize comments
      @comments = comments
    end

    def call
      result = {}
      @comments.each do |comment|
        result[comment.username] = result.fetch(comment.username, 0) + 1
      end
      result.sort_by { |key, value| -value }
    end
  end
end
