module ReviewTool
  class RuboCop < RuboCop::Runner
    def initialize
      @config_store = ::RuboCop::ConfigStore.new
      @errors = []
      @aborting = false
      @options = {}
    end

    def self.run(file, path)
      new.process_file(file, path)
    end

    def process_file(file, path = nil)
      processed_source = ::RuboCop::ProcessedSource.new(file, path)
      do_inspection_loop(file, processed_source, path)
    rescue InfiniteCorrectionLoop => e
      raise
    end

    private
    def do_inspection_loop(file, processed_source, path = nil)
      offenses = []
      @processed_sources = []
      loop do
        check_for_infinite_loop(processed_source, offenses)
        offenses.select!(&:corrected?)
        new_offenses, updated_source_file = inspect_file(processed_source)
        offenses.concat(new_offenses).uniq!
        break unless updated_source_file
        processed_source = ::RuboCop::ProcessedSource.new(file, path)
      end
      offenses
    end
  end

  class ResultDecorator < SimpleDelegator
    def initialize(result, position_block)
      @block = position_block
      super(result)
    end

    def position_index
      @block.call(self.line)
    end
  end
end
