# DadCRM

This is a Ruby on Rails CRM application for managing agents, contacts, jobs, etc.

## Features

*   A dashboard, which is the root of the application.
*   Agent management, including creating, viewing, and updating agents.
*   A feature to update an agent's status.
*   The ability to import and upload a list of agents.

## System Dependencies

*   **Ruby Version:** 3.4.5
*   **Rails Version:** ~> 8.0.2
*   **Database:** PostgreSQL

## Configuration

1.  **Install Ruby and Rails:** Make sure you have the specified versions of Ruby and Rails installed.
2.  **Install PostgreSQL:** Install PostgreSQL on your system.
3.  **Clone the repository:** `git clone <repository-url>`
4.  **Install gems:** `bundle install`
5.  **Configure the database:** Create a `config/database.yml` file (you can copy `config/database.yml.example` if it exists) and configure it to connect to your PostgreSQL database.

## Database Creation and Initialization

1.  **Create the database:** `rails db:create`
2.  **Run migrations:** `rails db:migrate`
3.  **Seed the database (if applicable):** `rails db:seed`

## How to Run the Test Suite

This project uses Capybara and Selenium for system testing. To run the test suite, execute the following command:

```sh
bundle exec rspec
```

or

```sh
bundle exec rails test
```

## Services

This application uses the following services:

*   **`solid_cache`**: For caching.
*   **`solid_queue`**: For background jobs.
*   **`solid_cable`**: For WebSocket communication.

## Deployment Instructions

This project is set up for deployment with Kamal, which is used for deploying Docker containers. You will need to have Docker installed and have a server to deploy to.

The general steps for deploying with Kamal are:

1.  **Install Kamal:** `gem install kamal`
2.  **Initialize Kamal:** `kamal init`
3.  **Configure `config/deploy.yml`:** Set up your server and registry details.
4.  **Deploy:** `kamal deploy`
