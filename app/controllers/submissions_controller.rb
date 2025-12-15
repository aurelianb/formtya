class SubmissionsController < ApplicationController
  def new
    @foorm = Foorm.includes(form_items: [ :form_item_options ]).find_by(uuid: params.expect(:uuid))
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.save!

    respond_to do |format|
      format.html { redirect_to success_submissions_path, notice: "Your form has been submitted" }
    end
  end

  def success
  end

  private

  def submission_params
    params.expect(submission: [ :submitter, :foorm_id, answers_attributes: [ [ :form_item_id, :value ] ] ])
  end
end
