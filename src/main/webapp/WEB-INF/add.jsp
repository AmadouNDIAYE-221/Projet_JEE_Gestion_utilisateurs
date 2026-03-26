<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un utilisateur - Gestion des Utilisateurs</title>

    <!-- CSS avec contextPath (sécurisé) -->
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
        <h2>Ajouter un utilisateur</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/users/add" method="post">

            <div class="form-group">
                <label for="nom">Nom</label>
                <input type="text" id="nom" name="nom" required>
            </div>

            <div class="form-group">
                <label for="prenom">Prénom</label>
                <input type="text" id="prenom" name="prenom" required>
            </div>

            <div class="form-group">
                <label for="login">Login</label>
                <input type="text" id="login" name="login" required>
            </div>

            <div class="form-group">
                <label for="password">Mot de passe</label>
                <input type="password" id="password" name="password" required>
            </div>

            <button type="submit" class="btn-primary">
                Ajouter l'utilisateur
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
