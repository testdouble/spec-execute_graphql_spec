# Upgrade Guide

## v0.3.0 to v0.4.0

There is a breaking change between v0.3.0 and v0.4.0 where the helper `graphql_query` was renamed to `graphql_operation`. In order to migrate to v0.4.0 all references to `graphql_query` can be replaced with `graphql_operation`.

## v0.1.0 to v0.2.0

There is a breaking change between v0.1.0 and v0.2.0 regarding the configuration of graphql queries, variables and context.
Previously, you defined these three items with `let` in rspec:

```ruby
let(:graphql_query) { ... }
```

In v0.2.0, this changes to a new DSL for each of these three items:

```ruby
RSpec.describe My::Stuff, type: :graphql do

  graphql_query <<-GQL
    query Characters($name: String) {
      characters(name: $name) {
        id
        name
      }
    }
  GQL

  graphql_variables({
    name: "Jam"
  })

  graphql_context({
    some: "context here",
    current_user: some_user
  })

  it " ... "
end
```
