# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#= require knockout
#= require knockout/bindings/autosave

class Comment extends ko.Model

	@persistAt 'comment'


commentViewModel = (json) ->
	@comment = new  Comment(json)
	@

	
jQuery ->
	if window.commentData
		model = commentViewModel(window.commentData)
		ko.applyBindings model

	