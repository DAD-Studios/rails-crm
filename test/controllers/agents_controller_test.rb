require "test_helper"

class AgentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent = Agent.create(first_name: "John", last_name: "Doe", email: "john.doe@example.com")
  end

  test "should get new" do
    get new_agent_url
    assert_response :success
  end

  test "should create agent" do
    assert_difference("Agent.count") do
      post agents_url, params: { agent: { first_name: "Jane", last_name: "Doe", email: "jane.doe@example.com", company: "Doe Inc." } }
    end

    assert_redirected_to root_url
  end

  test "should show agent" do
    get agent_url(@agent)
    assert_response :success
  end

  test "should update agent status" do
    patch "/agents/#{@agent.id}/update_status", params: { status: "Contacted" }.to_json, headers: { 'Content-Type' => 'application/json' }
    assert_response :success
    @agent.reload
    assert_equal "Contacted", @agent.status
  end

  test "should import agents from csv" do
    file = fixture_file_upload('agents.csv', 'text/csv')
    assert_difference("Agent.count", 2) do
      post upload_agents_url, params: { file: file }
    end

    assert_redirected_to root_url
  end
end
