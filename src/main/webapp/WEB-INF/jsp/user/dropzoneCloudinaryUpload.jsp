<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script type="text/javascript"
	src="/resources/assetsUser/js/dropzone.js"></script>
<link rel="stylesheet"
	href="/resources/assetsUser/css/dropzone.css">


<div id="dropzone-area" class="dropzone"></div>
<script type="text/javascript">
	var acceptId = document.getElementById('acceptId');
	var myDropzone = new Dropzone(document.getElementById('dropzone-area'), {
		uploadMultiple : false,
		acceptedFiles : '.jpg,.png,.jpeg,.gif',
		parallelUploads : 6,
		url : 'https://api.cloudinary.com/v1_1/dexyuylhl/image/upload'
	});
	myDropzone.on('sending', function(file, xhr, formData) {
		formData.append('api_key', 813232728513366);
		formData.append('timestamp', Date.now() / 1000 | 0);
		formData.append('upload_preset', 'mlmhelp');
	});
	myDropzone.on('success', function(file, response) {
		var params = {
			response : response
		};
		
		$.ajax({
			url : '/user/memberZone.html?url=' + response.url+"&acceptId="+acceptId,
			type : 'post'
		});
		console.log('Success! Cloudinary public ID is', response.public_id);
		console.log('Success! Cloudinary url is', response.url);
		console.log('Success! Cloudinary acceptId is', acceptId);
	});
</script>