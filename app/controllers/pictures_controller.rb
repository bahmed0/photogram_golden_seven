class PicturesController < ApplicationController
   def new_form
       
   render "pic_templates/new_form.html.erb"
   end
   def create_row
      # Parameters: {"the_source"=>"", "the_caption"=>""}
      
      p = Photo.new
      p.source = params["the_source"]
      p.caption = params["the_caption"]
      p.save
      
      @photo_count = Photo.count
       
   render "pic_templates/create_row.html.erb"
   end
   def index
      
      @p = Photo.all
      
       
   render "pic_templates/index.html.erb"
   end
   def show
      
      the_id_number = params["the_id"]
      pic = Photo.find(the_id_number)
      
      @the_source = pic.source
      @the_caption = pic.caption
      @picture_number = pic.id
       
   render "pic_templates/show.html.erb"
   end
   def edit_form
       
   render "pic_templates/edit_form.html.erb"
   end
   def update_row
       
   render "pic_templates/update_row.html.erb"
   end
   def destroy_row
      #Parameters: {"toast_id"=>"6"}
      
      the_id_number = params["toast_id"]
      pic = Photo.find(the_id_number)
      pic.destroy
      
      @photo_count = Photo.count
       
   render "pic_templates/destroy_row.html.erb"
   end
end