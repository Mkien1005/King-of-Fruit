(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Sidebar Toggler
    $('.sidebar-toggler').click(function () {
        $('.sidebar, .content').toggleClass("open");
        return false;
    });


    // Progress Bar
    $('.pg-bar').waypoint(function () {
        $('.progress .progress-bar').each(function () {
            $(this).css("width", $(this).attr("aria-valuenow") + '%');
        });
    }, {offset: '80%'});


    // Calender
    $('#calender').datetimepicker({
        inline: true,
        format: 'L'
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        items: 1,
        dots: true,
        loop: true,
        nav : false
    });


    // Chart Global Color
    Chart.defaults.color = "#6C7293";
    Chart.defaults.borderColor = "#000000";



})(jQuery);
function editProduct(button, id) {
	    var row = button.parentNode.parentNode;
	    var cells = row.getElementsByTagName('td');

	    // Kiểm tra xem hàng đã được chỉnh sửa hay không
	    var isEditing = row.getAttribute('data-editing') === 'true';

	    // Nếu đang chỉnh sửa, chuyển về trạng thái ban đầu
	    if (isEditing) {
	        cancelEdit(row, cells, id);
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

	function sendDataToServer(data) {
		data = JSON.stringify(data);
	    $.ajax({
	        url: '/re-java-web/editProduct',
	        type: 'POST',
	        data: data,
	        success: function(response) {
	            console.log('Data sent successfully:', response);
	            if(response == "success"){
	            	Swal.fire({
						  position: "center",
						  icon: "success",
						  title: "Success!",
						  text: "Update Product Success"
						});
	            }else{
	            	Swal.fire({
						  icon: "error",
						  title: "Oops...",
						  text: "Update Product Failed!",
						});
	            }
	        }
	    });
	}
	
function cancelEdit(row, cells, idP) {
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
    if(isNaN(newData["productCost"])){
    	Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "Cost field must be number!",
			});
    	return;
    }
    if(isNaN(newData["quantityBought"])){
    	Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "Quantity bought field must be number!",
			});
    	return;
    }
    if(isNaN(newData["quantityStock"])){
    	Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "Quantity Stock field must be number!",
			});
    	return;
    }
    newData["id"] = idP;
    sendDataToServer(newData);
}


function deleteRow(productId){
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
	                            url: "/re-java-web/removeProductAdmin", // Đường dẫn tới Servlet xử lý yêu cầu
	                            method: "POST",
	                            data: { productId: productId },
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
				  	}else{
						  var button = document.querySelector("button[data-productId='" + productId + "']")
						  var targetElement = button.parentElement.parentNode.querySelector("#quant");
						  console.log(targetElement)
						  targetElement.value = 1;
					  }
				});
		        }
		    });
			

		}
