require "graphql/queries/characters"

class AlternateQueries < GraphQL::Schema::Object
  graphql_name "Query"

  field :employees, resolver: Queries::Characters
end
