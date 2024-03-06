
function editUser(button, id) {
	    var row = button.parentNode.parentNode;
	    var cells = row.getElementsByTagName('td');

	    // Kiểm tra xem hàng đã được chỉnh sửa hay không
	    var isEditing = row.getAttribute('data-editing') === 'true';

	    // Nếu đang chỉnh sửa, chuyển về trạng thái ban đầu
	    if (isEditing) {
	        done(row, cells, id);
	        return;
	    }

	    // Đánh dấu hàng đang chỉnh sửa
	    row.setAttribute('data-editing', 'true');

	    for (var i = 0; i < cells.length - 1; i++) {
	        var cell = cells[i];
	        var spans = cell.getElementsByTagName('span');

	        // Kiểm tra nếu có ít nhất một phần tử <span> trong ô cell
	        if (spans.length > 0) {
	            var span = spans[0];
	            var value = span.innerText;

	            var input = document.createElement('input');
	            input.type = 'text';
	            input.value = value;
				input.id = span.id
	            // Lấy chiều rộng của thẻ cha
	            var parentWidth = span.offsetWidth;

	            // Đặt độ rộng của input bằng chiều rộng của thẻ cha
	            input.style.width = parentWidth + 'px';

	            span.innerHTML = '';
	            span.appendChild(input);
	        }
	    }
	}

	function sendData(data) {
		data = JSON.stringify(data);
	    $.ajax({
	        url: '/re-java-web/editUser',
	        type: 'POST',
	        data: data,
	        success: function(response) {
	            console.log('Data sent successfully:', response);
	            if(response == "success"){
	            	Swal.fire({
						  position: "center",
						  icon: "success",
						  title: "Success!",
						  text: "Update User Success"
						});
	            }else{
	            	Swal.fire({
						  icon: "error",
						  title: "Oops...",
						  text: "Update User Failed!",
						});
	            }
	        }
	    });
	}
	
function done(row, cells, idU) {
    row.removeAttribute('data-editing');
    var newData = {};
    // Đưa các ô về trạng thái ban đầu
    for (var i = 0; i < cells.length - 1; i++) {
        var cell = cells[i];
        var spans = cell.getElementsByTagName('span');

        if (spans.length > 0) {
            var span = spans[0];
            var value = span.getElementsByTagName('input')[0].value;
            var input = span.getElementsByTagName('input')[0]
            span.innerHTML = value;
            if (input) {
                newData[input.id] = value;
            }
        }
    }
    if(!newData["fullname"]){
    	Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "Full name cannot be null!",
			});
    	return;
    }
    if(!newData["username"]){
    	Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "User name cannot be null!",
			});
    	return;
    }
	var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(!newData["address"]){
    	Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "Address cannot be null!",
			});
    	return;
    }
    if(!newData["email"]){
    	Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "Email cannot be null!",
			});
    	return;
    }
    if(!mail.test(newData["email"])){
		Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "Please enter a valid email!",
			});
    	return;
	}
    if(!newData["phone"]){
    	Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "Phone cannot be null!",
			});
    	return;
    }
    if(isNaN(newData["phone"])){
    	Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "Phone field must be number!",
			});
    	return;
    }
    newData["id"] = idU;
    sendData(newData);
}


function deleteRowUser(idUser){
			document.addEventListener('click', function(event) {
		        if (event.target.classList.contains('btn-danger') || event.target.classList.contains('fa-times')) {
		          Swal.fire({
				  title: "Are you sure?",
				  text: "You won't be able to revert this!",
				  icon: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#3085d6",
				  cancelButtonColor: "#d33",
				  confirmButtonText: "Yes, delete it!"
				  }).then((result) => {
					 
				  	if (result.isConfirmed) {
						var row = event.target.closest('tr');
						if (row) {
	                        //var productId = row.getAttribute('data-productId'); // Assuming you have a data attribute containing product ID
	                        // Gửi yêu cầu AJAX để xóa sản phẩm
	                        $.ajax({
	                            url: "/re-java-web/removeUserAdmin", // Đường dẫn tới Servlet xử lý yêu cầu
	                            method: "POST",
	                            data: { idUser: idUser },
	                            success: function(response) {
	                                // Xử lý phản hồi từ Servlet (nếu cần)
	                                console.log(response);
	                                // Xóa dòng từ giao diện người dùng
	                                row.remove();
	                                // Hiển thị thông báo thành công
	                                Swal.fire({
	                                    title: "Deleted!",
	                                    text: response,
	                                    icon: "success"
	                                });
	                            },
	                            error: function(xhr, status, error) {
									   	Swal.fire({
										  icon: "error",
										  title: "Oops...",
										  text: "No data found for deletion.",
										});
	                                console.error("Error:", error);
	                            }
	                        });
	                    }
				  	}
				});
		        }
		    });
			

		}
