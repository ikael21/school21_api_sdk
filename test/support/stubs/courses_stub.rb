# frozen_string_literal: true

module CoursesStub
  include BaseStub

  TEST_COURSE_ID = 42

  def stub_course_success
    stub_api_success("/courses/#{TEST_COURSE_ID}", body: { id: TEST_COURSE_ID })
  end
end
