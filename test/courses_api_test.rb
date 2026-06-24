# frozen_string_literal: true

require 'test_helper'

describe 'Courses API Test' do
  include AuthStub
  include CoursesStub

  with_configured_client do
    it 'calls stub course success' do
      stubs = [
        stub_token_success,
        stub_course_success
      ]

      School21.courses_api.course(CoursesStub::TEST_COURSE_ID)

      stubs.each { |stub| assert_requested(stub) }
    end
  end
end
