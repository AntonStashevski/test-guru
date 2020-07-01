# frozen_string_literal: true

module GistsHelper
  DEFAULT_LENGTH = 25

  def validate_gist_question_body(gist)
    link_to gist.question.body.truncate(DEFAULT_LENGTH), admin_test_question_path(test_id: gist.question.test.id, id: gist.question.id)
  end

end
