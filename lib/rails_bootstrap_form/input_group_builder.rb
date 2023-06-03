# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module InputGroupBuilder
    extend ActiveSupport::Concern

    def self.included(base_class)
      def input_group_wrapper(attribute, bootstrap, &block)
        input = capture(&block) || ActiveSupport::SafeBuffer.new

        if input_group_required?(bootstrap)
          prepend = attach_input(bootstrap, :prepend)
          append = attach_input(bootstrap, :append)

          input = prepend + input + append
          input += generate_error(attribute)

          input = tag.div(input, class: input_group_classes(attribute, bootstrap))
        else
          input += generate_error(attribute)
        end

        input
      end

      def input_group_classes(attribute, bootstrap)
        classes = Array("input-group") << bootstrap.additional_input_group_class
        if is_size_valid?(bootstrap)
          classes << "input-group-#{bootstrap.size}"
        end
        # Require `has-validation` class if field has errors.
        classes << "has-validation" if is_invalid?(attribute)
        classes.flatten.compact
      end

      def attach_input(bootstrap, key)
        tags = [*bootstrap.send(key)].map do |item|
          input_group_content(item)
        end

        ActiveSupport::SafeBuffer.new(tags.join)
      end

      def input_group_content(content)
        return content if /button|submit/.match?(content)

        tag.span(content.html_safe, class: "input-group-text")
      end

      def input_group_required?(bootstrap)
        [
          bootstrap.prepend,
          bootstrap.append
        ].any?(&:present?)
      end

      private :input_group_wrapper, :input_group_classes, :attach_input,
              :input_group_content, :input_group_required?
    end
  end
end
