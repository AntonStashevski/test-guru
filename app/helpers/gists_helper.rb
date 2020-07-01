# frozen_string_literal: true

module GistsHelper
  DEFAULT_LENGTH = 24

  def validate_gist_question_body(gist)
    link_to validate_body(gist.question), admin_test_question_path(test_id: gist.question.test.id, id: gist.question.id)
  end

  def validate_body(question)
    question.body.length >= DEFAULT_LENGTH ? "#{question.body[0..DEFAULT_LENGTH - 3]}..." : question.body
  end
end
