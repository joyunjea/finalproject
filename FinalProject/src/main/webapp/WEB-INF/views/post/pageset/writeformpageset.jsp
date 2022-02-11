<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<script>
let cat_idx;

function selectCategory(){
	
	var interest = $('#categoryInfos option:selected');

	console.log(interest.val());
	
	$.ajax({
		url: '${pageContext.request.contextPath}/category/list',
		type: 'GET',
		data: {interest : interest.val()},
		datatype: 'json',
		success: function(data){
			console.log(data.length);
			
			if(data.length==0){
				
				// 현재 선택한 interest 값을 cat_idx 에 저장한다.
				cat_idx = interest.val();
				console.log(cat_idx);
				
			}else{
			
				var html="";
				html += '<select id="cat1" onchange="selectCategory1(this.value)">\r\n';
				html += '<option value="">분야 선택</option>\r\n';
				$(data).each(function(index, items){
					console.log(items.cat_idx);
					console.log(items.cat_nm);
					
					html += '<option value="'+items.cat_idx+'">'+items.cat_nm+'</option>';
				
				})
				html += '</select>\r\n';
				
				$('#categoryInfos').append(html);
				console.log(html);
			
			}
			
		},
		error: function(data){
			console.log(data);
		}
	});
	
}

function selectCategory1(interest){
	
	var interest = interest;

	console.log(interest);
	
	$.ajax({
		url: '${pageContext.request.contextPath}/category/list',
		type: 'GET',
		data: {interest : interest},
		datatype: 'json',
		success: function(data){
			console.log(data.length);
			
			if(data.length==0){
				
				// 현재 선택한 interest 값을 cat_idx 에 저장한다.
				cat_idx = interest;
				console.log(cat_idx);
				
			}else{
			
				var html="";
				html += '<select id="cat2" onchange="selectCategory2(this.value)">\r\n';
				html += '<option value="">하위분야 선택</option>\r\n';
				$(data).each(function(index, items){
					console.log(items.cat_idx);
					console.log(items.cat_nm);
					
					html += '<option value="'+items.cat_idx+'">'+items.cat_nm+'</option>';
				
				})
				html += '</select>\r\n';
				
				$('#categoryInfos').append(html);
				console.log(html);
				
				/* if($('#cat2')!=null){
					$('#cat2').html(html);
				} else{
					$('#cat1').after(html);
					console.log(html);
				} */
				
			}
			
		},
		error: function(data){
			console.log(data);
		}
	});
	
}

function selectCategory2(interest){
	
	var interest = interest;

	console.log(interest);
	
	$.ajax({
		url: '${pageContext.request.contextPath}/category/list',
		type: 'GET',
		data: {interest : interest},
		datatype: 'json',
		success: function(data){
			console.log(data.length);
			
			if(data.length==0){
				
				// 현재 선택한 interest 값을 cat_idx 에 저장한다.
				cat_idx = interest;
				console.log(cat_idx);
				
			}else{
			
				var html="";
				html += '<select id="cat3" onchange="selectCategory3(this.value)">\r\n';
				html += '<option value="">하위분야 선택</option>\r\n';
				$(data).each(function(index, items){
					console.log(items.cat_idx);
					console.log(items.cat_nm);
					
					html += '<option value="'+items.cat_idx+'">'+items.cat_nm+'</option>';
				
				})
				html += '</select>\r\n';
				
				$('#categoryInfos').append(html);
				console.log(html);
				
				/* if($('#cat3')!=null){
					$('#cat3').html(html);
				} else{
					$('#cat2').after(html);
					console.log(html);
				} */
			}
			
		},
		error: function(data){
			console.log(data);
		}
	});
	
}

function selectCategory3(interest){
	
	var interest = interest;

	console.log(interest);
	
	$.ajax({
		url: '${pageContext.request.contextPath}/category/list',
		type: 'GET',
		data: {interest : interest},
		datatype: 'json',
		success: function(data){
			console.log(data.length);
			
			// 현재 선택한 interest 값을 cat_idx 에 저장한다.
			cat_idx = interest;
			console.log(cat_idx);	
			
		},
		error: function(data){
			console.log(data);
		}
	});
	
}

// 파일업로드 관련 : 용량 제한, 확장자 제한
function checkExtension(fileName, fileSize){
	
	var regex = new RegExp("(.*?)\.(jpg|jpeg|png|PNG|bmp|pdf)$");
	var maxSize = 5242880; // 5MB : 1024*1024*5
	
	if(fileSize > maxSize){
		alert("5MB 이하의 파일만 업로드할 수 있습니다.");
		return false;
	}
	
	if(!regex.test(fileName)){
		alert("이미지 또는 PDF 파일만 업로드할 수 있습니다.");
		return false;
	}
	
	return true;
	
}

$(document).ready(function(){	
	
	$('#content').summernote({
		toolbar: [
		    
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		    ['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert', ['link', 'picture', 'video']],
		  ],
		 height: 600,
         codemirror: {
        	 theme: 'monokai'
         },
         lang: 'ko-KR',
         placeholder: '내용을 입력하세요.'
         

	});
	
	selectCategory();
        
    var formData = new FormData(document.getElementById('writePost'));
    
	/* var formObj = $("form[role='form']"); */
	
	$("#attachFile").on("change", function(e){
		console.log(e.target.files);
		var inputFile = e.target.files;
		
		if(inputFile.length == 0){
		    alert("파일이 없습니다.");
		    return;
		}
		
		for(var i=0; i<inputFile.length; i++){
			if(!checkExtension(inputFile[i].name, inputFile[i].size)){
				return false;
			}
			formData.append("fileList", inputFile[i]);
		}
		
	});

	$("#ajaxBtn").on("click", function(e){

		var post_nm = $('#post_nm').val();
	    var content = $('#content').summernote('code');
	    /* var cat_idx = $('#cat_idx').val(); */
	    
	    formData.set("post_nm", post_nm);
	    formData.set("post_content", content);
	    formData.set("cat_idx", cat_idx);
		
 		/* key 확인하기 */
		for (let key of formData.keys()) {
			   console.log(key);
		}

		/* value 확인하기 */
		for (let value of formData.values()) {
		      console.log(value);
		}
		
		$.ajax({
			url: '${pageContext.request.contextPath}/post/write',
			type: 'post',
			data: formData,
			success: function(result){
				
				console.log(result);
			
				if(result.cnt==1){
					alert('요청글을 등록하였습니다.');
					location.href='${pageContext.request.contextPath}/post/view?idx='+result.idx;
				} else {
					console.log('등록 실패');
				}
			},
			error: function(){
				console.log('통신 오류');
			},
			processData: false,
			contentType: false
		});
		
	});
	
	

	
	
	// 카테고리 선택 관련
	// https://huskdoll.tistory.com/497
	// https://golddigger.tistory.com/42
	
	
	
	
	
});

</script>