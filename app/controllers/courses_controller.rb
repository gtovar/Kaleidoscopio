require 'csv'
class CoursesController < ApplicationController
  before_filter :authenticate_admin!
  # GET /courses
  # GET /courses.json
  def index
    @search = Course.search(params[:search])	
    @courses = @search.all
    @total = @courses.count
    @courses = Course.paginate(page: params[:page])


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
      format.csv {export(@courses)}	
    end
  end
	


  def vindex
    @courses = Course.paginate(page: params[:page])
    @search = Course.search(params[:search])	
    @courses = @search.order('category').all
    @total = @courses.count

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end



  end

  def index_contacts
    @contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  def show_contacts
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end


  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @order = @course.orders(params[@course])	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
	if request.path != course_path(@course)
    redirect_to @course, status: :moved_permanently
  end
  end


def export(courses)
      csv = CSV.generate(:col_sep => "\t") do |csv|
      csv << ["Nombre_Curso", "Categoria", "Fecha", "Precio", "Curso_Propio"]
      courses.each do |course|	
      csv << [course.name, course.category, course.date_time, course.price, course.owned]
      end
    end

     send_data csv, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => 	"attachment; filename=#{Time.now.strftime('%d-%m-%y--%H-%M')}.csv"
    

 end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end




  
  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
end
