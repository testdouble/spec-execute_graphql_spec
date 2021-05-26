RSpec::GraphQLResponse.add_context_helper :with_schema do |schema|
  # return unless schema.is_a? == GraphQL::Schema
  RSpec::GraphQLResponse.configuration.graphql_schema = schema
end
