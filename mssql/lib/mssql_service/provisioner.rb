# Copyright (c) 2009-2011 VMware, Inc.
# Copyright (c) 2011 Uhuru Software, Inc., All Rights Reserved

require 'mssql_service/common'

class VCAP::Services::Mssql::Provisioner < VCAP::Services::Base::Provisioner

  include VCAP::Services::Mssql::Common

end
