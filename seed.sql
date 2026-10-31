-- ========================================================
-- CORPORATE ASSET MANAGEMENT SYSTEM - SEED DATA
-- ========================================================

USE `corporate_asset_management`;

-- 1. USERS SEED DATA
INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `phone`, `department`, `avatar_url`, `status`) VALUES
(1, 'Alex Mitchell (Admin)', 'admin@corporate.com', '$2a$10$uOKUDwmCFic8KPW0mhMGL.UiMqebnjvzkGeSQKU7K./tHa.uosVKK', 'admin', '+1 (555) 101-2001', 'Executive Management', 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150', 'active'),
(2, 'Sarah Jenkins (IT Specialist)', 'itstaff@corporate.com', '$2a$10$cdTOBlHa/AXQRazNrPP/WuZHWQcj66qc/ExQGmprawBFXFVi/40cK', 'it_staff', '+1 (555) 101-2002', 'Information Technology', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150', 'active'),
(3, 'David Chen (Associate)', 'employee@corporate.com', '$2a$10$23HVqyYR0hJyuDS9y/vDOurqKZkHa5i5RG61iaxRvpX2Le5KmgK0i', 'employee', '+1 (555) 101-2003', 'Software Engineering', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150', 'active')
ON DUPLICATE KEY UPDATE `name`=VALUES(`name`);

-- 2. EMPLOYEES SEED DATA
INSERT INTO `employees` (`id`, `employee_code`, `name`, `email`, `phone`, `department`, `designation`, `joining_date`, `status`) VALUES
(1, 'EMP-1001', 'David Chen', 'employee@corporate.com', '+1 (555) 234-5678', 'Engineering', 'Senior Full Stack Engineer', '2023-02-15', 'Active'),
(2, 'EMP-1002', 'Elena Rostova', 'elena.rostova@corporate.com', '+1 (555) 345-6789', 'Product Design', 'Lead UX/UI Designer', '2022-08-10', 'Active'),
(3, 'EMP-1003', 'Marcus Vance', 'marcus.vance@corporate.com', '+1 (555) 456-7890', 'DevOps & Cloud', 'Principal Infrastructure Architect', '2021-11-01', 'Active'),
(4, 'EMP-1004', 'Priya Sharma', 'priya.sharma@corporate.com', '+1 (555) 567-8901', 'Finance', 'Senior Financial Analyst', '2023-05-20', 'Active'),
(5, 'EMP-1005', 'Liam Gallagher', 'liam.g@corporate.com', '+1 (555) 678-9012', 'Operations', 'Global Supply Chain Specialist', '2022-01-14', 'Active'),
(6, 'EMP-1006', 'Amina Idris', 'amina.idris@corporate.com', '+1 (555) 789-0123', 'Human Resources', 'People Operations Director', '2020-06-01', 'Active'),
(7, 'EMP-1007', 'Carlos Mendez', 'carlos.m@corporate.com', '+1 (555) 890-1234', 'Sales & Marketing', 'Enterprise Account Executive', '2023-09-18', 'Active'),
(8, 'EMP-1008', 'Samantha Ray', 'samantha.ray@corporate.com', '+1 (555) 901-2345', 'Legal & Compliance', 'Corporate Legal Counsel', '2022-04-05', 'On Leave')
ON DUPLICATE KEY UPDATE `name`=VALUES(`name`);

-- 3. ASSETS SEED DATA
INSERT INTO `assets` (`id`, `asset_code`, `name`, `category`, `brand`, `model`, `serial_number`, `purchase_date`, `purchase_cost`, `warranty_expiry_date`, `location`, `status`, `description`) VALUES
(1, 'AST-1001', 'MacBook Pro 16" M3 Max', 'Laptop', 'Apple', 'MacBook Pro 16 36GB/1TB', 'APL-MBP16-2024-001', '2024-01-10', 3499.00, '2027-01-10', 'HQ - Floor 3 (Engineering)', 'Assigned', 'High performance workstation laptop for senior engineering staff'),
(2, 'AST-1002', 'Dell XPS 15 9530', 'Laptop', 'Dell', 'XPS 15 OLED i9/32GB/1TB', 'DLL-XPS15-2023-441', '2023-06-15', 2399.00, '2026-06-15', 'HQ - Floor 2 (Design)', 'Assigned', 'OLED 3.5K touch screen laptop for Lead UI/UX designer'),
(3, 'AST-1003', 'ThinkPad P1 Gen 6', 'Laptop', 'Lenovo', 'ThinkPad P1 RTX 4080', 'LNV-P1G6-2023-882', '2023-09-01', 2899.00, '2026-09-01', 'HQ - Server Room / IT Lab', 'Assigned', 'Mobile workstation for infrastructure and cloud management'),
(4, 'AST-1004', 'MacBook Air 15" M2', 'Laptop', 'Apple', 'MacBook Air 15 16GB/512GB', 'APL-MBA15-2023-119', '2023-10-12', 1499.00, '2025-10-12', 'HQ - Floor 4 (Finance)', 'Assigned', 'Portable lightweight laptop for financial modeling'),
(5, 'AST-1005', 'HP Elite Dragonfly G4', 'Laptop', 'HP', 'Elite Dragonfly 13.5"', 'HP-EDG4-2024-053', '2024-02-05', 1850.00, '2027-02-05', 'IT Inventory Storage', 'Available', 'Ready for immediate deployment to incoming executives'),
(6, 'AST-1006', 'Precision 5820 Tower Workstation', 'Desktop', 'Dell', 'Precision 5820 Xeon 64GB', 'DLL-P5820-2022-902', '2022-04-18', 4100.00, '2025-04-18', 'HQ - Floor 3 (Engineering)', 'Available', 'High performance AI/ML compute workstation'),
(7, 'AST-1007', 'Apple Mac Studio M2 Ultra', 'Desktop', 'Apple', 'Mac Studio 64GB/2TB', 'APL-MCS-2023-718', '2023-07-22', 3999.00, '2026-07-22', 'HQ - Studio Media Room', 'Assigned', 'Video rendering and marketing media workstation'),
(8, 'AST-1008', 'iPhone 15 Pro 256GB', 'Mobile Phone', 'Apple', 'iPhone 15 Pro Titanium', 'APL-IP15P-2023-931', '2023-11-05', 1099.00, '2025-11-05', 'HQ - Sales Department', 'Assigned', 'Company cellular device for Enterprise Account Executive'),
(9, 'AST-1009', 'Samsung Galaxy S24 Ultra', 'Mobile Phone', 'Samsung', 'Galaxy S24 Ultra 512GB', 'SMG-S24U-2024-301', '2024-03-01', 1299.00, '2026-03-01', 'IT Secure Vault', 'Available', 'Executive backup phone with Knox enterprise security'),
(10, 'AST-1010', 'Ford Transit 350 Logistics Van', 'Vehicle', 'Ford', 'Transit Cargo Van 350', 'FRD-TRN350-VIN98214', '2021-05-10', 42500.00, '2026-05-10', 'Corporate Logistics Bay', 'Assigned', 'Fleet cargo van for hardware deliveries and equipment transit'),
(11, 'AST-1011', 'Toyota RAV4 Hybrid Company Car', 'Vehicle', 'Toyota', 'RAV4 Hybrid XLE', 'TYT-RAV4H-VIN44312', '2022-09-14', 33500.00, '2027-09-14', 'Corporate Parking Lot #14', 'Under Maintenance', 'Company travel car scheduled for brake overhaul and inspection'),
(12, 'AST-1012', 'HP Color LaserJet Enterprise M555dn', 'Printer', 'HP', 'Color LaserJet M555dn', 'HP-CLJ555-2022-108', '2022-03-12', 1199.00, '2025-03-12', 'HQ - Floor 2 Copier Room', 'Available', 'Heavy duty departmental duplex network color printer'),
(13, 'AST-1013', 'Canon imageRUNNER ADVANCE DX', 'Printer', 'Canon', 'C3835i Multi-Function', 'CNN-IRDX-2021-084', '2021-08-30', 5800.00, '2024-08-30', 'HQ - Floor 1 Print Station', 'Under Maintenance', 'Paper feed sensor alignment issue reported'),
(14, 'AST-1014', 'Cisco Catalyst 9300 48-Port Switch', 'Networking Equipment', 'Cisco', 'C9300-48P PoE+', 'CSCO-C9300-2022-771', '2022-01-25', 5400.00, '2027-01-25', 'HQ - Data Center Rack 2', 'Assigned', 'Core network access switch for building floors 1-3'),
(15, 'AST-1015', 'UniFi Dream Machine Pro & AP Pack', 'Networking Equipment', 'Ubiquiti', 'UDM-Pro + 4x U6-Enterprise', 'UBQ-UDMP-2023-229', '2023-05-08', 2150.00, '2026-05-08', 'Branch Office - Server Room', 'Assigned', 'Complete enterprise gateway & WiFi infrastructure for branch'),
(16, 'AST-1016', 'Dell UltraSharp 32 4K USB-C Hub Monitor', 'Office Equipment', 'Dell', 'U3223QE 4K IPS Black', 'DLL-U3223-2023-904', '2023-04-14', 899.00, '2026-04-14', 'HQ - Floor 2 (Design)', 'Assigned', 'Color accurate monitor with 90W PD charging for design lead'),
(17, 'AST-1017', 'Herman Miller Aeron Chair Size B', 'Office Equipment', 'Herman Miller', 'Aeron Graphite Fully Loaded', 'HM-AERB-2022-550', '2022-06-20', 1450.00, '2034-06-20', 'Executive Suite 401', 'Available', 'Ergonomic high-end executive chair with posture-fit SL'),
(18, 'AST-1018', 'Logitech Rally Plus 4K Video Conference', 'Other', 'Logitech', 'Rally Plus Dual Speaker/Mic', 'LOGI-RLYP-2023-662', '2023-03-10', 2999.00, '2026-03-10', 'Boardroom A (Main Floor)', 'Available', 'Ultra-HD conference room audio/video conferencing system'),
(19, 'AST-1019', 'APC Smart-UPS RT 5000VA On-Line', 'Other', 'APC Schneider', 'SURTD5000XLI 230V', 'APC-UPS5K-2020-410', '2020-02-15', 3850.00, '2023-02-15', 'Old Storage Warehouse', 'Retired', 'Decommissioned after 4 years continuous service, batteries recycled'),
(20, 'AST-1020', 'Lenovo ThinkPad T14 Gen 4', 'Laptop', 'Lenovo', 'ThinkPad T14 i7/16GB/512GB', 'LNV-T14G4-2024-118', '2024-04-02', 1550.00, '2027-04-02', 'IT Inventory Storage', 'Available', 'Standard corporate employee workstation laptop')
ON DUPLICATE KEY UPDATE `name`=VALUES(`name`);

-- 4. ASSIGNMENTS SEED DATA
INSERT INTO `assignments` (`id`, `assignment_code`, `asset_id`, `employee_id`, `assigned_by`, `assignment_date`, `expected_return_date`, `actual_return_date`, `notes`, `status`) VALUES
(1, 'ASN-2024-001', 1, 1, 1, '2024-01-15', '2025-01-15', NULL, 'Allocated upon project kick-off with enterprise security profile installed.', 'Active'),
(2, 'ASN-2024-002', 2, 2, 2, '2023-08-15', '2024-08-15', NULL, 'Assigned with Adobe Creative Cloud master suite credentials.', 'Active'),
(3, 'ASN-2024-003', 3, 3, 1, '2023-09-05', '2024-12-31', NULL, 'Assigned with hardware YubiKey and encrypted volume.', 'Active'),
(4, 'ASN-2024-004', 4, 4, 2, '2023-10-15', '2024-10-15', NULL, 'Assigned for financial audits, VPN client configured.', 'Active'),
(5, 'ASN-2024-005', 7, 2, 1, '2023-08-01', '2024-12-01', NULL, 'Stationary workstation in Media Lab allocated for creative team.', 'Active'),
(6, 'ASN-2024-006', 8, 7, 2, '2023-11-10', '2025-11-10', NULL, 'Corporate phone plan with roaming enabled for sales travel.', 'Active'),
(7, 'ASN-2024-007', 10, 5, 1, '2023-06-01', '2025-06-01', NULL, 'Fleet vehicle driver agreement signed and safety verified.', 'Active'),
(8, 'ASN-2024-008', 16, 2, 2, '2023-08-15', '2024-08-15', NULL, 'Color-calibrated monitor mounted at Workstation 204.', 'Active'),
-- Historical completed assignments (Returned)
(9, 'ASN-2023-091', 5, 6, 2, '2023-01-10', '2024-01-10', '2024-01-08', 'Returned upon completion of international HR assignment.', 'Returned'),
(10, 'ASN-2023-092', 11, 7, 1, '2023-03-01', '2024-03-01', '2024-03-05', 'Returned for scheduled annual vehicle inspection and service.', 'Returned'),
(11, 'ASN-2023-093', 13, 1, 2, '2023-05-12', '2023-11-12', '2023-11-10', 'Returned temporary high-speed scanner after archival sprint.', 'Returned')
ON DUPLICATE KEY UPDATE `status`=VALUES(`status`);

-- 5. RETURNS SEED DATA
INSERT INTO `returns` (`id`, `assignment_id`, `asset_id`, `employee_id`, `received_by`, `return_date`, `asset_condition`, `damage_details`, `notes`) VALUES
(1, 9, 5, 6, 2, '2024-01-08', 'Excellent', NULL, 'Device was factory reset, tested for battery health, and placed back in available storage.'),
(2, 10, 11, 7, 1, '2024-03-05', 'Damaged', 'Front left brake disc squeal detected, minor scratch on front passenger bumper.', 'Transferred directly to maintenance bay for repair.'),
(3, 11, 13, 1, 2, '2023-11-10', 'Good', NULL, 'Cleaned and returned to central supply depot.')
ON DUPLICATE KEY UPDATE `asset_condition`=VALUES(`asset_condition`);

-- 6. MAINTENANCE SEED DATA
INSERT INTO `maintenance` (`id`, `maintenance_code`, `asset_id`, `reported_by`, `assigned_technician`, `problem_description`, `reported_date`, `maintenance_date`, `repair_cost`, `status`, `completion_date`, `resolution_notes`) VALUES
(1, 'MNT-2024-001', 11, 1, 'Apex Fleet Motors Inc.', 'Front brake pad wear and rotor replacement following corporate return inspection.', '2024-03-06', '2024-03-08', 450.00, 'In Progress', NULL, 'Parts ordered from OEM, awaiting delivery and rotor resurfacing.'),
(2, 'MNT-2024-002', 13, 2, 'Canon Authorized Field Tech', 'Internal optical pickup sensor misalignment causing intermittent tray 2 paper jams.', '2024-03-12', '2024-03-15', 180.00, 'Pending', NULL, 'Service request #CN-89412 logged with technician visit scheduled.'),
(3, 'MNT-2023-088', 1, 2, 'AppleCare Enterprise Support', 'Keyboard backlight flicker and trackpad tactile response inspection.', '2023-11-04', '2023-11-06', 0.00, 'Completed', '2023-11-07', 'Top case replaced under warranty with zero out-of-pocket cost. Diagnostic passed 100%.'),
(4, 'MNT-2023-042', 6, 2, 'Dell ProSupport Plus', 'Secondary NVMe SSD intermittent read timeout on heavy AI training loops.', '2023-06-18', '2023-06-20', 220.00, 'Completed', '2023-06-21', 'Replaced with new 2TB PCIe 4.0 SSD and cloned boot partition.')
ON DUPLICATE KEY UPDATE `status`=VALUES(`status`);

-- 7. AUDIT LOGS SEED DATA
INSERT INTO `audit_logs` (`id`, `activity_type`, `asset_id`, `employee_id`, `performed_by`, `performed_by_name`, `details`, `created_at`) VALUES
(1, 'Asset Created', 1, NULL, 1, 'Alex Mitchell', 'Added new high-performance MacBook Pro 16" (APL-MBP16-2024-001) to inventory.', '2024-01-10 09:30:00'),
(2, 'Asset Assigned', 1, 1, 1, 'Alex Mitchell', 'Assigned MacBook Pro 16" to David Chen (EMP-1001) for Engineering project.', '2024-01-15 10:15:00'),
(3, 'Asset Created', 2, NULL, 2, 'Sarah Jenkins', 'Added Dell XPS 15 9530 (DLL-XPS15-2023-441) with 3.5K OLED to inventory.', '2023-06-15 14:00:00'),
(4, 'Asset Assigned', 2, 2, 2, 'Sarah Jenkins', 'Assigned Dell XPS 15 to Elena Rostova (EMP-1002) for UX/UI Design.', '2023-08-15 11:20:00'),
(5, 'Asset Created', 10, NULL, 1, 'Alex Mitchell', 'Registered company logistics van Ford Transit 350.', '2021-05-10 16:45:00'),
(6, 'Asset Assigned', 10, 5, 1, 'Alex Mitchell', 'Assigned Ford Transit 350 to Liam Gallagher (EMP-1005) for logistics operations.', '2023-06-01 08:30:00'),
(7, 'Asset Returned', 5, 6, 2, 'Sarah Jenkins', 'Received HP Elite Dragonfly G4 return from Amina Idris (EMP-1006) in Excellent condition.', '2024-01-08 15:40:00'),
(8, 'Asset Returned', 11, 7, 1, 'Alex Mitchell', 'Received Toyota RAV4 Hybrid from Carlos Mendez (EMP-1007). Flagged brake condition as Damaged.', '2024-03-05 17:10:00'),
(9, 'Maintenance Started', 11, NULL, 1, 'Alex Mitchell', 'Created maintenance ticket MNT-2024-001 with Apex Fleet Motors for brake system repair.', '2024-03-06 09:00:00'),
(10, 'Maintenance Started', 13, NULL, 2, 'Sarah Jenkins', 'Created maintenance ticket MNT-2024-002 for Canon imageRUNNER optical sensor repair.', '2024-03-12 11:30:00'),
(11, 'Asset Created', 20, NULL, 2, 'Sarah Jenkins', 'Added new Lenovo ThinkPad T14 Gen 4 (LNV-T14G4-2024-118) to inventory.', '2024-04-02 10:00:00'),
(12, 'Employee Created', NULL, 1, 1, 'Alex Mitchell', 'Onboarded employee record for David Chen in Software Engineering.', '2023-02-15 09:00:00'),
(13, 'Employee Created', NULL, 2, 1, 'Alex Mitchell', 'Onboarded employee record for Elena Rostova in Product Design.', '2022-08-10 09:30:00'),
(14, 'User Login', NULL, NULL, 1, 'Alex Mitchell', 'Successful administrator authentication session started.', '2024-04-10 08:00:00')
ON DUPLICATE KEY UPDATE `details`=VALUES(`details`);

-- 8. COMPANY SETTINGS SEED DATA
INSERT INTO `company_settings` (`id`, `company_name`, `email`, `phone`, `address`, `currency`, `asset_prefix`) VALUES
(1, 'Nexus Enterprise Solutions', 'admin@nexus-enterprise.com', '+1 (800) 555-0199', '500 Technology Square, Silicon Center, CA 94025', 'USD', 'AST')
ON DUPLICATE KEY UPDATE `company_name`=VALUES(`company_name`);
