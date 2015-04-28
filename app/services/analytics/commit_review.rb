module Analytics
  class CommitReview
    IGNORE_FILES = [
      'schema.rb'
    ]

    def initialize commit
      @commit = commit
    end

    def call
      hash = {}
      @commit.changed_files.each do |file|
        file_name = file.to_h[:filename]

        if check_file? file.to_h[:filename]
          p "Running review for #{file_name}"
          begin
            rubo_cop_results = process_review_file file_name
            review_results = remove_review_results_not_in_commit file, rubo_cop_results
          rescue Octokit::NotFound
            review_results = []
            p "Find not found: #{file_name}"
          end
          hash[file_name] = transform_results file, review_results
        else
          p "Skip reviewing for #{file_name}"
        end
      end
      hash
    end

    private
    def check_file? filename
      !!(filename =~ /\.rb$/) && !(filename =~ Regexp.union(IGNORE_FILES))
    end

    def process_review_file file_name
      file_content = GithubService.file_raw_content @commit.repository.name, @commit.sha, file_name
      ::ReviewTool::RuboCop.run(file_content, file_name)
    end

    def remove_review_results_not_in_commit file, review_results
      added_lines = GithubParser::PatchParser.new(file.to_h[:patch]).added_lines
      review_results.select { |result| added_lines.include? result.line.to_i }
    end

    def transform_results file, review_results
      patch_parser = GithubParser::PatchParser.new(file.to_h[:patch])
      proc = Proc.new { |line| patch_parser.find_index_for_line(line) }

      review_results.map do |result|
        ::ReviewTool::ResultDecorator.new result, proc
      end
    end
  end
end
