require "graphql/queries/characters"

class ExampleQueries < GraphQL::Schema::Object
  graphql_name "Query"

  field :characters, resolver: Queries::Characters
end
