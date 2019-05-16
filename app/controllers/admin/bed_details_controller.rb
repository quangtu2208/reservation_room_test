class Admin::BedDetailsController < Admin::ApplicationController
  before_action :load_bed_detail, except: %i(new index create search)

  def index
    @bed_details = BedDetail.order(:name)
      .page(params[:page]).per Settings.controllers.admin.bed_details.pag
  end

  def search
    @bed_details = SearchService.new(BedDetail,
      search_params, Settings.search_fields.bed_detail).all_records
      .page(params[:page]).per Settings.controllers.admin.bed_details.pag
    render :index
  end

  def show; end

  def new
    @bed_detail = BedDetail.new
  end

  def create
    @bed_detail = BedDetail.new bed_detail_params
    if @bed_detail.save
      flash[:success] = t ".create_success"
      redirect_to request.referer
    else
      render :new
    end
  end

  def edit; end

  def update
    if @bed_detail.update bed_detail_params
      flash[:success] = t ".update_success"
      redirect_to request.referer
    else
      render :edit
    end
  end

  private
  def bed_detail_params
    params.require(:bed_detail).permit :name
  end

  def search_params
    params.slice :content, :field
  end

  def load_bed_detail
    @bed_detail = BedDetail.find_by id: params[:id]
    return if @bed_detail
    redirect_to admin_bed_details_url
  end
end
