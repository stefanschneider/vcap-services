# Copyright (c) 2009-2011 VMware, Inc.
# Copyright (c) 2011 Uhuru Software, Inc., All Rights Reserved

require 'mssql_service/common'

class VCAP::Services::Mssql::Provisioner < VCAP::Services::Base::Provisioner

  include VCAP::Services::Mssql::Common

  # TODO: remove this overridden method after the mssql_node is changes to support available_capacity instead of available_storage
  # left only for backwards compatible reasons with mssql_node
  def node_score(node)
    node['available_storage'] if node
  end

end
