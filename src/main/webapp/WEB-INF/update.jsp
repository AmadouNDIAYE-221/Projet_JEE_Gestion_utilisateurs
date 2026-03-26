<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un utilisateur - Gestion des Utilisateurs</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<header>
    <div class="container">
        <h1>GESTION DES UTILISATEURS</h1>
    </div>
</header>

<main class="login-container">
    <div class="login-box">
        <h2>Modifier un utilisateur</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <%
            // ✅ CORRECTION 1 : récupérer l'utilisateur passé par le servlet
            User user = (User) request.getAttribute("user");
        %>

        <%-- ✅ CORRECTION 2 : action pointe vers /users/update (pas /users/add) --%>
        <form action="<%= request.getContextPath() %>/users/update" method="post">

            <%-- ✅ CORRECTION 3 : champ caché pour transmettre l'id --%>
            <input type="hidden" name="id" value="<%= user.getId() %>">

            <div class="form-group">
                <label for="nom">Nom</label>
                <%-- ✅ CORRECTION 4 : pré-remplissage des champs --%>
                <input type="text" id="nom" name="nom" value="<%= user.getNom() %>" required>
            </div>

            <div class="form-group">
                <label for="prenom">Prénom</label>
                <input type="text" id="prenom" name="prenom" value="<%= user.getPrenom() %>" required>
            </div>

            <div class="form-group">
                <label for="login">Login</label>
                <input type="text" id="login" name="login" value="<%= user.getLogin() %>" required>
            </div>

            
            <div class="form-group">
			    <label for="password">Mot de passe</label>
			    <input type="text" id="password" name="password" 
			           value="<%= user.getPassword() %>" required>
			</div>

            <%-- ✅ CORRECTION 5 : libellé du bouton cohérent avec l'action --%>
            <button type="submit" class="btn-primary">
                Modifier l'utilisateur
            </button>
        </form>

        <div style="margin-top:15px; text-align:center;">
            <a href="<%= request.getContextPath() %>/users/list">
                ← Retour à la liste des utilisateurs
            </a>
        </div>
    </div>
</main>

<footer>
    <div class="container">
        <p>JEE © 2026</p>
    </div>
</footer>

</body>
</html>