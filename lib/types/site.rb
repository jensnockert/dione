# Copyright 2014 Jens Nockert
#
# Licensed under the EUPL, Version 1.1 or – as soon they will be approved by
# the European Commission - subsequent versions of the EUPL (the "Licence");
# You may not use this work except in compliance with the Licence.
# You may obtain a copy of the Licence at: https://joinup.ec.europa.eu/software/page/eupl
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the Licence is distributed on an "AS IS" basis,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the Licence for the specific language governing permissions and
# limitations under the Licence.

module Dione
  class Site < Dione::Object
    type 'dione/site'

    def posts
      self.database.view(:dione, :posts, reify: true, descending: true)
    end

    def to_liquid
      {
        'title' => self['title'],
        'posts' => lambda { self.posts }
      }
    end
  end
end