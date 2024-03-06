<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Admin - King of Fruit</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <!-- Favicon -->
    <link href="admin/img/favicon.ico" rel="icon" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet" 
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!-- Libraries Stylesheet -->
    <link href="admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link
      href="admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
      rel="stylesheet"
    />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="admin/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="admin/css/style.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </head>

  <body>
    <div class="container-fluid position-relative d-flex p-0">
      <!-- Spinner Start -->
      <div
        id="spinner"
        class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center"
      >
        <div
          class="spinner-border text-primary"
          style="width: 3rem; height: 3rem"
          role="status"
        >
          <span class="sr-only">Loading...</span>
        </div>
      </div>
      <!-- Spinner End -->
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
            <a href="homepage" class="nav-item Dashboard nav-link active"
              ><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a
            >
            <a href="products" class="nav-item Products nav-link"
              ><i class="fa fa-th me-2"></i>Products</a
            >
            <a href="users" class="nav-item Users nav-link"
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

            <a href="table.html" class="nav-item nav-link"
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
                <a href="signin.html" class="dropdown-item">Sign In</a>
                <a href="signup.html" class="dropdown-item">Sign Up</a>
                <a href="404.html" class="dropdown-item">404 Error</a>
                <a href="blank.html" class="dropdown-item">Blank Page</a>
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
          <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
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
    <script>
    	var info = '<%=request.getAttribute("info")%>';
    	var users = document.querySelector(".Users");
    	var dboard = document.querySelector(".Dashboard");
    	var products = document.querySelector(".Products");
    	if(info == "Users"){
    		users.classList.add("active")
    		products.classList.remove("active");
    		dboard.classList.remove("active")
    	}else if(info == "Products"){
    		products.classList.add("active");
    		users.classList.remove("active");
    		dboard.classList.remove("active")
    	}else{
    		dboard.classList.add("active")
    		products.classList.remove("active");
    		users.classList.remove("active");
    	}
    </script>