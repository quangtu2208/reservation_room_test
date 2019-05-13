class SearchQuery
  def initialize model, params, fields
    @model = model
    @params = params
    @fields = fields
  end

  def all
    return search_all if @params[:field] == "all"
    search
  end

  private
  def search_all
    @fields.each_with_index do |field, index|
      if index == 0
        @result = @model.where("#{field} LIKE ?", "%#{@params[:content]}%")
      else
        @result = @result.or(@model.where("#{field} LIKE ?", "%#{@params[:content]}%"))
      end
    end
    return @result
  end

  def search
    @model.where("#{@params[:field]} LIKE ?", "%#{@params[:content]}%")
  end
end
