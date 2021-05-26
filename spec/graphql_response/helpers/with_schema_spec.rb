require "graphql/alternate_schema"

RSpec.describe RSpec::GraphQLResponse, "helper#with_schema", type: :graphql do
  with_schema AlternateSchema

  graphql_operation <<-GQL
    query {
      employees {
        id,
        name
      }
    }
  GQL

  it "queries the correct schema with employees" do
      expect(response).to_not be_nil
      expect(response_data).to include(
        "employees" => [
          {
            "id" => "1",
            "name" => "Jam",
            "friends" => [
              { "id" => "2", "name" => "Redemption" }
            ]
          },
          {
            "id" => "2",
            "name" => "Redemption",
            "friends" => [
              { "id" => "1", "name" => "Jam" },
              { "id" => "3", "name" => "Pet" }
            ]
          },
          {
            "id" => "3",
            "name" => "Pet",
            "friends" => [
              { "id" => "2", "name" => "Redemption" }
            ]
          }
        ]
      )
  end
end
