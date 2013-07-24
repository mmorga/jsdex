require 'test_helper'
require 'set'


class TestIndexer < MiniTest::Test
  def setup
    @indexer = Jsdex::Indexer.build("test/docs")
  end

  def test_that_file_count_is_correct
    assert_equal 10, @indexer.files_indexed
  end

  def test_that_it_indexed_a_word_for_matching_documents
    expected_docs = Set.new([
      "test/docs/2013-01-01-a-day-his-see-me-come-many-from-if-of-just-other.md",
      "test/docs/2013-01-02-some-have-a-which-on.md",
      "test/docs/2013-01-03-he-more-for-some-many-which-they.md",
      "test/docs/2013-01-04-or-he-as-it-my.md",
      "test/docs/2013-01-05-more-my-man-by-she-to-its-when-we-give.md",
      "test/docs/2013-01-07-think-take-your-so-day.md",
      "test/docs/2013-01-10-time-all-about.md"])

    assert_equal expected_docs, @indexer.documents("people")
  end
end

# 2013-01-01-a-day-his-see-me-come-many-from-if-of-just-other.md:3
# 2013-01-02-some-have-a-which-on.md:1
# 2013-01-03-he-more-for-some-many-which-they.md:4
# 2013-01-04-or-he-as-it-my.md:1
# 2013-01-05-more-my-man-by-she-to-its-when-we-give.md:2
# 2013-01-06-a-for-because-these-as-up-because-if-it-at-by.md:0
# 2013-01-07-think-take-your-so-day.md:2
# 2013-01-08-him-i-who-new-find-could-my.md:0
# 2013-01-09-as-into-here.md:0
# 2013-01-10-time-all-about.md:2
