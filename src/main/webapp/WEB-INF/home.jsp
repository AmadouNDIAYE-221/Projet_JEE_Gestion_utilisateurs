<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil - Gestion des Utilisateurs</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <h1>GESTION DES UTILISATEURS</h1>
        </div>
    </header>

    <nav class="navigation">
        <div class="container">
            <a href="#" class="active">Accueil</a>
            <a href="users/list">Lister</a>
            <a href="users/add">Ajouter</a>
            <a href="logout" class="logout-btn">Déconnexion</a>
        </div>
    </nav>

    <main class="container">
        <div class="welcome-section">
            <%
                User currentUser = (User) session.getAttribute("user");
                if (currentUser != null) {
            %>
                <h2>Bienvenue, <%= currentUser.getPrenom() %> <%= currentUser.getNom() %> !</h2>
            <% } else { %>
                <h2>Bienvenue !</h2>
            <% } %>
            
            <p>Système de gestion des utilisateurs</p>
            
            <div class="quick-actions">
                <a href="users/list" class="action-card">
                    <h3>📋 Lister les utilisateurs</h3>
                    <p>Voir tous les utilisateurs enregistrés</p>
                </a>
                
                <a href="users/add" class="action-card">
                    <h3>➕ Ajouter un utilisateur</h3>
                    <p>Créer un nouveau compte utilisateur</p>
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