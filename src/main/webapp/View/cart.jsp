     <!-- Spinner Start -->
        <!-- <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div> -->
        <!-- Spinner End -->

		<%@ include file="head.jsp" %>
  		<%@ page import="bean.ProductWithQuantity" %>
  		<%@ page import="java.util.List" %>
        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Cart</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Cart</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Cart Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">Products</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                            <th scope="col">Handle</th>
                          </tr>
                        </thead>
                        <tbody>
        <%
        	List<ProductWithQuantity> productss = (List<ProductWithQuantity>) request.getAttribute("productWithQuantityList");
        	if(productss==null){
        		%>
        		<h1>No products in your cart now!</h1>
        		<%
        	}else{
        	for(ProductWithQuantity products : productss){
        %>
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="public/img/<%=products.getProduct().getImg_prod()%>" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                                    </div>
                                </th>
                                <td>
                                    <p class="mb-0 mt-4"><%=products.getProduct().getName_prod() %></p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4"><%=products.getProduct().getCost() %> $</p>
                                </td>
                                <td>
                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                            <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control form-control-sm text-center border-0" value="<%=products.getQuantity()%>">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4"><%=products.getQuantity()* Float.parseFloat(products.getProduct().getCost())%> $</p>
                                </td>
                                <td>
                                    <button onclick="deleteRow('<%= products.getProduct().getId()>')" class="btn btn-md rounded-circle bg-light border mt-4"  data-productId="<%=products.getProduct().getId()%>">
                                        <i class="fa fa-times text-danger"></i>
                                    </button>
                                </td>
                            
                            </tr>
                            <%}} %>
                        </tbody>
                    </table>
                </div>
                <div class="mt-5">
                    <input type="text" class="border-0 border-bottom rounded me-5 py-3 mb-4" placeholder="Coupon Code">
                    <button class="btn border-secondary rounded-pill px-4 py-3 text-primary" type="button">Apply Coupon</button>
                </div>
                <div class="row g-4 justify-content-end">
                    <div class="col-8"></div>
                    <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                        <div class="bg-light rounded">
                            <div class="p-4">
                                <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                                <div class="d-flex justify-content-between mb-4">
                                    <h5 class="mb-0 me-4">Subtotal:</h5>
                                    <p class="mb-0">$96.00</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h5 class="mb-0 me-4">Shipping</h5>
                                    <div class="">
                                        <p class="mb-0">Flat rate: $3.00</p>
                                    </div>
                                </div>
                                <p class="mb-0 text-end">Shipping to Ukraine.</p>
                            </div>
                            <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                <h5 class="mb-0 ps-4 me-4">Total</h5>
                                <p class="mb-0 pe-4">$99.00</p>
                            </div>
                            <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button" >Proceed Checkout</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart Page End -->
		<script type="text/javascript">
		function deleteRow(productId){
			document.addEventListener('click', function(event) {
		        if (event.target.classList.contains('btn-md') || event.target.classList.contains('fa-times')) {
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
	                            url: "/RemoveProductCart", // Đường dẫn tới Servlet xử lý yêu cầu
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
				  	}
				});
		        }
		    });
			

		}
		</script>
<%@ include file="end.html" %>
    </body>
</html>