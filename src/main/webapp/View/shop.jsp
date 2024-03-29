        <!-- Spinner Start -->
        <!-- <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div> -->
        <!-- Spinner End -->
		<%@ include file="head.jsp" %>
		<%@ page import="bean.Products"%>
		<%@ page import="java.util.List"%>
		
		<div class="overlay">
	<section class="product">
		<div class="product-photo">
			<div class="photo-container">
				<div class="photo-main">
					<div class="controls">
						<i class="fa-solid fa-share"></i> <i class="fa-regular fa-heart"></i>
					</div>
					<img class="imgOverlay"
						src="https://codetheworld.io/wp-content/uploads/2023/11/green-apple-with-slice.png"
						alt="green apple slice" />
				</div>
			</div>
		</div>
		<div class="product-info">
			<div class="title">
				<h1 class="name_product_overlay"></h1>
				<span class="product_id"></span> <span style="display: none;"
					id="product-uid"></span>
			</div>
			<div class="input-group quantity mt-4" style="width: 100px;">
				<div class="input-group-btn">
					<button onclick="minusValue()"
						class="btn minus btn-sm rounded-circle bg-light border">
						<i class="fa fa-minus"></i>
					</button>
				</div>
				<input onkeyup="changeValue(event)" type="text" id="quant"
					name="quantity"
					class="form-control form-control-sm text-center border-0 quantityCart"
					value="1">
				<div class="input-group-btn">
					<button onclick="plusValue()"
						class="btn plus btn-sm rounded-circle bg-light border">
						<i class="fa fa-plus"></i>
					</button>
				</div>
			</div>

			<div class="price">
				$<span class="priceVar"></span>
			</div>
			<div class="description">
				<h3>Description</h3>
				<p class="desc"></p>
			</div>
			<form id="addToCart" method="POST">
				<button class="buy-btn">ADD TO CART</button>
			</form>
			<button class="cancel-btn">CANCEL</button>
		</div>
	</section>
</div>
        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Shop</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Shop</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">Fresh fruits shop</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <label for="fruits">Default Sorting:</label>
                                    <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">
                                        <option value="volvo">Nothing</option>
                                        <option value="saab">Popularity</option>
                                        <option value="opel">Organic</option>
                                        <option value="audi">Fantastic</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a>
                                                        <span>(3)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>Oranges</a>
                                                        <span>(5)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>Strawbery</a>
                                                        <span>(2)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>Banana</a>
                                                        <span>(8)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>Pumpkin</a>
                                                        <span>(5)</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="mb-2">Price</h4>
                                            <input type="range" class="form-range w-100" id="rangeInput" name="rangeInput" min="0" max="500" value="0" oninput="amount.value=rangeInput.value">
                                            <output id="amount" name="amount" min-velue="0" max-value="500" for="rangeInput">0</output>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Additional</h4>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="Categories-1" name="Categories-1" value="Beverages">
                                                <label for="Categories-1"> Organic</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="Categories-2" name="Categories-1" value="Beverages">
                                                <label for="Categories-2"> Fresh</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="Categories-3" name="Categories-1" value="Beverages">
                                                <label for="Categories-3"> Sales</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="Categories-4" name="Categories-1" value="Beverages">
                                                <label for="Categories-4"> Discount</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="Categories-5" name="Categories-1" value="Beverages">
                                                <label for="Categories-5"> Expired</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <h4 class="mb-3">Featured products</h4>
                                        <div class="d-flex align-items-center justify-content-start">
                                            <div class="rounded me-4" style="width: 100px; height: 100px;">
                                                <img src="public/img/featur-1.jpg" class="img-fluid rounded" alt="">
                                            </div>
                                            <div>
                                                <h6 class="mb-2">Big Banana</h6>
                                                <div class="d-flex mb-2">
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="d-flex mb-2">
                                                    <h5 class="fw-bold me-2">2.99 $</h5>
                                                    <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-start">
                                            <div class="rounded me-4" style="width: 100px; height: 100px;">
                                                <img src="public/img/featur-2.jpg" class="img-fluid rounded" alt="">
                                            </div>
                                            <div>
                                                <h6 class="mb-2">Big Banana</h6>
                                                <div class="d-flex mb-2">
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="d-flex mb-2">
                                                    <h5 class="fw-bold me-2">2.99 $</h5>
                                                    <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-start">
                                            <div class="rounded me-4" style="width: 100px; height: 100px;">
                                                <img src="public/img/featur-3.jpg" class="img-fluid rounded" alt="">
                                            </div>
                                            <div>
                                                <h6 class="mb-2">Big Banana</h6>
                                                <div class="d-flex mb-2">
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="d-flex mb-2">
                                                    <h5 class="fw-bold me-2">2.99 $</h5>
                                                    <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-center my-4">
                                            <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew More</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="position-relative">
                                            <img src="public/img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                            <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                <% 
                                if(request.getAttribute("msg") != null){
                                	%>
                                	<p> <%=request.getAttribute("msg") %></p>
                                	<%
                                }
            					List<Products> pageData = (List<Products>) request.getAttribute("pageData");
            					for (Products data : pageData) {
        							%>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <a href="Detail_Product?id=<%=data.getId()%>"><img src="public/img/<%=data.getImg_prod() %>" style="height: 244.8px" 
                                                class="img-fluid w-100 rounded-top" alt=""></a>
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><%=data.getType() %></div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <a href="Detail_Product?id=<%=data.getId()%>"><h4><%=data.getName_prod() %></h4></a>
                                                <p><%=data.getDescription() %></p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$<%=data.getCost() %> / kg</p>
                                                    <button
													onclick="showUp('<%=data.getId()%>', '<%=data.getName_prod()%>', '<%=data.getDescription()%>', '<%=data.getImg_prod()%>', '<%=data.getCost()%>');"
													type="button"
													class="btn border border-secondary rounded-pill px-3 text-primary showPopupButton">
													<i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
													Cart
												</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%}
            					 		int totalPages = (int) request.getAttribute("totalPages");
            				       		int currentPage = (int) request.getAttribute("currentPage");
            				    	%>
                                    <div class="col-12">
                                        <div class="pagination d-flex justify-content-center mt-5">
                                        <% if (currentPage > 1) { %>
                                            <a href="shopDirector?page=<%= currentPage-1 %>" class="rounded">&laquo;</a>
                                        <% } %>
                                            
                                        <% for (int i = 1; i <= totalPages; i++) { 
                                        	if(i == currentPage){%>
                                        		<a href="shopDirector?page=<%= i %>" class="active rounded"><%= i %></a>
                                        	<%}else{
                                        	%>
            								<a href="shopDirector?page=<%= i %>"><%= i %></a>
        								<% }}
                                        if (currentPage < totalPages) { %>
                                            <a href="shopDirector?page=<%= currentPage+1 %>" class="rounded">&raquo;</a>
                                        <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->
	<script src="public/js/addCartOverLay.js"></script>
		<%@ include file="end.html" %>
    </body>

</html>