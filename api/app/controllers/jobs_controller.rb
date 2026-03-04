class JobsController < ApplicationController
  def index
    jobs = Job.order(created_at: :desc).limit(20)
    render json: jobs
  end

  def create
    job = Job.create!(job_params)
    render json: job, status: :created
  end

  def show
    job = Job.includes(:dataset, :job_attempts).find(params[:id])
    render json: {
      job: job,
      dataset: job.dataset,
      attempts: job.job_attempts.order(attempt_no: :asc)
    }
  end

  private

  def job_params
    params.require(:job).permit(:dataset_id, :job_type, :status, :progress, :idempotency_key, params: {})
  end
end
