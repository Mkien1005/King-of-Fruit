/**
 * 
 */
var modal = document.querySelector(".overlay");
var showPopupButtons = document.querySelectorAll(".showPopupButton");
var closeButton = document.getElementsByClassName("close")[0];
var cancelButton = document.querySelector(".cancel-btn");
var addButton = document.getElementById("addButton");
var productNameElement = document.getElementById("productName");
var productImageElement = document.getElementById("productImage");
var productQuantityElement = document.getElementById("productQuantity");
var quantityInput = document.getElementById("quantityInput");
// Mở pop-up khi nhấn vào nút "Show Product Popup"
/*showPopupButtons.forEach(function (button) {
  button.onclick =showUp();
});*/
// Đóng pop-up khi nhấn vào nút đóng hoặc bên ngoài pop-up
/*closeButton.onclick = function () {
  modal.style.display = "none";
};*/

/*function plusValue(){
 const old_quan = document.getElementById("quant")
	const newQuantity = parseInt(old_quan.value, 10) + 1

update(newQuantity)
}
function minusValue(){
const old_quan = document.getElementById("quant")
const newQuantity = parseInt(old_quan.value, 10) - 1

update(newQuantity)
}
function update(newQuantity){
	const old_quan = document.getElementById("quant")
	sessionStorage.setItem('quantity', newQuantity)
	old_quan.value = newQuantity
	old_quan.setAttribute('value', newQuantity);
	var uid = document.querySelector("#product-uid").innerText;
	var form = document.getElementById("addToCart");
	form.action =`AddToCartController?idproduct=${uid}&quantity=${old_quan.value}`;
}
*/
function changeValue(e){
	let input = document.getElementById('quant')
	let currentValue = input.value;
	if (currentValue == "") {
        input.value = 1;
        console.log(input.value);
        currentValue=1;
        document.getElementById('quant').setAttribute('value',currentValue);
        let price = document.querySelector(".price").id;
	  	console.log(price)
		cost = price*currentValue;
		document.querySelector(".priceVar").innerText = cost
    } else if (currentValue == 1 && e.keyCode === 8) {
        // event.keyCode === 8 là sự kiện phím Backspace
        e.preventDefault;
        input.value = 1;
        currentValue=1;
        document.getElementById('quant').setAttribute('value',currentValue);
        console.log(input.value);
        let price = document.querySelector(".price").id;
	  	console.log(price)
		cost = price*currentValue;
		document.querySelector(".priceVar").innerText = cost
    }else{
		document.getElementById('quant').setAttribute('value',currentValue);
	  	let cost = document.querySelector(".priceVar").innerText;
	  	let price = document.querySelector(".price").id;
	  	console.log(price)
		cost = parseFloat(price)*parseInt(currentValue);
		document.querySelector(".priceVar").innerText = cost.toFix(2)
		console.log(cost)
  }
	/*if(currentValue.length===0){
		document.getElementById('quant').setAttribute('value',1)
		document.getElementById('quant').value=1
	}else{
	}
*/
}
function plusValue() {
	let currentValue = parseInt(document.getElementById('quant').getAttribute('value'));
	// Tăng giá trị lên 1
	currentValue += 1;
	document.getElementById('quant').value = currentValue + 1

	// Cập nhật giá trị mới vào thuộc tính value của phần tử input
	document.getElementById('quant').setAttribute('value', currentValue);
	console.log(document.getElementById('quant').value)
	let price = document.querySelector(".price").id;
	console.log(price)
	let cost = parseFloat(price) * parseInt(currentValue);
	document.querySelector(".priceVar").innerText = cost.toFixed(2)
	//truyền data về controller addToCart
	if(document.getElementById("addToCart")){
		var uid = document.querySelector("#product-uid").innerText;
		var form = document.getElementById("addToCart");
		form.action = `AddToCartController?idproduct=${uid}&quantity=${parseInt(document.getElementById('quant').getAttribute('value'))}`;
	}
}
function minusValue() {
	let currentValue = parseInt(document.getElementById('quant').getAttribute('value'));
	// Tăng giá trị lên 1
	if(currentValue!=0){
	currentValue = currentValue-1;
	/*document.getElementById('quant').value = currentValue - 1*/

	// Cập nhật giá trị mới vào thuộc tính value của phần tử input
	document.getElementById('quant').setAttribute('value', currentValue);
	console.log(document.getElementById('quant').value)
	let price;
	if(document.querySelector(".price").id){
		price = document.querySelector(".price").id;
	}
	console.log(price)
	let cost = parseFloat(price) * parseInt(currentValue);
	document.querySelector(".priceVar").innerText = cost.toFixed(2)
	//truyền data về controller addToCart
	if(document.getElementById("addToCart")){
		var uid = document.querySelector("#product-uid").innerText;
		var form = document.getElementById("addToCart");
		form.action = `AddToCartController?idproduct=${uid}&quantity=${parseInt(document.getElementById('quant').getAttribute('value'))}`;
	}
}
}
function showUp(id, name, desc, img, cost) {
        var modal = document.querySelector(".overlay");
		var form = document.getElementById("addToCart");
        var idP = document.querySelector(".product_id");
        var uid = document.querySelector("#product-uid");
        var imgProduct = document.querySelector(".imgOverlay");
        var showPopupButtons = document.querySelectorAll(".showPopupButton");
        var nameProduct = document.querySelector(".name_product_overlay");
        var price = document.querySelector(".priceVar");
        var costDefault = document.querySelector(".price");
        var descP = document.querySelector(".desc");
        var quantity = document.querySelector("#quant").value;
        uid.innerText = `${id}`;
        idP.innerText = `ID: ${id}`;
        modal.style.display = "flex";
        imgProduct.src = `public/img/${img}`;
        nameProduct.innerText = `${name}`;
        price.innerText = `${cost}`;
        costDefault.id= cost
        descP.innerText = `${desc}`;
        form.action =`AddToCartController?idproduct=${id}&quantity=${quantity}`;
    }
window.onclick = function (event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
};

// Xử lý sự kiện khi nhấn nút "Cancel"
if(cancelButton){
	cancelButton.onclick = function () {
	  modal.style.display = "none";
	};
	
}
let prices = document.querySelectorAll(".priceVar");
prices.forEach(function(price){
	price.innerText = parseFloat(price.innerText).toFixed(2)
})
function minus(e,button, productId) {
        var input = button.closest('tr').querySelector('input');
        if (parseInt(input.getAttribute('value')) >1) {
        var input = button.closest('tr').querySelector('input');
        //giữ nguyên giá trị
        input.setAttribute('value',parseInt(input.value))
        button.closest('tr').querySelector('input').value =input.getAttribute('value')
        console.log(input.value)
        //giảm
        input.setAttribute('value',parseInt(input.value)-1)
        button.closest('tr').querySelector('input').value = input.value
        console.log(input.value)
        input.value = parseInt(input.value);
        updateTotal(button,productId);
        }else{
			e.preventDefault();
			input.setAttribute('value',1)
			button.closest('tr').querySelector('input').value = 1;
			console.log("xóa")
			deleteRow(productId);
		}
    }

    function plus(button,productId) {
        var input = button.closest('tr').querySelector('input');
        input.setAttribute('value',parseInt(input.value)+1)
        console.log(input)
        button.closest('tr').querySelector('input').value =input.getAttribute('value')
        input.value = parseInt(input.value) + 1;
        updateTotal(button,productId);
    }

    function change(event, input,productId) {
        var value = parseInt(input.value);
        if (isNaN(value) || value <= 0) {
            input.value = 1;
            value = 1;
        }
        updateTotal(input,productId);
    }

    function updateTotal(button,productId) {
		var input = button.closest('tr').querySelector('input');
        var quantity = parseInt(input.getAttribute('value'));
        var price = parseFloat(input.closest('tr').querySelector('.price').innerText);
        var totalElement = input.closest('tr').querySelector('.priceVar');
        var total = quantity * price;
        totalElement.innerText = total.toFixed(2);
        var xhr = new XMLHttpRequest()
        productId = parseInt(productId)
		$.ajax({
			url: '/re-java-web/updateProduct?productId='+productId+'&quantity='+quantity, // Đường dẫn tới Servlet
			method: 'POST', // Phương thức HTTP
			data: {
				idproduct: productId,
				quantity: quantity
			},
			success: function(response) {
				// Xử lý phản hồi thành công
				console.log(response);
				console.log(quantity)
			},
			error: function(xhr, status, error) {
				// Xử lý lỗi
				console.error(xhr.responseText);
			}
});
    }

// Xử lý sự kiện khi nhấn nút "Add"
/*addButton.onclick = function () {
  var quantity = parseInt(quantityInput.value);
  // Thực hiện xử lý thêm sản phẩm vào giỏ hàng với số lượng được chọn
  // Tùy theo logic ứng dụng của bạn
  console.log("Thêm " + quantity + " sản phẩm vào giỏ hàng.");
  modal.style.display = "none";
};
*/

function deleteRow(productId){
			document.addEventListener('click', function(event) {
		        if (event.target.classList.contains('btn-md') || event.target.classList.contains('fa-times')|| event.target.classList.contains('minus') && event.target.parentElement.parentNode.querySelector("#quant").value <=1 || event.target.classList.contains('fa-minus') && event.target.parentElement.parentNode.querySelector("#quant").value <=1) {
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
	                            url: "/re-java-web/RemoveProductCart", // Đường dẫn tới Servlet xử lý yêu cầu
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
	                                    text: "Your product has been deleted.",
	                                    icon: "success"
	                                });
	                            },
	                            error: function(xhr, status, error) {
	                                console.error("Error:", error);
	                            }
	                        });
	                    }
				    	Swal.fire({
				      	title: "Deleted!",
				      	text: "Your file has been deleted.",
				      	icon: "success"
				    	});
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
// Đặt thông tin sản phẩm
function setProductInfo(name, imageSrc) {
  productNameElement.textContent = name;
  productImageElement.src = imageSrc;
}
document.addEventListener("DOMContentLoaded", function () {
  const stars = document.querySelectorAll(".star");

  stars.forEach(function (star) {
    star.addEventListener("click", function () {
      const rating = parseInt(star.getAttribute("data-value"));
      const parent = star.parentNode;
      parent.setAttribute("data-rating", rating);

      stars.forEach(function (s) {
        const value = parseInt(s.getAttribute("data-value"));
        if (value <= rating) {
          s.classList.add("active");
        } else {
          s.classList.remove("active");
        }
      });
    });
  });
});
