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
				if(span.id !="quantityBought"){
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
            if(span.id !="quantityBought"){
	            var value = span.getElementsByTagName('input')[0].value;
	            var input = span.getElementsByTagName('input')[0]
	            span.innerHTML = value;
	            if (input) {
	                newData[input.id] = value;
	            }	
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


function deleteRow(productId) {
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
				}
			});
		}
	});
}
let open_overlay_btn = document.getElementById("addProductButton")
if(open_overlay_btn){
	  open_overlay_btn.addEventListener("click", function () {
    document.getElementById("overlay").style.display = "block";
  });

document.querySelector(".close-button").addEventListener("click", function () {
  document.getElementById("overlay").style.display = "none";
});

}


  
function changeInputImg(event) {
    file = event.target.files[0]; // Lấy file từ input
    if (file) {
        var reader = new FileReader(); // Tạo FileReader object

        // Lắng nghe sự kiện load khi đọc file thành công
        reader.onload = function(e) {
            var imagePreview = document.getElementById('imagePreview');
            imagePreview.src = e.target.result; // Hiển thị ảnh trong thẻ img
        };
		var nameFile = file.name;
		var imageName = document.getElementById("imageName");
		imageName.value=nameFile
        reader.readAsDataURL(file); // Đọc file dưới dạng URL data
    } else {
        // Nếu không có file mới được chọn, bạn có thể giữ nguyên ảnh hiện tại
        // hoặc xóa ảnh hiện tại nếu bạn muốn
        // Ví dụ:
        var imagePreview = document.getElementById('imagePreview');
        imagePreview.src = ""; // Xóa ảnh hiện tại
    }
}
let btn_add= document.querySelector(".addProduct")
if(btn_add){
btn_add.addEventListener("click",(event)=>{
	event.preventDefault();
	let name = document.querySelector("#inputName").value;
    let productDescription = document.querySelector("#proDesc").value;
    let productPrice = document.querySelector("#productPrice").value;
    let productType = document.querySelector("#proType").value;
    let productSpecies = document.querySelector("#proSpecies").value;
    let productStock = document.querySelector("#proStock").value;
    let proImg = document.querySelector("#fileInput").files[0];
    var data = new FormData();
    data.append("name", name);
    data.append("desc", productDescription);
    data.append("productPrice", productPrice);
    data.append("proType", productType);
    data.append("proSpecies", productSpecies);
    data.append("proStock", productStock);
    data.append("proImg", proImg);
    var imageName = document.getElementById("imageName").value;
    // Kiểm tra xem đã chọn ảnh chưa
    if (imageName.trim() === "") {
        alert("Vui lòng thêm ảnh");
        return;
    }
    // Thêm tên ảnh vào FormData
    data.append("imageName", imageName);
	console.log(data)
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "addProduct", true);
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Xử lý phản hồi từ máy chủ
                console.log(xhr.responseText)
                if(xhr.responseText == "success"){
					Swal.fire({
						  position: "center",
						  icon: "success",
						  title: "Success!",
						  text: "Add Product Success"
						}).then((result) => {
						  	if (result.isConfirmed) {
								let overlay = document.getElementById("overlay");
								overlay.style.display = "none"
							}
							var newRow = document.createElement('tr');
							// Thêm các ô dữ liệu vào hàng mới
							var cell1 = document.createElement('td');
							var cell2 = document.createElement('td');
							var cell3 = document.createElement('td');
							var cell4 = document.createElement('td');
							var cell5 = document.createElement('td');
							var cell6 = document.createElement('td');
							var cell7 = document.createElement('td');
							var cell8 = document.createElement('td');
							var cell9 = document.createElement('td');
							var cell10 = document.createElement('td');
					//Tạo cell 1
							// Tạo một thẻ div mới
							var divElement = document.createElement('div');
							divElement.className = 'd-flex align-items-center';

							// Tạo thẻ img và thiết lập thuộc tính
							var imgElement = document.createElement('img');
							imgElement.src = 'public/img/' + imageName;
							imgElement.className = 'img-fluid me-5 rounded-circle';
							imgElement.style.width = '80px';
							imgElement.style.height = '80px';
							// Thêm thẻ img vào thẻ div
							divElement.appendChild(imgElement);	
							cell1.appendChild(divElement);
					//Kết thúc tạo cell 1
					
					//Tạo cell 2
							var spanElement2 = document.createElement('span');
							spanElement2.className = 'value';
							spanElement2.id = 'productName';
							spanElement2.textContent = data.get("name");
							cell2.appendChild(spanElement2);	
					//Kết thúc tạo cell 2
					//Tạo cell 3
							var spanElement3 = document.createElement('span');
							spanElement3.className = 'value';
							spanElement3.id = 'productCost';
							spanElement3.textContent = data.get("productPrice");
							cell3.appendChild(spanElement3);
					//Kết thúc tạo cell 3
					//Tạo cell 4
							var spanElement4 = document.createElement('span');
							spanElement4.className = 'value';
							spanElement4.id = 'productDescription';
							spanElement4.textContent = data.get("desc");
							cell4.appendChild(spanElement4);	
					//Kết thúc tạo cell 4
					//Tạo cell 5
							var spanElement5 = document.createElement('span');
							spanElement5.className = 'value';
							spanElement5.id = 'productType';
							spanElement5.textContent = productType;
							cell5.appendChild(spanElement5);
					//Kết thúc tạo cell 5
					//Tạo cell 6
							var spanElement6 = document.createElement('span');
							spanElement6.className = 'value';
							spanElement6.id = 'productSpecies';
							spanElement6.textContent = productSpecies;
							cell6.appendChild(spanElement6);
					//Kết thúc tạo cell 6
					//Tạo cell 7
							var spanElement7 = document.createElement('span');
							spanElement7.className = 'value';
							spanElement7.id = 'quantityBought';
							spanElement7.textContent = '0';
							cell7.appendChild(spanElement7);		
					//Kết thúc tạo cell 7
					//Tạo cell 8
							var spanElement8 = document.createElement('span');
							spanElement8.className = 'value';
							spanElement8.id = 'quantityStock';
							spanElement8.textContent = productStock;
							cell8.appendChild(spanElement8);		
					//Kết thúc tạo cell 8
					//Tạo cell 9
							// Tạo nút button 1
							var editButton = document.createElement('button');
							editButton.type = 'button';
							editButton.className = 'btn btn-info rounded-pill';
							var editIcon = document.createElement('i');
							editIcon.className = 'fa-regular fa-pen-to-square'; // Class của icon sửa sản phẩm
							editButton.appendChild(editIcon);
							
							// Tạo nút button 2
							var deleteButton = document.createElement('button');
							deleteButton.type = 'button';
							deleteButton.className = 'btn btn-danger rounded-pill';
							var deleteIcon = document.createElement('i');
							deleteIcon.className = 'fa fa-times'; // Class của icon xóa sản phẩm
							deleteButton.appendChild(deleteIcon);
							// Thêm nút button vào trong thẻ td
							cell9.appendChild(editButton);
							cell9.appendChild(deleteButton);
					//Kết thúc tạo cell 9
					//Tạo cell 10
							var inputc1 = document.createElement("input")
							inputc1.setAttribute("type","checkbox");
							inputc1.className = "form-check-input";
							cell10.appendChild(inputc1)
					//Kết thúc tạo cell 10
					//Thêm cell vào row
							newRow.appendChild(cell10);
							newRow.appendChild(cell1);
							newRow.appendChild(cell2);
							newRow.appendChild(cell3);
							newRow.appendChild(cell4);
							newRow.appendChild(cell5);
							newRow.appendChild(cell6);
							newRow.appendChild(cell7);
							newRow.appendChild(cell8);
							newRow.appendChild(cell9);
		
							// Chèn hàng mới vào đầu của phần tbody của bảng
							var tbody = document.getElementById('tb-product');
							tbody.insertBefore(newRow, tbody.firstChild);
						  })
				}else{
					Swal.fire({
						  icon: "error",
						  title: "Oops...",
						  text: "Add Product Failed!",
						});
				}
            } else {
                // Xử lý lỗi
                console.error(xhr.statusText);
            }
        }
    };
    
    xhr.send(data);
})
}