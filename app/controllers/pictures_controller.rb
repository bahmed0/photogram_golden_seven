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
       
   redirect_to("/photos")    
   # render "pic_templates/create_row.html.erb"
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
      @time_posted = Time.now.-(pic.updated_at)./(3600).to_i
       
   render "pic_templates/show.html.erb"
   end
   def edit_form
      #Parameters: {"an_id"=>"1"}
      
      the_id_number = params["an_id"]
      pic = Photo.find(the_id_number)
      
      @the_source = pic.source
      @the_caption = pic.caption
      
      @picture_number = pic.id
       
   render "pic_templates/edit_form.html.erb"
   end
   def update_row
      
      the_id_number = params["some_id"]
      @pic = Photo.find[the_id_number]
      
      @the_source = pic.source
      @the_caption = pic.caption
      
      @picture_number = pic.id
      
      @pic.save
      
   redirect_to("/photos/"+@id.to_s)
   # render "pic_templates/update_row.html.erb"
   end
   def destroy_row
      #Parameters: {"toast_id"=>"6"}
      
      the_id_number = params["toast_id"]
      pic = Photo.find(the_id_number)
      pic.destroy
      
      @photo_count = Photo.count
   
   redirect_to("/photos")  
   # render "pic_templates/destroy_row.html.erb"
   end
end