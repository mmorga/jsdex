require "jsdex/version"
require "jsdex/indexer"
require "jsdex/cli/client"
require "jsdex/parsers/html_parser"
require "jsdex/parsers/markdown_parser"
require "jsdex/parsers/jekyll_markdown_parser"

module Jsdex
    FILE_TYPES = {
        md: Parsers::MarkdownParser,
        jekyll: Parsers::JekyllMarkdownParser,
        html: Parsers::HtmlParser
    }
end
