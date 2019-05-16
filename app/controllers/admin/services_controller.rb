class Admin::ServicesController < Admin::ApplicationController
  before_action :load_service, except: %i(new index create search)

  def index
    @services = Service.order(:name)
      .page(params[:page]).per Settings.controllers.admin.services.pag
  end

  def search
    @services = SearchService.new(Service,
      search_params, Settings.search_fields.service).all_records
      .page(params[:page]).per Settings.controllers.admin.services.pag
    render :index
  end

  def show; end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new service_params
    if @service.save
      flash[:success] = t ".create_success"
      redirect_to request.referer
    else
      render :new
    end
  end

  def edit; end

  def update
    if @service.update service_params
      flash[:success] = t ".update_success"
      redirect_to request.referer
    else
      render :edit
    end
  end

  private
  def service_params
    params.require(:service).permit :name
  end

  def search_params
    params.slice :content, :field
  end

  def load_service
    @service = Service.find_by id: params[:id]
    return if @service
    redirect_to admin_services_url
  end
end
