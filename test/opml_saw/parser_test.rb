require "test_helper"
require "pp"

class ParserTest < Test::Unit::TestCase
  def setup
    sample_opml = File.join(File.expand_path(File.dirname(File.dirname(__FILE__))), 'sample_opml')
    file = File.open(File.join(sample_opml, 'subscriptions_with_folder.xml'), 'r')
    @opml = OpmlSaw::Parser.new(file.read)
    @opml.parse
  end
  
  def test_has_opml
    pp @opml.feeds
    assert_equal @opml.feeds[3][:tag], 'News'
  end
end
