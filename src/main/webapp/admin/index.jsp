<%@page import="bean.Products"%>
<%@ page import="java.util.List"%>
<%@ include file="head.jsp"%>

		<%
			int numProduct = (int) request.getAttribute("numProduct");
			int numUser = (int) request.getAttribute("numUser");
		%>
        <!-- Sale & Revenue Start -->
        <div class="container-fluid pt-4 px-4">
          <div class="row g-4">
            <div class="col-sm-6 col-xl-3">
              <div
                class="bg-secondary rounded d-flex align-items-center justify-content-between p-4"
              >
                <i class="fa fa-chart-line fa-3x text-primary"></i>
                <div class="ms-3">
                  <p class="mb-2">Total Products</p>
                  <h6 class="mb-0"><%=numProduct%></h6>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-xl-3">
              <div
                class="bg-secondary rounded d-flex align-items-center justify-content-between p-4"
              >
                <i class="fa fa-chart-bar fa-3x text-primary"></i>
                <div class="ms-3">
                  <p class="mb-2">Total Users</p>
                  <h6 class="mb-0"><%=numUser %></h6>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-xl-3">
              <div
                class="bg-secondary rounded d-flex align-items-center justify-content-between p-4"
              >
                <i class="fa fa-chart-area fa-3x text-primary"></i>
                <div class="ms-3">
                  <p class="mb-2">Today Revenue</p>
                  <h6 class="mb-0">$1234</h6>
                </div>
              </div>
            </div>
            <div class="col-sm-6 col-xl-3">
              <div
                class="bg-secondary rounded d-flex align-items-center justify-content-between p-4"
              >
                <i class="fa fa-chart-pie fa-3x text-primary"></i>
                <div class="ms-3">
                  <p class="mb-2">Total Revenue</p>
                  <h6 class="mb-0">$1234</h6>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Sale & Revenue End -->

        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
          <div class="bg-secondary text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
              <h6 class="mb-0">Top Featured Products</h6>
              <a href="">Show All</a>
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
                    <th scope="col">Cost($)</th>
                    <th scope="col">Description</th>
                    <th scope="col">Type</th>
                    <th scope="col">Species</th>
                    <th scope="col">Quantity Purchased</th>
                    <th scope="col">Quantity Stock</th>
                    <th scope="col">Action</th>
                  </tr>
                </thead>
                <tbody>
                <%
                	List<Products> products = (List<Products>) request.getAttribute("productList");
                	for(Products product : products){
                %>
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
				<%
				}
				%>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- Recent Sales End -->
      </div>
      <!-- Content End -->
    </div>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="admin/lib/chart/chart.min.js"></script>
    <script src="admin/lib/easing/easing.min.js"></script>
    <script src="admin/lib/waypoints/waypoints.min.js"></script>
    <script src="admin/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="admin/lib/tempusdominus/js/moment.min.js"></script>
    <script src="admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="admin/js/main.js"></script>
  </body>
</html>
