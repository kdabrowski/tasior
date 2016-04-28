class Api::V1:TracesController < ApplicationController

  def index
    @traces = Trace.all
    respond_to do |format|
      format.json { render json: @traces}
    end
  end

  def show
    @trace = Trace.find(params[:id])
    respond_to do |format|
      format.json { render json: @trace }
    end
  end

  def create
    @trace = Trace.new(params)
    if @trace.save
      respond_to do |format|
        format.json { render json: @trace }
      end
    end
  end

  def update
    @trace.find(params[:id])
    @trace.update_attributes(params)
    if @trace.save
      respond_to do |format|
        format.json { render json: @trace }
      end
    end
  end

  def destroy
    @trace.find(params[:id])
    if @trace.destroy
      respond_to do |format|
        format.json { render json: @trace }
      end
    end
  end
end
