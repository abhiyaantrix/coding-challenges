# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'
require 'simplecov-cobertura'

SimpleCov.start do
  add_filter '/spec/'

  track_files '**/*.rb'

  SimpleCov::Formatter::Console.max_rows = 5
  SimpleCov::Formatter::Console.output_style = 'block'

  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::Console,
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::CoberturaFormatter
  ])
end
