require 'test_helper'

class Jsdex::Cli::Client
    attr_accessor :last_puts

    def puts(str)
        self.last_puts = str.to_s
    end

    def exit()
    end
end

class TestClient < MiniTest::Test
  def setup

    @client = Jsdex::Cli::Client.new()
  end

  def test_that_defaults_are_correct
    options = @client.parse([])
    assert_equal ".", options.source_directory
    refute options.recurse
    assert_equal "./index.json", options.out_file
    assert_equal :jekyll, options.file_type
    assert_equal "/", options.url_prefix
  end

  def test_that_source_dir_option_works
    [["-stest/docs"], ["--source", "test/docs"],
            ["--source=test/docs"]].each do |argv|
        options = @client.parse(argv)
        assert_equal "test/docs", options.source_directory
    end
  end

  def test_that_recurce_option_works
    [["-r"], ["--recurse"]].each do |argv|
        options = @client.parse(argv)
        assert options.recurse
    end

    options = @client.parse(["--no-recurse"])
    refute options.recurse
  end

  def test_that_out_file_option_works
    [["-osearchindex.json"], ["--outfile", "searchindex.json"],
            ["--outfile=searchindex.json"]].each do |argv|
        options = @client.parse(argv)
        assert_equal "searchindex.json", options.out_file
    end
  end

  def test_that_file_type_option_works
    [["-tmd"], ["--type", "md"], ["--type=md"]].each do |argv|
        options = @client.parse(argv)
        assert_equal :md, options.file_type
    end
  end

  def test_that_url_prefix_option_works
    [["-phttp://www.example.com"], ["--urlprefix", "http://www.example.com"],
            ["--urlprefix=http://www.example.com"]].each do |argv|
        @client.stub :exit, nil do
            options = @client.parse(argv)
            assert_equal "http://www.example.com", options.url_prefix
        end
    end
  end

  def test_that_help_option_works
    [["-h"], ["--help"]].each do |argv|
        @client.parse(argv)
        assert_match /Usage\: jsdex \[options\]/, @client.last_puts
    end
  end

  def test_that_version_option_works
    @client.parse(["--version"])
    assert_equal Jsdex::VERSION, @client.last_puts
  end

end
