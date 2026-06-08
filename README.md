Personal Gaming Analytics & Progress Management System
DBS Semester Project

TECHNOLOGIES
Frontend: HTML + CSS
Backend: PHP
Database: MySQL
Local Server: XAMPP

PROJECT FILES
add_data.php       Page 1: Data entry forms for players, games, matches, and progress
view_stats.php     Page 2: Search, analytics, joins, aggregate statistics, and filtering
db_connect.php     MySQL database connection file
style.css          Frontend styling
sql/gaming_system.sql  Database schema and sample data

HOW TO RUN
1. Install XAMPP.
2. Start Apache and MySQL from XAMPP Control Panel.
3. Copy the full gaming-system folder into:
   C:\xampp\htdocs\
4. Open browser and go to:
   http://localhost/phpmyadmin
5. Click Import.
6. Select this file:
   gaming-system/sql/gaming_system.sql
7. Click Go.
8. Open the project:
   http://localhost/gaming-system/add_data.php
9. Add a player and game from Page 1.
10. Save an FPS match or story progress record.
11. Open:
    http://localhost/gaming-system/view_stats.php
12. Search player name such as Ali.
13. Select a game in Filter by Game section.

IMPORTANT CHECKS FOR VIVA
- Add Player proves INSERT into players table.
- Add Game proves INSERT into games table.
- Record FPS Match proves foreign key relationship with players and games.
- Update Story Progress proves insert/update logic.
- Search Player proves SELECT and WHERE.
- FPS Statistics proves COUNT, AVG, MAX.
- Filter by Game proves JOIN and GROUP BY.

