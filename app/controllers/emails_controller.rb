class EmailsController < ApplicationController
  def index
  	@emails = Email.all.order(created_at: :desc)
  end

  def show
  	@email = Email.find(params[:id])
    @email.update(read: true)
  	respond_to do |format|
        format.html { redirect_to email_path(@email.id) }
        format.js { }
  	  end
  end

  def create
  	@email = Email.new(object: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, read: false)
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
  	  	#flash[:notice] = "Email created"
  	  end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    @email.update(read: !@email.read)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
    end
  end

end

  private

  def email_params
    params.permit(:read)
  end

