# frozen_string_literal: true

class GistQuestionService
  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: ENV['TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
  end

  def url
    @client.last_response.data.html_url
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title),
      public: true,
      files: {
        'test-guru-questions.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
