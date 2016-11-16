<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Modal -->
<div class="modal fade alert" id="monProfilModal" tabindex="-1"
	role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">x</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">Mon Profil</h3>
			</div>
			<div class="modal-body">
				<form id="modificationProfil" onsubmit="modifierPassword();">

					<div class="form-group">
						<label for="newPassword1">Nouveau mot de passe</label> <input
							type="password" class="form-control" id="newPassword1"
							placeholder="Nouveau mot de passe" name="newPassword1">
					</div>
					<div class="form-group">
						<label for="newPassword2">Confirmation</label> <input
							type="password" class="form-control" id="newPassword2"
							placeholder="Confirmer nouveau mot de passe" name="newPassword2">
					</div>
					<button type="submit" class="btn btn-primary center-block">Confirmer</button>
				</form>
				<div id="confirmationModificationProfil"
					class="alert alert-success hidden">
					<i class="fa fa-key fa-2x"></i>&nbsp; Vous avez bien modifié votre
					mot de passe
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade alert" id="parametresModal" tabindex="-1"
	role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">x</span><span class="sr-only">Close</span>
				</button>
				<h3 class="modal-title" id="lineModalLabel">Paramètres</h3>
			</div>
			<div class="modal-body">
				<form id="parametres" onsubmit="modifierNomChamp();">

					<div class="form-group">
						<h3 class="text-center" style="color: #006400">Modifier le
							nom d'un champ</h3>
						<fieldset class="form-group selectContainer">
							<label for="id_champ">Nom du champ</label> <select
								id="champSelection" class="form-control selectpicker"
								data-live-search="true" name="id_champ">

								<c:forEach var="champ" items="${listeChamps}">
									<option value="${champ.id_champ}">${champ.nom}</option>
								</c:forEach>
							</select>
						</fieldset>
					</div>

					<fieldset class="form-group">
						<label for="nouveauNomChamp">Nouveau nom du champ</label> <input
							type="text" class="form-control" id="nouveauNomChamp"
							placeholder="Nouveau nom du champ" name="nouveauNomChamp">
					</fieldset>
					<button type="submit" class="btn btn-primary center-block">Confirmer</button>
				</form>
				<div id="confirmationParametres" class="alert alert-success hidden">
					<i class="fa fa-leaf fa-2x"></i>&nbsp; Vous avez bien modifié le
					nom de votre champ
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a id="home" class="navbar-brand" href="accueil">Station Météo
			Connectée</a>
	</div>

	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">
		<!--
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-alerts">
				<li><a href="#"> <i class="fa fa-warning fa-fw"></i> Le
						champ X se déssèche <span class="pull-right text-muted small">Il
							y a 4 min</span>

				</a></li>
				<li class="divider"></li>
				<li><a href="#"> <i class="fa fa-warning fa-fw"></i> Le
						champ X ...<span class="pull-right text-muted small">Il y a
							16h</span>

				</a></li>
				<li class="divider"></li>
				<li><a class="text-center" href="#"> <strong>Voir
							toutes les alertes</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> 
	</li> -->
		<!-- /.dropdown-alerts -->
		<!-- /.dropdown -->
		<li class="dropdown pull-right"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<li data-toggle="modal" data-target="#monProfilModal"><a
					href="#"><i class="fa fa-user fa-fw"></i> Mon Profil</a></li>
				<li data-toggle="modal" data-target="#parametresModal"><a
					href="#"><i class="fa fa-gear fa-fw"></i> Paramètres</a></li>
				<li class="divider"></li>
				<li><a href="deconnexion"><i class="fa fa-sign-out fa-fw"></i>
						Déconnexion</a></li>
			</ul> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>


	<!-- /.navbar-top-links -->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">

				<li id="logo" class="sidebar-search">
					<div class="input-group custom-search-form">
						<img src="./img/logo.png" class="img-responsive" alt="Chouette">
					</div> <!-- /input-group -->
				</li>
				<li class="${param.pageSelectionnee == 'accueil' ? 'active' : ''}">
					<a href="accueil"><i class="fa fa-dashboard fa-fw"></i> Tableau
						de bord</a>
				</li>
				<li class="${param.pageSelectionnee == 'champs' ? 'active' : ''}">
					<a href="#"><i class="fa fa-leaf fa-fw"></i> Champs<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<c:forEach var="champ" items="${listeChamps}">
							<li><a href="champ?id=${champ.id_champ}">${champ.nom}</a></li>
						</c:forEach>
					</ul> <!-- /.nav-second-level -->
				</li>
				<li class="${param.pageSelectionnee == 'capteurs' ? 'active' : ''}">
					<a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Capteurs<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="capteur?type=température">Température</a></li>
						<li><a href="capteur?type=humidité">Humidité</a></li>
						<li><a href="capteur?type=vent">Vent</a></li>
					</ul> <!-- /.nav-second-level -->
				</li>
				<li
					class="${param.pageSelectionnee == 'statistiques' ? 'active' : ''}">
					<a href="statistiques"><i class="fa fa-pie-chart fa-fw"></i>
						Statistiques</a>
				</li>
				<li class="${param.pageSelectionnee == 'demandes' ? 'active' : ''}">
					<a href="demande"><i class="fa fa-edit fa-fw"></i> Demandes</a>
				</li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>
