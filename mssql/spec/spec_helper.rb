# Copyright (c) 2009-2011 VMware, Inc.
$:.unshift File.join(File.dirname(__FILE__), '..')
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'rspec'
require 'bundler/setup'
require 'vcap_services_base'
require 'mssql_service/provisioner'


def getLogger()
  logger = Logger.new( STDOUT)
  logger.level = Logger::ERROR
  return logger
end

def parse_property(hash, key, type, options = {})
  obj = hash[key]
  if obj.nil?
    raise "Missing required option: #{key}" unless options[:optional]
    nil
  elsif type == Range
    raise "Invalid Range object: #{obj}" unless obj.kind_of?(Hash)
    first, last = obj["first"], obj["last"]
    raise "Invalid Range object: #{obj}" unless first.kind_of?(Integer) and last.kind_of?(Integer)
    Range.new(first, last)
  else
    raise "Invalid #{type} object: #{obj}" unless obj.kind_of?(type)
    obj
  end
end

def config_base_dir
  ENV["CLOUD_FOUNDRY_CONFIG_PATH"] || File.join(File.dirname(__FILE__), '..', 'config')
end

def getProvisionerTestConfig()
  config_file = File.join(config_base_dir, 'mssql_gateway.yml')
  config = YAML.load_file(config_file)
  config = VCAP.symbolize_keys(config)
  options = {
      :logger   => getLogger,
      :version  => config[:service][:version],
      :local_ip => config[:host],
      :plan_management => config[:plan_management],
      :mbus => config[:mbus]
  }
  options
end
