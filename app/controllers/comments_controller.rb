class CommentsController < ApplicationController
before_filter :authenticate_user!, :except=>[:update,:destroy]
  # GET /comments
  # GET /comments.json
  # POST /comments
  # POST /comments.json
  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:photo_id])
    @comment = params[:comment]
    @new_comment = @photo.comments.build
    @comments = @photo.comments.all


    @comment = @photo.comments.create(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to album_photo_path(@album,@photo), :notice => 'Photo was successfully created.' }
       
      else
        format.html { render "photos/show" }
        #format.json { render :json => @comment.errors.full_messages.to_sentence, :status => :unprocessable_entity }
      end
    end

    #redirect_to album_photo_path(@album,@photo)
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, :notice => 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find(params[:id])
    @comment.destroy
    redirect_to photo_path(@photo)
  end

end
