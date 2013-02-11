
function Comment(data) {
    this.id = ko.observable(data.id);
    this.user = ko.observable(data.user);
    this.title = ko.observable(data.title);
    this.content = ko.observable(data.content);
}

function commentsViewModel(){
 	var self = this;
	self.comments = ko.observableArray([]);

	self.newCommentUser = ko.observable();
	self.newCommentTitle = ko.observable();
	self.newCommentContent = ko.observable();

	self.userError = ko.observable();
	self.titleError = ko.observable();
	self.contentError = ko.observable();


	self.addComment = function(){
		var newComment = new Comment({
            user: this.newCommentUser(),
			title: this.newCommentTitle(),
			content: this.newCommentContent()
		});
		
		

		$.ajax("/albums/"+$("#album_id").val()+"/photos/"+$("#photo_id").val()+"/comments",
		{
            data: ko.toJSON({ comment: newComment }),
            type: "post",
            contentType: "application/json",
            success: function(result) {
            	self.comments.push( newComment );
            	self.newCommentUser("");
            	self.newCommentTitle("");
            	self.newCommentContent("");

            	self.userError("");
            	self.titleError("");
            	self.contentError("");

            },
            error: function(result) {
            	var errors = $.parseJSON(result.responseText).errors;
            	self.userError(errors.user);
            	self.titleError(errors.title);
            	self.contentError(errors.content);
        	}
        });


	};


 	$.getJSON("/albums/"+$("#album_id").val()+"/photos/"+$("#photo_id").val()+"/comments",
 		function(allData){
 			var array = $.makeArray(allData);
            $.each( array, function( key, value ) {
                
                self.comments.push( new Comment({
                    id: value.id,
                    user: value.user,
                    title: value.title,
                    content: value.content
                })
            );
        });

//            var allComments = $.map(array,function(comm){ new Comment(comm) });
  //     		$("#array").val(allComments);
            
    //        alert(allComments);
            //self.comments(allData);
    });


    self.destroyComment = function(comment){
            
        if( confirm("R U Sure?")){
            self.comments.remove(comment);
            
            
            $.post("/albums/"+$("#album_id").val()+"/photos/"+$("#photo_id").val()+"/comments/"+comment.id(),
                { _method: 'delete'},
                function(returnedData) {
                    //alert("done");
                }
            );

        }
            

    }
    


}



$(document).ready(function(){
	ko.applyBindings(new commentsViewModel());
});
 
