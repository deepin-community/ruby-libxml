# encoding: UTF-8

require_relative './test_helper'


class NodeCommentTest < Minitest::Test
  def setup
    xp = LibXML::XML::Parser.string('<root></root>')
    @doc = xp.parse
    assert_instance_of(LibXML::XML::Document, @doc)
    @root = @doc.root
  end

  def test_libxml_node_add_comment_01
    @root << LibXML::XML::Node.new_comment('mycomment')
    assert_equal '<root><!--mycomment--></root>',
      @root.to_s.gsub(/\n\s*/,'')
  end

  def test_libxml_node_add_comment_02
    @root << LibXML::XML::Node.new_comment('mycomment')
    assert_equal 'comment',
    @root.child.node_type_name
  end

  def test_libxml_node_add_comment_03
    @root << el = LibXML::XML::Node.new_comment('mycomment')
    el << "_this_is_added"
    assert_equal '<root><!--mycomment_this_is_added--></root>',
    @root.to_s.gsub(/\n\s*/,'')
  end
end
