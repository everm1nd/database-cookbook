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

require File.join(File.dirname(__FILE__), 'resource_database')

class Chef
  class Resource
    class DatabaseUser < Chef::Resource::Database

      def initialize(name, run_context=nil)
        super
        @resource_name = :database_user
        @username = name

        @database_name = nil
        @table = nil
        @host = 'localhost'
        @privileges = [:all]

        @allowed_actions.push(:create, :drop, :grant)
        @action = :create
      end

      attribute :database_name, :kind_of => String, :default => nil
      attribute :username, :kind_of => String, :default => nil
      attribute :password, :kind_of => String, :default => nil, :required => true
      attribute :table, :kind_of => String, :default => nil
      attribute :host, :kind_of => String, :default => nil
      attribute :privileges, :kind_of => String, :default => nil

    end
  end
end
