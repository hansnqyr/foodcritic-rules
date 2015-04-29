#
# Author:: 
# Foodcritic:: Rules
#
# 
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

rule 'UOD001', 'Use version constraints on dependencies' do
  tags %w{correctness uod}
  metadata do |ast|
    ast.xpath('//command[descendant::ident[@value = "depends"]]').map do |dep|
      unless dep.xpath('args_add_block/descendant::tstring_content').count > 1
        dep
      end
    end.compact
  end
end
