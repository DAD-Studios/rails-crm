require "test_helper"

class AgentTest < ActiveSupport::TestCase
  test "should have default status of Not Contacted" do
    agent = Agent.new(first_name: "John", last_name: "Doe", email: "john.doe@example.com")
    assert_equal "Not Contacted", agent.status
  end

  test "should not save agent without first_name" do
    agent = Agent.new(last_name: "Doe", email: "john.doe@example.com")
    assert_not agent.save
  end

  test "should not save agent without last_name" do
    agent = Agent.new(first_name: "John", email: "john.doe@example.com")
    assert_not agent.save
  end

  test "should not save agent without email" do
    agent = Agent.new(first_name: "John", last_name: "Doe")
    assert_not agent.save
  end

  test "should not save agent with duplicate email" do
    Agent.create(first_name: "John", last_name: "Doe", email: "john.doe@example.com")
    agent = Agent.new(first_name: "Jane", last_name: "Doe", email: "john.doe@example.com")
    assert_not agent.save
  end
end
