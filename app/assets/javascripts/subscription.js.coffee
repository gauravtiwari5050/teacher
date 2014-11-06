$ () ->
	$('.subscription_form').on 'ajax:before', (xhr,status,error) ->
		$(this).find(':submit').attr('value','Sending . . .')

	$('.subscription_form').on 'ajax:error', (xhr,status,error) ->
		$(this).find(':submit').attr('value','Sorry. Please try again !')

	$('.subscription_form').on 'ajax:success', (xhr,status,error) ->
		$(this).find(':submit').attr('value','Thanks !')
		#this will remove subscription from anywhere on the page
		$('.subscription_form').hide()
		