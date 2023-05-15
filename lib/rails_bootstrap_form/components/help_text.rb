# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Components
    module HelpText
      extend ActiveSupport::Concern

      def self.included(base_class)
        def help_text(attribute, bootstrap_options)
          return if bootstrap_options.help_text == false

          help_text = (bootstrap_options.help_text || scoped_help_text(attribute))

          tag.span(help_text, class: "form-text text-muted") if help_text.present?
        end

        def object_class
          if !object.class.is_a?(ActiveModel::Naming) &&
             object.respond_to?(:klass) && object.klass.is_a?(ActiveModel::Naming)
            object.klass
          else
            object.class
          end
        end

        def partial_scope
          if object_class.respond_to?(:model_name)
            object_class.model_name.name
          else
            object_class.name
          end
        end

        def scoped_help_text(attribute)
          translation_scope = "activerecord.help_texts.#{partial_scope.underscore}"

          help_text = translated_help_text(attribute, translation_scope).presence

          help_text
        end

        def translated_help_text(attribute, scope)
          ActiveSupport::SafeBuffer.new(I18n.t(attribute, scope: scope, default: ""))
        end

        private :help_text, :partial_scope, :object_class, :scoped_help_text
                :translated_help_text
      end
    end
  end
end
