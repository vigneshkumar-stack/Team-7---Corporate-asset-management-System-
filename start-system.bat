@echo off
title Corporate Asset Management System Launcher
color 0b

echo ========================================================
echo   CORPORATE ASSET MANAGEMENT SYSTEM - FULL-STACK
echo ========================================================
echo.

echo [1/3] Checking MySQL database connectivity...
node -e "
const mysql = require('./backend/node_modules/mysql2/promise');
require('./backend/node_modules/dotenv').config({ path: './backend/.env' });
(async () => {
  try {
    const conn = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '@sathish20608',
      database: 'corporate_asset_management'
    });
    console.log('✓ Connected to MySQL database successfully!');
    await conn.end();
  } catch (err) {
    console.log('Notice: Running database initialization...');
    require('child_process').execSync('node scripts/initDb.js', { cwd: './backend', stdio: 'inherit' });
  }
})();
"

echo.
echo [2/3] Starting Backend API Server (Port 5000)...
start "Asset Management Backend" cmd /k "cd backend && npm run dev"

echo.
echo [3/3] Starting Frontend React Application (Port 3000)...
start "Asset Management Frontend" cmd /k "cd frontend && npm run dev"

echo.
echo ========================================================
echo   Both services are launching in separate windows!
echo   Frontend URL: http://localhost:3000
echo   Backend API:  http://localhost:5000/api
echo.
echo   Sample Credentials:
echo     Admin:    admin@corporate.com    / Admin@123
echo     IT Staff: itstaff@corporate.com  / Staff@123
echo     Employee: employee@corporate.com / User@123
echo ========================================================
echo.

timeout /t 3 >nul
start http://localhost:3000
