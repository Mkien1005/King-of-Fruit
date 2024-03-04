<%@page import="bean.Products"%>
<%@ page import="java.util.List"%>
<%@ include file="head.jsp"%>
      <!-- Sidebar Start -->
      <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-secondary navbar-dark">
          <a href="homepage" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary">
              <i class="fa fa-user-edit me-2"></i>DarkPan
            </h3>
          </a>
          <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
              <img
                class="rounded-circle"
                src="admin/img/user.jpg"
                alt=""
                style="width: 40px; height: 40px"
              />
              <div
                class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"
              ></div>
            </div>
            <div class="ms-3">
              <h6 class="mb-0">Jhon Doe</h6>
              <span>Admin</span>
            </div>
          </div>
          <div class="navbar-nav w-100">
            <a href="homepage" class="nav-item nav-link active"
              ><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a
            >
            <a href="products" class="nav-item nav-link"
              ><i class="fa fa-th me-2"></i>Products</a
            >
            <a href="users" class="nav-item nav-link"
              ><i class="fa-regular fa-user"></i>Users</a
            >
            <div class="nav-item dropdown">
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-bs-toggle="dropdown"
                ><i class="fa fa-laptop me-2"></i>Elements</a
              >
              <div class="dropdown-menu bg-transparent border-0">
                <a href="button.html" class="dropdown-item">Buttons</a>
                <a href="typography.html" class="dropdown-item">Typography</a>
                <a href="element.html" class="dropdown-item">Other Elements</a>
              </div>
            </div>

            <a href="admin/table.html" class="nav-item nav-link"
              ><i class="fa fa-table me-2"></i>Tables</a
            >
            <a href="chart.html" class="nav-item nav-link"
              ><i class="fa fa-chart-bar me-2"></i>Charts</a
            >
            <div class="nav-item dropdown">
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-bs-toggle="dropdown"
                ><i class="far fa-file-alt me-2"></i>Pages</a
              >
              <div class="dropdown-menu bg-transparent border-0">
                <a href="admin/signin.html" class="dropdown-item">Sign In</a>
                <a href="admin/signup.html" class="dropdown-item">Sign Up</a>
                <a href="admin/404.html" class="dropdown-item">404 Error</a>
                <a href="admin/blank.html" class="dropdown-item">Blank Page</a>
              </div>
            </div>
          </div>
        </nav>
      </div>
      <!-- Sidebar End -->

      <!-- Content Start -->
      <div class="content">
        <!-- Navbar Start -->
        <nav
          class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0"
        >
          <a href="homepage" class="navbar-brand d-flex d-lg-none me-4">
            <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
          </a>
          <a href="#" class="sidebar-toggler flex-shrink-0">
            <i class="fa fa-bars"></i>
          </a>
          <form class="d-none d-md-flex ms-4">
            <input
              class="form-control bg-dark border-0"
              type="search"
              placeholder="Search"
            />
          </form>
          <div class="navbar-nav align-items-center ms-auto">
            <div class="nav-item dropdown">
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-bs-toggle="dropdown"
              >
                <i class="fa fa-envelope me-lg-2"></i>
                <span class="d-none d-lg-inline-flex">Message</span>
              </a>
              <div
                class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0"
              >
                <a href="#" class="dropdown-item">
                  <div class="d-flex align-items-center">
                    <img
                      class="rounded-circle"
                      src="admin/img/user.jpg"
                      alt=""
                      style="width: 40px; height: 40px"
                    />
                    <div class="ms-2">
                      <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                      <small>15 minutes ago</small>
                    </div>
                  </div>
                </a>
                <hr class="dropdown-divider" />
                <a href="#" class="dropdown-item">
                  <div class="d-flex align-items-center">
                    <img
                      class="rounded-circle"
                      src="admin/img/user.jpg"
                      alt=""
                      style="width: 40px; height: 40px"
                    />
                    <div class="ms-2">
                      <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                      <small>15 minutes ago</small>
                    </div>
                  </div>
                </a>
                <hr class="dropdown-divider" />
                <a href="#" class="dropdown-item">
                  <div class="d-flex align-items-center">
                    <img
                      class="rounded-circle"
                      src="admin/img/user.jpg"
                      alt=""
                      style="width: 40px; height: 40px"
                    />
                    <div class="ms-2">
                      <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                      <small>15 minutes ago</small>
                    </div>
                  </div>
                </a>
                <hr class="dropdown-divider" />
                <a href="#" class="dropdown-item text-center"
                  >See all message</a
                >
              </div>
            </div>
            <div class="nav-item dropdown">
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-bs-toggle="dropdown"
              >
                <i class="fa fa-bell me-lg-2"></i>
                <span class="d-none d-lg-inline-flex">Notificatin</span>
              </a>
              <div
                class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0"
              >
                <a href="#" class="dropdown-item">
                  <h6 class="fw-normal mb-0">Profile updated</h6>
                  <small>15 minutes ago</small>
                </a>
                <hr class="dropdown-divider" />
                <a href="#" class="dropdown-item">
                  <h6 class="fw-normal mb-0">New user added</h6>
                  <small>15 minutes ago</small>
                </a>
                <hr class="dropdown-divider" />
                <a href="#" class="dropdown-item">
                  <h6 class="fw-normal mb-0">Password changed</h6>
                  <small>15 minutes ago</small>
                </a>
                <hr class="dropdown-divider" />
                <a href="#" class="dropdown-item text-center"
                  >See all notifications</a
                >
              </div>
            </div>
            <div class="nav-item dropdown">
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-bs-toggle="dropdown"
              >
                <img
                  class="rounded-circle me-lg-2"
                  src="admin/img/user.jpg"
                  alt=""
                  style="width: 40px; height: 40px"
                />
                <span class="d-none d-lg-inline-flex">John Doe</span>
              </a>
              <div
                class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0"
              >
                <a href="#" class="dropdown-item">My Profile</a>
                <a href="#" class="dropdown-item">Settings</a>
                <a href="#" class="dropdown-item">Log Out</a>
              </div>
            </div>
          </div>
        </nav>
        <!-- Navbar End -->

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
                        		<button type="button" class="btn btn-danger rounded-pill"><i class="fa fa-times"></i></button>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
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
	    newData["id"] = idP;
	    sendDataToServer(newData);
	}
	
	</script>
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
