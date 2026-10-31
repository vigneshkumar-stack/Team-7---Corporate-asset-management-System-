-- ========================================================
-- CORPORATE ASSET MANAGEMENT SYSTEM - DATABASE SCHEMA
-- Database: corporate_asset_management
-- Engine: InnoDB, Charset: utf8mb4
-- ========================================================

CREATE DATABASE IF NOT EXISTS `corporate_asset_management`
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `corporate_asset_management`;

-- Disable foreign key checks for clean recreation if needed
SET FOREIGN_KEY_CHECKS = 0;

-- 1. USERS TABLE (System administrators, IT staff, and employees for system login)
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `role` ENUM('admin', 'it_staff', 'employee') NOT NULL DEFAULT 'employee',
  `phone` VARCHAR(25) NULL,
  `department` VARCHAR(100) NULL,
  `avatar_url` VARCHAR(255) NULL,
  `status` ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `idx_users_role` (`role`),
  INDEX `idx_users_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. EMPLOYEES TABLE (Staff members to whom assets are allocated)
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `employee_code` VARCHAR(50) NOT NULL UNIQUE,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NOT NULL UNIQUE,
  `phone` VARCHAR(25) NOT NULL,
  `department` VARCHAR(100) NOT NULL,
  `designation` VARCHAR(100) NOT NULL,
  `joining_date` DATE NOT NULL,
  `status` ENUM('Active', 'Inactive', 'On Leave') NOT NULL DEFAULT 'Active',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `idx_employees_code` (`employee_code`),
  INDEX `idx_employees_department` (`department`),
  INDEX `idx_employees_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. ASSETS TABLE
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `asset_code` VARCHAR(50) NOT NULL UNIQUE,
  `name` VARCHAR(150) NOT NULL,
  `category` ENUM(
    'Laptop',
    'Desktop',
    'Mobile Phone',
    'Vehicle',
    'Printer',
    'Networking Equipment',
    'Office Equipment',
    'Other'
  ) NOT NULL DEFAULT 'Laptop',
  `brand` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  `serial_number` VARCHAR(100) NOT NULL UNIQUE,
  `purchase_date` DATE NOT NULL,
  `purchase_cost` DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
  `warranty_expiry_date` DATE NULL,
  `location` VARCHAR(150) NOT NULL DEFAULT 'HQ - Floor 1',
  `status` ENUM(
    'Available',
    'Assigned',
    'Under Maintenance',
    'Retired'
  ) NOT NULL DEFAULT 'Available',
  `description` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `idx_assets_code` (`asset_code`),
  INDEX `idx_assets_category` (`category`),
  INDEX `idx_assets_status` (`status`),
  INDEX `idx_assets_serial` (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. ASSIGNMENTS TABLE
DROP TABLE IF EXISTS `assignments`;
CREATE TABLE `assignments` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `assignment_code` VARCHAR(50) NOT NULL UNIQUE,
  `asset_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `assigned_by` INT NOT NULL,
  `assignment_date` DATE NOT NULL,
  `expected_return_date` DATE NULL,
  `actual_return_date` DATE NULL,
  `notes` TEXT NULL,
  `status` ENUM('Active', 'Returned') NOT NULL DEFAULT 'Active',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `fk_assign_asset` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_assign_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_assign_user` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  INDEX `idx_assign_asset` (`asset_id`),
  INDEX `idx_assign_employee` (`employee_id`),
  INDEX `idx_assign_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. RETURNS TABLE
DROP TABLE IF EXISTS `returns`;
CREATE TABLE `returns` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `assignment_id` INT NOT NULL,
  `asset_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `received_by` INT NOT NULL,
  `return_date` DATE NOT NULL,
  `asset_condition` ENUM('Excellent', 'Good', 'Fair', 'Damaged') NOT NULL DEFAULT 'Good',
  `damage_details` TEXT NULL,
  `notes` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_return_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_return_asset` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_return_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_return_user` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  INDEX `idx_return_asset` (`asset_id`),
  INDEX `idx_return_employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. MAINTENANCE TABLE
DROP TABLE IF EXISTS `maintenance`;
CREATE TABLE `maintenance` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `maintenance_code` VARCHAR(50) NOT NULL UNIQUE,
  `asset_id` INT NOT NULL,
  `reported_by` INT NULL,
  `assigned_technician` VARCHAR(100) NOT NULL,
  `problem_description` TEXT NOT NULL,
  `reported_date` DATE NOT NULL,
  `maintenance_date` DATE NULL,
  `repair_cost` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
  `status` ENUM('Pending', 'In Progress', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Pending',
  `completion_date` DATE NULL,
  `resolution_notes` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `fk_maint_asset` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_maint_user` FOREIGN KEY (`reported_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  INDEX `idx_maint_asset` (`asset_id`),
  INDEX `idx_maint_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. AUDIT LOGS TABLE
DROP TABLE IF EXISTS `audit_logs`;
CREATE TABLE `audit_logs` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `activity_type` VARCHAR(100) NOT NULL,
  `asset_id` INT NULL,
  `employee_id` INT NULL,
  `performed_by` INT NULL,
  `performed_by_name` VARCHAR(100) NOT NULL DEFAULT 'System',
  `details` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_audit_asset` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_audit_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_audit_user` FOREIGN KEY (`performed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  INDEX `idx_audit_activity` (`activity_type`),
  INDEX `idx_audit_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8. COMPANY SETTINGS TABLE
DROP TABLE IF EXISTS `company_settings`;
CREATE TABLE `company_settings` (
  `id` INT PRIMARY KEY DEFAULT 1,
  `company_name` VARCHAR(150) NOT NULL DEFAULT 'Enterprise Corp Global',
  `email` VARCHAR(150) NOT NULL DEFAULT 'contact@enterprisecorp.com',
  `phone` VARCHAR(50) NOT NULL DEFAULT '+1 (555) 019-2834',
  `address` VARCHAR(255) NOT NULL DEFAULT '100 Enterprise Way, Suite 400, Tech City, CA',
  `currency` VARCHAR(10) NOT NULL DEFAULT 'USD',
  `asset_prefix` VARCHAR(10) NOT NULL DEFAULT 'AST',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
