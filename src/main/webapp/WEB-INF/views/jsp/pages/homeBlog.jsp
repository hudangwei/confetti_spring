<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../layout/taglib.jsp" %>
<%@ page session="false" %>



<fmt:parseNumber var="count" value="0"/>
<fmt:parseNumber var="countFeat" value="0"/>
<fmt:parseNumber var="noColumns" value="4"/>
<fmt:parseNumber var="noColumnsFeat" value="2"/>
<fmt:parseNumber var="starter" value="0"/>
<fmt:parseNumber var="unit" value="1"/>
<fmt:parseNumber var="videosSize" value="${fn:length(videoPlays)}"/>
<fmt:parseNumber var="albumsSize" value="${fn:length(albums)}"/>
<fmt:parseNumber var="featuredSize" value="${fn:length(featuredPublications)}"/>

				<!-- Blog Grid -->
				<div class="margin-bottom-50">
					<h2 class="title-v4">Featured Items </h2>
					
						
						<c:forEach items="${featuredPublications}" var="featuredItem">
						
						<c:choose>
				
							<c:when test="${countFeat == starter}"><div class="row margin-bottom-50"></c:when>
							<c:otherwise>
								<c:if test="${(countFeat%noColumnsFeat)==starter}"><div class="row margin-bottom-50"></c:if>
							</c:otherwise>
							
						</c:choose>
						
						<c:choose>
							<c:when test="${not empty featuredItem.post}">
							
								
								<div class="col-sm-6 sm-margin-bottom-50">
									<!-- Blog Grid -->
									
									
											
											
											<div class="blog-grid margin-bottom-40">
											
												<c:choose>
													<c:when test="${not empty featuredItem.post.uploads && fn:length(featuredItem.post.uploads) >= 1}">
														<img class="img-responsive" src="<c:url value='/uploads/download?key=${featuredItem.post.uploads.iterator().next().keyIdentification}'/>" alt="">
													</c:when>
												<c:otherwise>
												</c:otherwise>
												</c:choose>
												
												<h3><a href="<spring:url value='/posts/view/${featuredItem.post.id}/'/>"><c:out value="${featuredItem.post.title}" /></a></h3>
												<ul class="blog-grid-info">
													<li><c:out value="${featuredItem.profile.name}"/></li>
													<li><c:out value="${featuredItem.post.created}" /></li>
													<li><a href="#"><i class="fa fa-comments"></i> 0</a></li>
												</ul>
												<p><c:out value="${featuredItem.post.description}" escapeXml="false"/></p>
												<a class="r-more" href="<spring:url value='/posts/view/${featuredItem.post.id}'/>">Read More</a>
											</div>
								
									
									<div class="blog-grid margin-bottom-40">
										
									</div>
									<!-- End Blog Grid -->

								</div>
							</c:when>
							<c:when test="${not empty featuredItem.play}">
								<div class="col-sm-6 sm-margin-bottom-50">
									<div class="news-v2-badge">
							
										<div class="responsive-video">
											<iframe src="<c:out value='${featuredItem.play.url}'/>" frameborder="0" allowfullscreen></iframe>
										</div>
										
										<p>
											<fmt:formatDate pattern="dd MMMM yyyy" value="${featuredItem.play.created}" />
										</p>
									</div>
									
									<div class="news-v2-desc">
										<h3>
											<a href='<c:url value='/plays/view/${featuredItem.play.id}/'/>'><c:out value="${featuredItem.play.title}" /></a>
										</h3>
										<small>By <a href="<c:url value='/profile/${featuredItem.profile.name}' />" ><c:out value="${featuredItem.profile.name}" /></a> | In <a href="#"><c:out value="${featuredItem.play.playType.name}" /></a></small>
									</div>
								</div>
							
							</c:when>
							<c:when test="${not empty featuredItem.album}">
							
								<div class="col-sm-6 sm-margin-bottom-50">
								
										<div class="blog-grid">
						
										<c:choose>
											<c:when test="${not empty featuredItem.album.uploads && fn:length(featuredItem.album.uploads) >= 1}">
												<img alt="" src="<c:url value='/uploads/download?key=${featuredItem.album.uploads.iterator().next().keyIdentification}'/>" class="img-responsive">
											</c:when>
											<c:otherwise>
												<img alt="" src="<c:url value='/resources_1_9_5/img/team/img10-md.jpg'/>" class="img-responsive">
											</c:otherwise>
										</c:choose>
									
										
										<h3><a href="<c:url value='/albums/view/${featuredItem.album.id}/' />"><c:out value="${featuredItem.album.name}" /></a></h3>
										<ul class="blog-grid-info">
											<li><c:out value="${fn:length(featuredItem.album.uploads)} photos by ${featuredItem.profile.name}" /></li>
											<li><fmt:formatDate pattern="dd MMMM yy" value="${featuredItem.album.created}" /></li>
											<li><a href="#"><i class="fa fa-comments"></i> 0</a></li>
										</ul>
									</div>
								</div>
							</c:when>						
						</c:choose>
							
							
						
						
							
							
							<c:choose>
				
								<c:when test="${(countFeat+unit) == featuredSize}"></div></c:when>
								<c:otherwise>
									<c:if test="${(countFeat+unit)%noColumnsFeat==starter}"></div></c:if>
								</c:otherwise>
								
							</c:choose>
							<fmt:parseNumber var="countFeat" value="${countFeat + 1}" />
						
						</c:forEach>

						
					
				</div>
				<!-- End Blog Grid -->
				
				
				<!-- Blog Carousel Heading -->
				<div class="blog-cars-heading">
					<h2>Dossiers</h2>
					<div class="owl-navigation">
						<div class="customNavigation">
							<a class="owl-btn prev-v3"><i class="fa fa-angle-left"></i></a>
							<a class="owl-btn next-v3"><i class="fa fa-angle-right"></i></a>
						</div>
					</div><!--/navigation-->
				</div>
				<!-- End Blog Carousel Heading -->

				<!-- Blog Carousel -->
				<div class="blog-carousel margin-bottom-50">
					

					<c:forEach items="${dossiers}" var="dossier" >
						<!-- Blog Grid -->
						<div class="item">
							<div class="row">
								<div class="col-sm-5 sm-margin-bottom-20">
									<c:choose>
										<c:when test="${not empty dossier.uploads && fn:length(dossier.uploads) >= 1}">
											<img class="img-responsive" src="<c:url value='/uploads/download?key=${dossier.uploads.iterator().next().keyIdentification}'/>" alt="">
										</c:when>
										<c:otherwise>
											<img class="img-responsive" src="<c:url value='/resources_1_9_5/img/main/img22.jpg' />" alt="">
										</c:otherwise>
										
									</c:choose>
								
									
									</div>
								<div class="col-sm-7">
									<div class="blog-grid">
										<h3><a href="<c:url value='/dossiers/view/${dossier.id}/' />"><c:out value="${dossier.name}" /></a></h3>
										<ul class="blog-grid-info">
											<li></li>
											<li><fmt:formatDate pattern="dd MMMM yy" value="${dossier.created}" /></li>
											<li><a href="#"><i class="fa fa-comments"></i> 0</a></li>
										</ul>
										<p><c:out value='${dossier.description}' escapeXml="false"/></p>
										<a class="r-more" href="<c:url value='/dossiers/view/${dossier.id}/' />">Discover</a>
									</div>
								</div>
							</div>
						</div>
						<!-- End Blog Grid -->
					</c:forEach>

					
				</div>
				<!-- End Blog Carousel -->
				
				

				<!-- Blog Thumb v4 -->
				<div class="margin-bottom-50">
					<h2 class="title-v4">Weekly Plays</h2>
					
					<c:forEach items="${videoPlays}" var="featuredVideo">
					
					<c:choose>
				
						<c:when test="${count == starter}"><div class="row news-v2 margin-bottom-50"></c:when>
						<c:otherwise>
							<c:if test="${(count%noColumns)==starter}"><div class="row news-v2 margin-bottom-50"></c:if>
						</c:otherwise>
						
					</c:choose>
	
						<div class="col-sm-3 sm-margin-bottom-30">
							<div class="news-v2-badge">
							
								<div class="responsive-video">
									<iframe src="<c:out value='${featuredVideo.url}'/>" frameborder="0" allowfullscreen></iframe>
								</div>
								
								<p>
									<fmt:formatDate pattern="dd MMMM yyyy" value="${featuredVideo.created}" />
								</p>
							</div>
							
							<div class="news-v2-desc">
								<h3>
									<a href='<c:url value='/plays/view/${featuredVideo.id}/'/>'><c:out value="${featuredVideo.title}" /></a>
								</h3>
								<small>By <a href="<c:url value='/profile/${featuredVideo.playProfile.name}' />" ><c:out value="${featuredVideo.playProfile.name}" /></a> | In <a href="#"><c:out value="${featuredVideo.playType.name}" /></a></small>
							</div>
						
						</div>
						
						<c:choose>
				
							<c:when test="${(count+unit) == videosSize}"></div></c:when>
							<c:otherwise>
								<c:if test="${(count+unit)%noColumns==starter}"></div><!--/end row--></c:if>
							</c:otherwise>
							
						</c:choose>
			
				<fmt:parseNumber var="count" value="${count + 1}" />
					
					</c:forEach>
						
					
				</div>
				<!-- End Blog Thumb v4 -->

<fmt:parseNumber var="count" value="0"/>
<fmt:parseNumber var="noColumns" value="2"/>
				<div class="margin-bottom-50">
					<h2 class="title-v4">Albums</h2>
					<c:forEach items="${albums}" var="album">

					<c:if test="${count == starter || (count%noColumns)==starter}">
						<!-- Blog Grid -->
						<div class="row margin-bottom-50">
					</c:if>
					
					
					<div class="col-sm-6 sm-margin-bottom-50">
						<div class="blog-grid">
						
							<c:choose>
								<c:when test="${not empty album.uploads && fn:length(album.uploads) >= 1}">
									<img alt="" src="<c:url value='/uploads/download?key=${album.uploads.iterator().next().keyIdentification}'/>" class="img-responsive">
								</c:when>
								<c:otherwise>
									<img alt="" src="<c:url value='/resources_1_9_5/img/team/img10-md.jpg'/>" class="img-responsive">
								</c:otherwise>
							</c:choose>
						
							
							<h3><a href="<c:url value='/albums/view/${album.id}/' />"><c:out value="${album.name}" /></a></h3>
							<ul class="blog-grid-info">
								<li><c:out value="${fn:length(album.uploads)} photos by ${album.profileOwner.name}" /></li>
								<li><fmt:formatDate pattern="dd MMMM yy" value="${album.created}" /></li>
								<li><a href="#"><i class="fa fa-comments"></i> 0</a></li>
							</ul>
						</div>
					</div>
						
					<c:if test="${((count+unit) == albumsSize) || ((count+unit)%noColumns==starter)}">
						</div><!--/end row--><!-- End Blog Grid -->
					</c:if>
					<fmt:parseNumber var="count" value="${count + 1}" />
					</c:forEach>

				
				</div>
				

				<!-- Pager v4
				<ul class="pager pager-v4 md-margin-bottom-50">
					<li class="previous"><a class="rounded-3x" href="#">&larr; Older</a></li>
					<li class="page-amount">1 of 7</li>
					<li class="next"><a class="rounded-3x" href="#">Newer &rarr;</a></li>
				</ul>
				End Pager v4 -->