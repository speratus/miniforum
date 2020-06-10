class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def graphql_type
    Types::BaseObject
  end
end
