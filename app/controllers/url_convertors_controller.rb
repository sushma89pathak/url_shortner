class UrlConvertorsController < ApplicationController

  def index
  end

  def new
    @urlConvertor = UrlConvertor.new
  end

  def create
    @urlConvertor = UrlConvertor.new(params_whitelist)
    if @urlConvertor.valid?
      sanitized_url = sanitize_url(@urlConvertor.original_url)
      @urlConvertor = UrlConvertor.find_by_original_url(sanitized_url)
      if @urlConvertor
        render json: @urlConvertor, status: :created
      else
        if @urlConvertor.save
          short_url = generate_shortURL(@urlConvertor)
          render json: @urlConvertor, status: :created, location: @urlConvertor
        else
          render json: @urlConvertor.errors, status: :unprocessable_entity
        end
      end
    else
      flash.now[:error] = "Url convertor cannot work, please enter Original URL!"
      render :new
    end
  end

  def visit_original_url
    if params["short_url"].present?
      url_obj = UrlConvertor.find_by_short_url(params["short_url"])
      redirect_to url_obj.original_url
    end
  end

  def search
  end

  def sanitize_url(original_url)
    original_url.strip!
    sanitized_url = original_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    sanitized_url.slice!(-1) if sanitized_url[-1] == "/"
    sanitized_url = "http://#{sanitized_url}"
  end

  def generate_shortURL(obj)
    short_url = random_generator(obj.id)
    obj.short_url = short_url
    if obj.save
      short_url
    else
      generate_shortURL(obj)
    end
  end

  def random_generator(id)
    chars = [0..9, 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
    short_url = 6.times.map { chars.sample }.join
    short_url = "#{id}#{short_url}"
  end

  private

  def params_whitelist
    params.require(:url_convertor).permit(:original_url)
  end

end
