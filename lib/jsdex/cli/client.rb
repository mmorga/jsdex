require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'

module Jsdex
  module Cli
    class Client
      #
      # Return a structure describing the options.
      #
      def parse(args)
        # The options specified on the command line will be collected in *options*.
        # We set default values here.
        options = OpenStruct.new
        options.source_directory = "."
        options.recurse = false
        options.out_file = "./index.json"
        options.file_type = :jekyll
        options.url_prefix = "/"


        opt_parser = OptionParser.new do |opts|
          opts.banner = "Usage: jsdex [options]"

          opts.separator ""
          opts.separator "Specific options:"

          opts.on("-s", "--source DIR",
                  "Build index from sources in DIR") do |lib|
            options.source_directory = lib
          end

          # Boolean switch.
          opts.on("-r", "--[no-]recurse",
                  "Recurse into source sub-directories") do |recurse|
            options.recurse = recurse
          end

          opts.on("-o", "--outfile FILE",
                  "Write JSON index into FILE") do |out_file|
            options.out_file = out_file
          end

          opts.on("-t", "--type FILETYPE", Jsdex::FILE_TYPES.keys,
                  "File type if parsed sources: ",
                  "#{Jsdex::FILE_TYPES.keys.collect(&:to_s).join(", ")}") do |file_type|
            options.file_type = file_type
          end

          opts.on("-p", "--urlprefix FILE",
                  "URL prefix for indexed files") do |url_prefix|
            options.url_prefix = url_prefix
          end

          opts.separator ""
          opts.separator "Common options:"

          # No argument, shows at tail.  This will print an options summary.
          # Try it and see!
          opts.on_tail("-h", "--help", "Show this message") do
            puts opts
            exit
          end

          # Another typical switch to print the version.
          opts.on_tail("--version", "Show version") do
            puts Jsdex::VERSION
            exit
          end
        end

        opt_parser.parse!(args)
        options
      end  # parse()

    end
  end
end

