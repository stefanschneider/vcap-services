# Copyright (c) 2009-2011 VMware, Inc.
# Copyright (c) 2011 Uhuru Software, Inc., All Rights Reserved
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', '..', '..', 'base', 'lib')

require 'base/provisioner'
require 'mssql_service/common'

class VCAP::Services::Mssql::Provisioner < VCAP::Services::Base::Provisioner

  include VCAP::Services::Mssql::Common

  def node_score(node)
    node['available_storage'] if node
  end

end
