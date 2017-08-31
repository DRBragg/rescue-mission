class AnswerMailer < ApplicationMailer
  def new_answer(answer)
    @question = answer.question
    @answer = answer.description

    mail(
      to: "dev@rezzio.co",
      subject: "New Answer for #{answer.question.title}"
    )
  end
end
