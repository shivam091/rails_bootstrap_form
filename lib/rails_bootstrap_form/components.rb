# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Components
    extend ActiveSupport::Autoload

    autoload :HelpText

    include HelpText
  end
end
