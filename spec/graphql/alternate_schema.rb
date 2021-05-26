require "graphql/alternate_schema/alternate_types"
require "graphql/alternate_schema/alternate_queries"

class AlternateSchema < GraphQL::Schema
  query AlternateQueries
end
