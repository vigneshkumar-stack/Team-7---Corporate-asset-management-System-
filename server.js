const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '.env') });

const errorHandler = require('./middleware/errorHandler');

// Import routes
const authRoutes = require('./routes/authRoutes');
const assetRoutes = require('./routes/assetRoutes');
const employeeRoutes = require('./routes/employeeRoutes');
const assignmentRoutes = require('./routes/assignmentRoutes');
const returnRoutes = require('./routes/returnRoutes');
const maintenanceRoutes = require('./routes/maintenanceRoutes');
const auditRoutes = require('./routes/auditRoutes');
const dashboardRoutes = require('./routes/dashboardRoutes');
const reportRoutes = require('./routes/reportRoutes');
const settingsRoutes = require('./routes/settingsRoutes');
const userRoutes = require('./routes/userRoutes');
const employeePortalRoutes = require('./routes/employeePortalRoutes');

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors({
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

if (process.env.NODE_ENV !== 'test') {
  app.use(morgan('dev'));
}

// Health Check API
app.get('/api/health', (req, res) => {
  res.json({
    status: 'online',
    timestamp: new Date().toISOString(),
    service: 'Corporate Asset Management System API',
    version: '1.0.0'
  });
});

// API Routes
app.use('/api/auth', authRoutes);
app.use('/api/assets', assetRoutes);
app.use('/api/employees', employeeRoutes);
app.use('/api/assignments', assignmentRoutes);
app.use('/api/returns', returnRoutes);
app.use('/api/maintenance', maintenanceRoutes);
app.use('/api/audit', auditRoutes);
app.use('/api/dashboard', dashboardRoutes);
app.use('/api/reports', reportRoutes);
app.use('/api/settings', settingsRoutes);
app.use('/api/users', userRoutes);
app.use('/api/employee', employeePortalRoutes);

// 404 Route handler
app.use((req, res, next) => {
  res.status(404).json({
    success: false,
    message: `API endpoint ${req.method} ${req.originalUrl} not found.`
  });
});

// Error handling middleware
app.use(errorHandler);

// Start server
const server = app.listen(PORT, () => {
  console.log(`=======================================================`);
  console.log(`Corporate Asset Management Server running on port ${PORT}`);
  console.log(`API Base URL: http://localhost:${PORT}/api`);
  console.log(`=======================================================`);
});

module.exports = app;
