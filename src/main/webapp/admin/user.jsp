<%@page import="bean.users"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
    
        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-secondary text-center rounded p-4">
              <div class="d-flex align-items-center justify-content-between mb-4">
                <h6 class="mb-0">All Users</h6>
                <button type="button" class="btn btn-success m-2">Add new user</button>
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
                      <th scope="col">Full Name</th>
                      <th scope="col">Username</th>
                      <th scope="col">Address</th>
                      <th scope="col">Email</th>
                      <th scope="col">Phone</th>
                      <th scope="col">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%
                    List<users> users =(List<users>) request.getAttribute("users");
                    for(users user : users){ %>
                    <tr>
                      <td><input class="form-check-input" type="checkbox" /></td>
                      <td><span class="value" id="fullname"><%=user.getFullName()%></span></td>
                      <td><span class="value" id="username"><%=user.getUsername() %></span></td>
                      <td><span class="value" id="address"><%=user.getAddress() %></span></td>
                      <td><span class="value" id="email"><%=user.getEmail() %></span></td>
                      <td><span class="value" id="phone"><%=user.getPhone() %></span></td>
                      <td>
						<button type="button" onclick="editUser(this, <%=user.getId() %>)" class="btn btn-info rounded-pill"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button type="button" onclick="deleteRowUser(<%=user.getId()%>)" class="btn btn-danger rounded-pill"><i class="fa fa-times"></i></button>
					  </td>
                    </tr>
                    <%} %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <!-- Recent Sales End -->
        </div>
        <!-- Content End -->
      </div>
  
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
	<script src="admin/js/editUser.js"></script>
    <script src="admin/js/main.js"></script>
  </body>
</html>
