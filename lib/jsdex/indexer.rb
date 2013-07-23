require 'set'

module Jsdex
    class Indexer
        attr_accessor :files_indexed
        attr_accessor :doc_dir
        attr_accessor :index

        def self.build(doc_dir)
            indexer = Indexer.new
            indexer.doc_dir = doc_dir
            indexer.build
            indexer
        end

        def build
            search_path = File.join(self.doc_dir, "*")
            files = Dir.glob(search_path)
            @files_indexed = files.length
            # TODO: refactor this to its own class
            files.each do |file|
                File.open(file).readlines.each do |line|
                    line.split(/[\s[[:punct:]]]/).uniq.each do |word|
                        # TODO: remove punctuation
                        word = word.downcase
                        self.index[word] = Set.new unless self.index.include?(word)
                        self.index[word] << file
                    end
                end
            end
        end

        def initialize
            self.files_indexed = 0
            self.doc_dir = "."
            self.index = {}
        end

        def documents(term)
            return self.index[term.downcase]
        end
    end
end
