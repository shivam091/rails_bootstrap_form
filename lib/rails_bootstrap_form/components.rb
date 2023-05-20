# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Components
    extend ActiveSupport::Autoload

    autoload :HelpText
    autoload :Labels
    autoload :RequiredField
    autoload :Errors
    autoload :CheckBox
    autoload :RadioButton

    include HelpText
    include Labels
    include RequiredField
    include Errors
    include CheckBox
    include RadioButton
  end
end
