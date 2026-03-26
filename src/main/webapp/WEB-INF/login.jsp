<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Gestion des Utilisateurs</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <h1>GESTION DES UTILISATEURS</h1>
        </div>
    </header>

    <main class="login-container">
        <div class="login-box">
            <h2>Connexion</h2>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="login" method="post">
                <div class="form-group">
                    <label for="login">Login</label>
                    <input type="text" id="login" name="login" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Mot de passe</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <button type="submit" class="btn-primary">Se connecter</button>
            </form>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>JEE © 2026</p>
        </div>
    </footer>
</body>
</html>