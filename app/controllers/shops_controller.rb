class ShopsController < ApplicationController

  def index
    @shops = Shop.all
    @reviews = Review.all
    @photos = Photo.all

    render("shops/index.html.erb")
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = Review.all
    @photos = Photo.all
    @street_address = @shop.address
    @street_address_without_spaces = URI.encode(@street_address)
    url="http://maps.googleapis.com/maps/api/geocode/json?address="+@street_address_without_spaces
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    render("shops/show.html.erb")
  end

  def new
    @shop = Shop.new

    render("shops/new.html.erb")
  end

  def create
    @shop = Shop.new

    @shop.name = params[:name]
    @shop.address = params[:address]

    save_status = @shop.save

    if save_status == true
      redirect_to("/shops/#{@shop.id}", :notice => "Shop created successfully.")
    else
      render("shops/new.html.erb")
    end
  end

  def edit
    @shop = Shop.find(params[:id])

    render("shops/edit.html.erb")
  end

  def update
    @shop = Shop.find(params[:id])

    @shop.name = params[:name]
    @shop.address = params[:address]

    save_status = @shop.save

    if save_status == true
      redirect_to("/shops/#{@shop.id}", :notice => "Shop updated successfully.")
    else
      render("shops/edit.html.erb")
    end
  end

  def destroy
    @shop = Shop.find(params[:id])

    @shop.destroy

    if URI(request.referer).path == "/shops/#{@shop.id}"
      redirect_to("/", :notice => "Shop deleted.")
    else
      redirect_to(:back, :notice => "Shop deleted.")
    end
  end
end
