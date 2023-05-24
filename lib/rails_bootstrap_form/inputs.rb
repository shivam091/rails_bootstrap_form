# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

module RailsBootstrapForm
  module Inputs
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :CheckBox
    autoload :CollectionCheckBoxes
    autoload :CollectionRadioButtons
    autoload :CollectionSelect
    autoload :ColorField
    autoload :DateField
    autoload :DateSelect
    autoload :DatetimeField
    autoload :DatetimeLocalField
    autoload :DatetimeSelect
    autoload :EmailField
    autoload :FileField
    autoload :GroupedCollectionSelect
    autoload :HiddenField
    autoload :MonthField
    autoload :NumberField
    autoload :PasswordField
    autoload :PhoneField
    autoload :RadioButton
    autoload :RangeField
    autoload :SearchField
    autoload :Select
    autoload :StaticField
    autoload :TelephoneField
    autoload :TextArea
    autoload :TextField
    autoload :TimeField
    autoload :TimeSelect
    autoload :TimeZoneSelect
    autoload :UrlField
    autoload :WeekField
    autoload :WeekdaySelect

    include Base
    include CheckBox
    include CollectionCheckBoxes
    include CollectionRadioButtons
    include CollectionSelect
    include ColorField
    include DateField
    include DateSelect
    include DatetimeField
    include DatetimeLocalField
    include DatetimeSelect
    include EmailField
    include FileField
    include GroupedCollectionSelect
    include HiddenField
    include MonthField
    include NumberField
    include PasswordField
    include PhoneField
    include RadioButton
    include RangeField
    include SearchField
    include Select
    include StaticField
    include TelephoneField
    include TextArea
    include TextField
    include TimeField
    include TimeSelect
    include TimeZoneSelect
    include UrlField
    include WeekField
    include WeekdaySelect
  end
end
