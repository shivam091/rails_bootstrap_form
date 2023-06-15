# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

require "nokogiri"
require "compare-xml"

RSpec::Matchers.define :match_html do |expected_html, **options|
  match do |actual_html|
    expected_html = expected_html.tr("’", "'") if Rails::VERSION::STRING < "7.1"
    expected_doc = Nokogiri::HTML5.fragment(expected_html)
    actual_doc = Nokogiri::HTML5.fragment(actual_html)

    expected_doc = sort_attributes(expected_doc)
    actual_doc = sort_attributes(actual_doc)

    # Options are documented here: https://github.com/vkononov/compare-xml
    default_options = {
      collapse_whitespace: true,
      ignore_attr_order: true,
      ignore_comments: true,
    }

    options = default_options.merge(options).merge(verbose: true)

    diff = CompareXML.equivalent?(expected_doc, actual_doc, **options)
    diff.blank?
  end
end
