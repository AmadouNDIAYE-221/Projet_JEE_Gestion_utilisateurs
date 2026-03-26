<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, models.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des utilisateurs - Gestion des Utilisateurs</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<header>
    <div class="container">
        <h1>GESTION DES UTILISATEURS</h1>
    </div>
</header>

<main class="login-container">
    <div class="login-box" style="width: 90%; max-width: 900px;">
        <h2>Liste des utilisateurs</h2>

        <div style="margin-bottom: 15px; text-align: right;">
            <a href="<%= request.getContextPath() %>/users/add" class="btn-primary">
                + Ajouter un utilisateur
            </a>
        </div>

        <%
            // ✅ CORRECTION 1 : cast correct, sans les underscores
            List<User> users = (List<User>) request.getAttribute("users");
            if (users == null || users.isEmpty()) {
        %>
            <p>Aucun utilisateur trouvé.</p>
        <%
            } else {
        %>

			<table style="width:100%; border-collapse: collapse;">
			    <thead>
			        <tr style="background-color:#f2f2f2;">
			            <th style="padding:10px; border:1px solid #ddd;">ID</th>
			            <th style="padding:10px; border:1px solid #ddd;">Nom</th>
			            <th style="padding:10px; border:1px solid #ddd;">Prénom</th>
			            <th style="padding:10px; border:1px solid #ddd;">Login</th>
			            <th style="padding:10px; border:1px solid #ddd;">Mot de passe</th>
			            <th style="padding:10px; border:1px solid #ddd;">Actions</th>
			        </tr>
			    </thead>
			    <tbody>
			        <% for (User u : users) { %>
			            <tr>
			                <td style="padding:10px; border:1px solid #ddd;"><%= u.getId() %></td>
			                <td style="padding:10px; border:1px solid #ddd;"><%= u.getNom() %></td>
			                <td style="padding:10px; border:1px solid #ddd;"><%= u.getPrenom() %></td>
			                <td style="padding:10px; border:1px solid #ddd;"><%= u.getLogin() %></td>
			                <td style="padding:10px; border:1px solid #ddd; max-width:200px; word-break: break-all;"><%= u.getPassword() %></td>
			                
							<td style="padding:10px; border:1px solid #ddd; text-align:center; white-space:nowrap;">
							    <a href="<%= request.getContextPath() %>/users/update?id=<%= u.getId() %>" style="text-decoration:none;">
							        ✏️ <span style="text-decoration:underline;">Modifier</span>
							    </a>
							    <!-- Séparation -->
							    &nbsp;|&nbsp;
							    
							    <a href="<%= request.getContextPath() %>/users/delete?id=<%= u.getId() %>"
							       onclick="return confirm('Supprimer cet utilisateur ?');"style="text-decoration:none;">
							        🗑️ <span style="text-decoration:underline;">Supprimer</span>
							    </a>
							</td>
			            </tr>
			        <% } %>
			    </tbody>
			</table>

        <% } %>

    </div>
</main>

<footer>
    <div class="container">
        <p>JEE © 2026</p>
    </div>
</footer>

</body>
</html>