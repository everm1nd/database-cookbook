#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Copyright:: Copyright (c) 2011 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/resource'

class Chef
  class Resource
    class Database < Chef::Resource

      def initialize(name, run_context=nil)
        super
        @resource_name = :database
        @database_name = name
        @allowed_actions.push(:create, :drop, :query)
        @action = :create
      end

      attribute :database_name, :kind_of => String, :default => nil
      attribute :connection, :required => true
      attribute :sql, :kind_of => String, :default => nil
      attribute :template, :kind_of => String, :default => "DEFAULT"
      attribute :encoding, :kind_of => String, :default => "DEFAULT"
      attribute :tablespace, :kind_of => String, :default => "DEFAULT"
      attribute :connection_limit, :kind_of => String, :default => "-1"
      attribute :owner, :kind_of => String, :default => nil

    end
  end
end
