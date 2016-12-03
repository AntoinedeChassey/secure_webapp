<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Navigation -->
<div class="btn-group" role="group">
	<button type="button" class="btn btn-primary" onclick="home();">
		<i class="fa fa-home fa-fw"></i> Home
	</button>
	<c:if test="${admin == true}">
		<button type="button" class="btn btn-warning"
			onclick="administration();">
			<i class="fa fa-gear fa-fw"></i> Administration
		</button>

		<button type="button" class="btn btn-success" onclick="addUser();">
			<i class="fa fa-user-plus fa-fw"></i> Add user
		</button>
	</c:if>
	<button type="button" class="btn btn-danger" onclick="logout();">
		<i class="fa fa-sign-out fa-fw"></i> Logout
	</button>
</div>
<div class="btn-group" role="group">
	<c:if test="${carre || admin}">
		<button type="button" class="btn btn-default" onclick="carre();">
			<i class="fa fa-square-o fa-fw"></i> Carre
		</button>
	</c:if>
	<c:if test="${cercle || admin}">
		<button type="button" class="btn btn-default" onclick="cercle();">
			<i class="fa fa-circle-thin fa-fw"></i> Cercle
		</button>
	</c:if>
</div>

<!-- Notifications -->
<div id="messageCallback" hidden=true>${messageCallback}</div>
