# frozen_string_literal: true

require 'pry-doc'
require 'pry-stack_explorer'
require 'pry-rescue'
require 'pry-nav'

Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'st', 'show-stack'
