# frozen_string_literal: true

# YourApp::Application.config.session_store :cookie_store, :key => '_your_app_session'
Rails.application.config.session_store :active_record_store, :key => 'fyp7_session'
