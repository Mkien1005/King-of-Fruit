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
    <link href="public/css/overlay.css" rel="stylesheet" />
    
    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="public/img/icon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://kit.fontawesome.com/03dcdfffe5.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
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
              <a href="https://www.google.com/maps/place/Ktx+h%E1%BA%A3i+khang/@21.5913593,105.8019691,17z/data=!3m1!4b1!4m6!3m5!1s0x313527078c570b41:0x6842405295b2424!8m2!3d21.5913593!4d105.8019691!16s%2Fg%2F11qprf1cjq?entry=ttu" target="_blank" class="text-white">Z115 Street Quyet Thang, Thai Nguyen</a></small
            >
            <small class="me-3"
              ><i class="fas fa-envelope me-2 text-secondary"></i
              ><a href="#" class="text-white">manhkien2003@gmail.com</a></small
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
            <a href="loginPage" class="text-white"
              ><small class="text-white mx-2">Sign In</small>/</a
            >
            <a href="RegisterPage" class="text-white"
              ><small class="text-white ms-2">Sign Up</small></a
            >
          </div>
      <%
          } else {
              // Phiên HttpSession tồn tại và có username được lưu trong phiên
              // Hiển thị thông tin của người dùng (hoặc các thao tác khác)
      %>
      		<small class="text-white mx-2"><p>Welcome, <%= session.getAttribute("username") %>! (<a href="LogoutController" class="text-white"
              >
              <small class="text-white mx-2">Sign Out</small></a
            >)</p>
            </small>
      <%
          }
      %>
          
        </div>
      </div>
      <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
          <a href="indexForward" class="navbar-brand"
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
              <a href="indexForward" class="nav-item nav-link active">Home</a>
              <a href="shopDirector" class="nav-item nav-link">Shop</a>
              <div class="nav-item dropdown">
                <a
                  href="#"
                  class="nav-link dropdown-toggle"
                  data-bs-toggle="dropdown"
                  >Pages</a
                >
                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                  <a href="CartDirector" class="dropdown-item">Cart</a>
                  <a href="chackout.jsp" class="dropdown-item">Chackout</a>
                  <a href="testimonial.jsp" class="dropdown-item"
                    >Testimonial</a
                  >
                </div>
              </div>
              <a href="contact.jsp" class="nav-item nav-link">Contact</a>
            </div>
            <div class="d-flex m-3 me-0 parentSearch">
            <input type="text" id="searchInput" oninput="searchProducts()" class="search-bar" placeholder="Search.." name="search">
              <button
                class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
                data-bs-toggle="modal"
                data-bs-target="#searchModal"
              >
                <i class="fas fa-search text-primary"></i>
              </button>
              <a href="CartDirector" class="position-relative me-4 my-auto">
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
              <ul id="searchResults">
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
    <!-- Navbar End -->

    <!-- Modal Search Start -->
    <!-- <div
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
            <div class="input-group w-75 mx-auto d-flex" style="bottom: 250px">
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
    </div>	 -->
    <!-- Modal Search End -->
<script>
	var name_product_List = '<%= request.getAttribute("name_product_List") %>';
	name_product_List = name_product_List.replace(/([^,\[\]]+)/g, '"$1"');
	name_product_List = JSON.parse(name_product_List);
	for (var i = 0; i < name_product_List.length; i++) {
		name_product_List[i] = name_product_List[i].trim();
	}
	function searchProducts(){
		var searchValue = document.getElementById("searchInput").value.toLowerCase();
		var searchResults = document.getElementById("searchResults");
		searchResults.innerHTML = "";
		var count=0;
		name_product_List.forEach((product)=>{
			if(count<5){
				var productName = product.toLowerCase();
				if(productName.includes(searchValue)){
					var li = document.createElement('li');
					var link = document.createElement('a');
					pro = '?keyword='+encodeURIComponent(product)
					// Đặt href cho thẻ a
					link.href = 'shopDirector'+pro;
					//Thêm class thẻ a
					link.classList.add("shopKeyword")
					// Thêm nội dung vào thẻ a
					link.textContent = product;
					// Thêm thẻ a vào trong thẻ li
					li.appendChild(link);
					searchResults.appendChild(li);
				}
				count++;
			}else{
				return;
			}
		})
		count=0;
		if (searchResults.childElementCount == 0) {
			var li = document.createElement('li');
			var link = document.createElement('a');
			pro = '?keyword='+encodeURIComponent(searchValue)
			// Đặt href cho thẻ a
			link.href = 'shopDirector'+pro;
			//Thêm class thẻ a
			link.classList.add("shopKeyword")
			// Thêm nội dung vào thẻ a
			link.textContent = "Tìm kiếm sản phẩm với từ khóa:" + searchValue;
			// Thêm thẻ a vào trong thẻ li
			li.appendChild(link);
			searchResults.appendChild(li);
  		}
	}
	let search_bar = document.querySelector("#searchInput");
	var searchResult = document.getElementById("searchResults");
	search_bar.addEventListener("focus", function () {
	  console.log("focus");
	  searchResult.style.display = "block";
	});
	search_bar.addEventListener('blur', function() {
	    // Nếu không tập trung vào searchInput và cũng không tập trung vào searchResult, ẩn kết quả
		document.addEventListener('click', function(event) {
		    // Lấy phần tử mà người dùng đã nhấp chuột vào
		    var clickedElement = event.target;
		    if(clickedElement!= searchResult && clickedElement != search_bar){
		    	searchResult.style.display = "none";
		    }
		});
	});
	
</script>





