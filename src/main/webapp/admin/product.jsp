<%@page import="bean.Products"%>
<%@ page import="java.util.List"%>
<%@ include file="head.jsp"%>
        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-secondary text-center rounded p-4">
              <div class="d-flex align-items-center justify-content-between mb-4">
                <h6 class="mb-0">All Product</h6>
                <button type="button" class="btn btn-success m-2" id="addProductButton">Add new product</button>
              </div>
              <div class="table-responsive">
                <table
                  class="table text-start align-middle table-bordered table-hover mb-0"
                >
                  <thead>
                    <tr class="text-white">
                      <th scope="col">
                        <input class="form-check-input" type="checkbox" />
                      </th>
                      <th scope="col">Product Image</th>
                      <th scope="col">Product Name</th>
                      <th scope="col">Cost</th>
                      <th scope="col">Description</th>
                      <th scope="col">Type</th>
                      <th scope="col">Species</th>
                      <th scope="col">Quantity Purchased</th>
                      <th scope="col">Quantity Stock</th>
                      <th scope="col">Action</th>
                    </tr>
                  </thead>
                  <tbody id="tb-product">
                  
                    <%
                    List<Products> products = (List<Products>) request.getAttribute("products");
                    for(Products product : products){%>
                    <tr>
                      <td><input class="form-check-input" type="checkbox" /></td>
							<td><div class="d-flex align-items-center">
									<img src="public/img/<%=product.getImg_prod()%>"
										class="img-fluid me-5 rounded-circle"
										style="width: 80px; height: 80px;" alt="">
								</div></td>
							<td><span class="value" id="productName"><%=product.getName_prod()%></span></td>
							<td><span class="value" id="productCost"><%=product.getCost()%></span></td>
							<td><span class="value" id="productDescription"><%=product.getDescription()%></span></td>
							<td><span class="value" id="productType"><%=product.getType()%></span></td>
							<td><span class="value" id="productSpecies"><%=product.getSpecies()%></span></td>
							<td><span class="value" id="quantityBought"><%=product.getQuantity_bought()%></span></td>
							<td><span class="value" id="quantityStock"><%=product.getQuantity_stock()%></span></td>
							<td>
								<button type="button" onclick="editProduct(this, <%=product.getId() %>)" class="btn btn-info rounded-pill"><i class="fa-regular fa-pen-to-square"></i></button>
                        		<button type="button" onclick="deleteRow(<%=product.getId()%>)" class="btn btn-danger rounded-pill"><i class="fa fa-times"></i></button>
							</td>
                    </tr>
                    <%}%>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
<div id="overlay" class="overlay">
	<div class="overlay-content">
		<span class="close-button">&times;</span>
		<h2>Add new product</h2>
		<form id="productForm" class="flex-form">
			<div class="column">
				<label for="name">Product name:</label> <input type="text"
					id="inputName" name="name" required /><br />
				<br /> <label for="desc">Description:</label>
				<textarea id="proDesc" name="desc" required></textarea>
				<br /> <br /> <label for="productPrice">Cost:</label> <input
					type="number" id="productPrice" name="productPrice" required min="1"/><br />
				<label for="proType">Type:</label> <input type="text"
					id="proType" name="proType" required /><br />
			</div>
			<div class="column">
				<label for="proSpecies">Product species:</label> <input
					type="text" id="proSpecies" name="proSpecies" required /><br />
				<label for="proStock">Quantity in stock:</label> <input
					type="number" id="proStock" name="proStock" required min="1"/><br />
				<br /> <label for="productImage">Product Image:</label> <input onchange="changeInputImg(event)"
					type="file" id="fileInput" name="productImage" accept="image/*"
					required /><input hidden="true" id="imageName"/><br /> <br /> <img id="imagePreview"
					src="https://th.bing.com/th?id=OIP.d5rVSrO1bKlTpP0XmUzBCwHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"
					alt="" />
				<button class="addProduct btn btn-success m-2">Thêm</button>
			</div>
		</form>
	</div>
</div>
<!-- Content End -->
<script>
	var msg = <%= request.getAttribute("msg")%>
	if(msg){
		if(msg == "success"){
			Swal.fire({
				  position: "center",
				  icon: "success",
				  title: "Success!",
				  text: "Add Product Success"
				});
		}else if(msg == "failure"){
			Swal.fire({
				  icon: "error",
				  title: "Oops...",
				  text: "Add Product Failed!",
				});
		}
	}
</script>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="admin/lib/chart/chart.min.js"></script>
    <script src="admin/lib/easing/easing.min.js"></script>
    <script src="admin/lib/waypoints/waypoints.min.js"></script>
    <script src="admin/lib/owlcarousel/owl.carousel.min.js"></script>
    <!-- Template Javascript -->
    <script src="admin/js/main.js"></script>
  </body>
</html>
