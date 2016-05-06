class Api::V1::TracesController < Api::V1::BaseController
  before_action :find_trace, only: [:show, :update, :destroy]

  def index
    @traces = Trace.all.map(&:geo)
    respond_with @traces
  end

  def show
    respond_with @trace.geo
  end

  def create
    @trace = Trace.new(trace_params)
    if @trace.save
      @trace.update_distances
      @trace = ElevationApiWrapper.new(@trace).add_elevations_to_trace
      respond_with @trace, location: nil
    else
      render json:  @trace.errors.to_json, status: 422
    end
  end

  def update
    @trace.update_attributes(trace_params)
    if @trace.save
      @trace.update_distances
      @trace = ElevationApiWrapper.new(@trace).add_elevations_to_trace
      respond_with @trace, location: nil
    else
      render json:  @trace.errors.to_json, status: 422
    end
  end

  def destroy
    if @trace.destroy
      respond_with @trace, location: nil
    end
  end

  private

  def trace_params
    params.require(:trace).permit!
  end

  def find_trace
    @trace = Trace.find(params[:id])
  end
end
