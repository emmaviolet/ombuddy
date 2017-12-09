# frozen_string_literal: true

require "erb"

module FixtureHelpers
  def fixture_path
    File.join(__dir__, "..", "fixtures")
  end

  def fixture(path)
    File.read(File.join(fixture_path, path))
  end

  def json_fixture(path)
    JSON.parse(fixture(path + ".json"))
  end

  def erb_fixture(path, values = {})
    body = fixture(path + ".erb")
    ERB.new(body).result(Namespace.new(values).get_binding)
  end

  def json_erb_fixture(path, values)
    body = fixture(path + ".json.erb")
    evaluated_body = ERB.new(body).result(Namespace.new(values).get_binding)
    JSON.parse(evaluated_body)
  end

  class Namespace
    def initialize(hash)
      hash.each do |key, value|
        singleton_class.send(:define_method, key) { value }
      end
    end

    def get_binding # rubocop:disable Naming/AccessorMethodName
      binding
    end
  end
end
