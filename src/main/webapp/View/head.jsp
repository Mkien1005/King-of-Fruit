<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>King of Fruit</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="adescription" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="public/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link href="public/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="public/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="public/css/style.css" rel="stylesheet" />
    
    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="public/img/icon.png">
<!--       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $.ajax({
                url: '../getProduct',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                	console.log(data);
                	function sendGetRequestToServlet() {
                        var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function() {
                            if (this.readyState == 4 && this.status == 200) {
                                // Xử lý phản hồi từ servlet
                                console.log(this.responseText);
                            }
                        };
                        xhttp.open("GET", "../getProduct", true);
                        xhttp.send();
                    }

                    // Gọi hàm sendGetRequestToServlet() khi trang được load
                    window.onload = function() {
                        sendGetRequestToServlet();
                    };
                    // Xử lý dữ liệu từ servlet
                    data.forEach(function(product) {
                    	
                        $('#productList').append('<div class="rounded position-relative fruite-item">'+
                        '<div class="fruite-img">'+
                                '<img'+
                                  'src="../public/img/'+product.productImage+'"'+
                                  'class="img-fluid w-100 rounded-top"'+
                                  'alt=""'+
                                '/>'+
                              '</div>'+
                              '<div'+
                                'class="text-white bg-secondary px-3 py-1 rounded position-absolute"'+
                                'style="top: 10px; left: 10px"'+
                              '>'
                                + product.type +
                              '</div>'+
                              '<div'+
                                'class="p-4 border border-secondary border-top-0 rounded-bottom"'+
                              '>'+
                                '<h4>'+product.productName+'</h4>'+
                                '<p>'+product.description+
                                '</p>'+
                                '<div'+
                                  'class="d-flex justify-content-between flex-lg-wrap"'+
                                '>'+
                                  '<p class="text-dark fs-5 fw-bold mb-0">'+
                                    '$'+product.cost +'/ kg'+
                                  '</p>'+
                                  '<a'+
                                    'href="#"'+
                                    'class="btn border border-secondary rounded-pill px-3 text-primary"'+
                                    '><i'+
                                      'class="fa fa-shopping-bag me-2 text-primary"'+
                                    '></i>'+
                                    'Add to cart</a'+
                                  '>'+
                                '</div>'+
                              '</div>'+
                            '</div>');
                    });
                }
            });
        });
    </script> -->
  </head>
 <body>

    <!-- Spinner Start -->
    <div
      id="spinner"
      class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center"
    >
      <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <!-- Navbar start -->
    <div class="container-fluid fixed-top">
      <div class="container topbar bg-primary d-none d-lg-block">
        <div class="d-flex justify-content-between">
          <div class="top-info ps-2">
            <small class="me-3"
              ><i class="fas fa-map-marker-alt me-2 text-secondary"></i>
              <a href="#" class="text-white">123 Street, New York</a></small
            >
            <small class="me-3"
              ><i class="fas fa-envelope me-2 text-secondary"></i
              ><a href="#" class="text-white">Email@Example.com</a></small
            >
          </div>
          <%
          // Lấy phiên HttpSession từ request
          // Kiểm tra xem phiên HttpSession có tồn tại không
          if (session == null || session.getAttribute("username") == null) {
              // Phiên HttpSession không tồn tại hoặc không có username được lưu trong phiên
              // Hiển thị nút "Sign In" và "Sign Up"
              
      %>
      	  <div class="top-link pe-2">
            <a href="./login.jsp" class="text-white"
              ><small class="text-white mx-2">Sign In</small>/</a
            >
            <a href="./register.jsp" class="text-white"
              ><small class="text-white ms-2">Sign Up</small></a
            >
          </div>
      <%
          } else {
              // Phiên HttpSession tồn tại và có username được lưu trong phiên
              // Hiển thị thông tin của người dùng (hoặc các thao tác khác)
      %>
      		<small class="text-white mx-2">
              <p>Welcome, <%= session.getAttribute("username") %>! (<a href="./login.jsp" class="text-white"
              ><small class="text-white mx-2">Sign Out</small>/</a
            >)</p>
            </small>
      <%
          }
      %>
          
        </div>
      </div>
      <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
          <a href="index.jsp" class="navbar-brand"
            ><h1 class="text-primary display-6">Fruitables</h1></a
          >
          <button
            class="navbar-toggler py-2 px-3"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse"
          >
            <span class="fa fa-bars text-primary"></span>
          </button>
          <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
            <div class="navbar-nav mx-auto">
              <a href="./index.jsp" class="nav-item nav-link active">Home</a>
              <a href="./shop.jsp" class="nav-item nav-link">Shop</a>
              <a href="./shop-detail.jsp" class="nav-item nav-link"
                >Shop Detail</a
              >
              <div class="nav-item dropdown">
                <a
                  href="#"
                  class="nav-link dropdown-toggle"
                  data-bs-toggle="dropdown"
                  >Pages</a
                >
                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                  <a href="cart.jsp" class="dropdown-item">Cart</a>
                  <a href="chackout.jsp" class="dropdown-item">Chackout</a>
                  <a href="testimonial.jsp" class="dropdown-item"
                    >Testimonial</a
                  >
                  <a href="404.jsp" class="dropdown-item">404 Page</a>
                </div>
              </div>
              <a href="contact.jsp" class="nav-item nav-link">Contact</a>
            </div>
            <div class="d-flex m-3 me-0">
              <button
                class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
                data-bs-toggle="modal"
                data-bs-target="#searchModal"
              >
                <i class="fas fa-search text-primary"></i>
              </button>
              <a href="cart.jsp" class="position-relative me-4 my-auto">
                <i class="fa fa-shopping-bag fa-2x"></i>
                <span
                  class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                  style="top: -5px; left: 15px; height: 20px; min-width: 20px"
                  >3</span
                >
              </a>
              <a href="#" class="my-auto">
                <i class="fas fa-user fa-2x"></i>
              </a>
            </div>
          </div>
        </nav>
      </div>
    </div>
    <!-- Navbar End -->

    <!-- Modal Search Start -->
    <div
      class="modal fade"
      id="searchModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">
              Search by keyword
            </h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body d-flex align-items-center">
            <div class="input-group w-75 mx-auto d-flex">
              <input
                type="search"
                class="form-control p-3"
                placeholder="keywords"
                aria-describedby="search-icon-1"
              />
              <span id="search-icon-1" class="input-group-text p-3"
                ><i class="fa fa-search"></i
              ></span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal Search End -->
