# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module InputGroupBuilder
    extend ActiveSupport::Concern

    def self.included(base_class)
      def input_group_wrapper(attribute, bootstrap_options, &block)
        input = capture(&block) || ActiveSupport::SafeBuffer.new

        if input_group_required?(bootstrap_options)
          prepend = attach_input(bootstrap_options, :prepend)
          append = attach_input(bootstrap_options, :append)

          input = prepend + input + append
          input += generate_error(attribute)

          input = tag.div(input, class: input_group_classes(attribute, bootstrap_options))
        else
          input += generate_error(attribute)
        end

        input
      end

      def input_group_classes(attribute, bootstrap_options)
        classes = ["input-group", bootstrap_options.additional_input_group_class]
        # Require `has-validation` class if field has errors.
        classes << "has-validation" if is_invalid?(attribute)
        classes.flatten.compact
      end

      def attach_input(bootstrap_options, key)
        tags = [*bootstrap_options.send(key)].map do |item|
          input_group_content(item)
        end

        ActiveSupport::SafeBuffer.new(tags.join)
      end

      def input_group_content(content)
        return content if /button|submit/.match?(content)

        tag.span(content.html_safe, class: "input-group-text")
      end

      def input_group_required?(bootstrap_options)
        [
          bootstrap_options.prepend,
          bootstrap_options.append
        ].any?(&:present?)
      end

      private :input_group_wrapper, :input_group_classes, :attach_input,
              :input_group_content, :input_group_required?
    end
  end
end
