class DatasetsController < ApplicationController
  def create
    dataset = Dataset.create!(dataset_params)
    render json: dataset, status: :created
  end

  def show
    dataset = Dataset.find(params[:id])
    render json: dataset
  end

  private

  def dataset_params
    params.require(:dataset).permit(:original_name, :storage_key, :size_bytes, :checksum)
  end
end
