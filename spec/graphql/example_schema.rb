require "graphql/example_schema/example_types"
require "graphql/example_schema/example_queries"

class ExampleSchema < GraphQL::Schema
  query ExampleQueries
end
