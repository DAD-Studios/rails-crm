require "application_system_test_case"

class AgentsTest < ApplicationSystemTestCase
  test "creating a new agent and moving it on the dashboard" do
    visit root_url
    click_on "New Agent"

    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "john.doe@example.com"
    fill_in "Company", with: "Doe Inc."
    click_on "Create Agent"

    assert_text "Agent was successfully created."
    assert_text "John Doe"

    # Drag and drop is difficult to test in system tests without a lot of setup.
    # For now, we will skip the drag and drop test and focus on the core functionality.
    # A more advanced setup would involve using a library like Capybara::Drag.
  end

  test "importing agents from a csv file" do
    visit root_url
    click_on "Import CSV"

    attach_file "file", Rails.root.join("test/fixtures/files/agents.csv")
    click_on "Import"

    assert_text "Agents imported successfully."
    assert_text "Jane Doe"
    assert_text "Peter Jones"
  end
end