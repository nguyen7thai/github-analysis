module Analytics
  class ReviewInChangedLines
    def initialize commit
      @commit = commit
    end

    # Commit review is for the whole page, this method is to
    #   get only review result in the added lines of the file
    #   in the commit.
    def call
      review_results = CommitReview.new(@commit).call
      @commit.changed_files.each do |file|
        file.to_h[:filename]
        positions = GithubParser::PatchParser.new(file.to_h[:patch]).line_of_changes
        added_lines = positions.map { |position| position[1].lines }
        review_results[file].select! { |change| added_lines.includes? change.line }
      end
      review_results
    end
  end
end
