class Api::V1::TracesController < Api::V1::BaseController

  def index
    @traces = Trace.all.map(&:geo)
    respond_with @traces.to_json
  end

  def show
    @trace = Trace.find(params[:id])
    respond_with @trace.geo.to_json
  end

  def create
    @trace = Trace.new(trace_params)
    if @trace.save
      respond_with @trace.geo.to_json, location: nil
    end
  end

  def update
    @trace = Trace.find(params[:id])
    @trace.update_attributes(trace_params)
    if @trace.save
      respond_with
   end
  end

  def destroy
    @trace = Trace.find(params[:id])
    if @trace.destroy
      respond_with
    end
  end

  private

  def trace_params
    params.require(:trace).permit!
  end

end
