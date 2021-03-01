module RSpec
  module GraphQLResponse
    def self.add_helper(name, scope: :spec, &helper)
      helper_module = Module.new do |mod|
        mod.define_method(name) do |*args|
          instance_var = "@#{name}".to_sym

          if self.instance_variables.include? instance_var
            return self.instance_variable_get(instance_var)
          end

          result = self.instance_exec(*args, &helper)
          self.instance_variable_set(instance_var, result)
        end
      end

      RSpec.configure do |config|
        config.after(:each) do
          helper_module.instance_variable_set(:@result, nil)
        end

        module_method = if scope == :spec
                          :include
                        elsif scope == :describe
                          :extend
                        else
                          raise ArgumentError, "A helper method's scope must be either :spec or :describe"
                        end

        config.send(module_method, helper_module, type: :graphql)
      end
    end
  end
end

# describe level helpers
require_relative "helpers/graphql_query"
require_relative "helpers/graphql_variables"

# spec level helpers
require_relative "helpers/operation"
require_relative "helpers/response"
require_relative "helpers/execute_graphql"
