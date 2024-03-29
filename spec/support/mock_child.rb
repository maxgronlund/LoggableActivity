# frozen_string_literal: true

require 'active_record'

class MockChild < ActiveRecord::Base
  self.table_name = 'mock_children'
  ::LoggableActivity::Configuration.load_config_file('spec/test_files/loggable_activity.yml')
  include LoggableActivity::Hooks
  belongs_to :mock_parent

  def name_and_age
    "#{name.capitalize} is #{age} years old"
  end
end
