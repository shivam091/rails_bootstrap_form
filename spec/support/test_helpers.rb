# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module TestHelpers
  def sort_attributes(doc)
    doc.dup.traverse do |node|
      if node.is_a?(Nokogiri::XML::Element)
        attributes = node.attribute_nodes.sort_by(&:name)
        attributes.each do |attribute|
          node.delete(attribute.name)
          node[attribute.name] = attribute.value
        end
      end
      node
    end
  end

  def blank_option
    '<option value="" label=" "></option>'
  end

  def options_range(start: 1, stop: 31, selected: nil, months: false)
    (start..stop).map do |n|
      attr = n == selected ? 'selected="selected"' : ""
      label = months ? Date::MONTHNAMES[n] : n
      "<option #{attr} value=\"#{n}\">#{label}</option>"
    end.join("\n")
  end
end
