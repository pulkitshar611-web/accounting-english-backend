-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2026 at 12:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accounting_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountgroup`
--

CREATE TABLE `accountgroup` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` enum('ASSETS','LIABILITIES','INCOME','EXPENSES','EQUITY') NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accountgroup`
--

INSERT INTO `accountgroup` (`id`, `name`, `type`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'Assets', 'ASSETS', 2, '2026-01-26 09:10:01.454', '2026-01-26 09:10:01.454'),
(2, 'Liabilities', 'LIABILITIES', 2, '2026-01-26 09:10:01.485', '2026-01-26 09:10:01.485'),
(3, 'Income', 'INCOME', 2, '2026-01-26 09:10:01.491', '2026-01-26 09:10:01.491'),
(4, 'Expenses', 'EXPENSES', 2, '2026-01-26 09:10:01.534', '2026-01-26 09:10:01.534'),
(5, 'Equity', 'EQUITY', 2, '2026-01-26 09:10:01.538', '2026-01-26 09:10:01.538');

-- --------------------------------------------------------

--
-- Table structure for table `accountsubgroup`
--

CREATE TABLE `accountsubgroup` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `groupId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accountsubgroup`
--

INSERT INTO `accountsubgroup` (`id`, `name`, `groupId`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'Cash', 1, 2, '2026-01-26 09:10:01.547', '2026-01-26 09:10:01.547'),
(2, 'Bank', 1, 2, '2026-01-26 09:10:01.553', '2026-01-26 09:10:01.553'),
(3, 'Accounts Receivable', 1, 2, '2026-01-26 09:10:01.560', '2026-01-26 09:10:01.560'),
(4, 'Accounts Payable', 2, 2, '2026-01-26 09:10:01.563', '2026-01-26 09:10:01.563'),
(5, 'Sales Income', 3, 2, '2026-01-26 09:10:01.567', '2026-01-26 09:10:01.567'),
(6, 'Service Income', 3, 2, '2026-01-26 09:10:01.570', '2026-01-26 09:10:01.570'),
(7, 'Other Income', 3, 2, '2026-01-26 09:10:01.574', '2026-01-26 09:10:01.574'),
(8, 'Direct Expenses', 4, 2, '2026-01-26 09:10:01.576', '2026-01-26 09:10:01.576'),
(9, 'Indirect Expenses', 4, 2, '2026-01-26 09:10:01.578', '2026-01-26 09:10:01.578'),
(12, 'Purchase Accounts', 4, 2, '2026-01-26 12:45:03.353', '2026-01-26 12:45:03.353');

-- --------------------------------------------------------

--
-- Table structure for table `bankaccount`
--

CREATE TABLE `bankaccount` (
  `id` int(11) NOT NULL,
  `accountName` varchar(191) NOT NULL,
  `accountNumber` varchar(191) NOT NULL,
  `bankName` varchar(191) NOT NULL,
  `branchName` varchar(191) DEFAULT NULL,
  `ifscCode` varchar(191) DEFAULT NULL,
  `openingBalance` double NOT NULL DEFAULT 0,
  `currentBalance` double NOT NULL DEFAULT 0,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banktransaction`
--

CREATE TABLE `banktransaction` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `bankAccountId` int(11) NOT NULL,
  `transactionType` enum('DEPOSIT','WITHDRAWAL','TRANSFER') NOT NULL,
  `amount` double NOT NULL,
  `description` text DEFAULT NULL,
  `referenceNumber` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'Mobile', 2, '2026-01-26 09:22:05.568', '2026-01-26 09:22:05.568'),
(2, 'Laptop', 2, '2026-01-26 09:24:37.613', '2026-01-26 09:24:37.613'),
(3, 'Clothes', 2, '2026-01-26 09:25:41.601', '2026-01-26 09:25:41.601');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `logo` longtext DEFAULT NULL,
  `startDate` datetime(3) DEFAULT NULL,
  `endDate` datetime(3) DEFAULT NULL,
  `invoiceTemplate` varchar(191) NOT NULL DEFAULT 'New York',
  `invoiceColor` varchar(191) NOT NULL DEFAULT '#000000',
  `showQrCode` tinyint(1) NOT NULL DEFAULT 1,
  `invoiceLogo` longtext DEFAULT NULL,
  `planName` varchar(191) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL,
  `planType` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `currency` varchar(191) DEFAULT 'USD',
  `bankName` varchar(191) DEFAULT NULL,
  `accountHolder` varchar(191) DEFAULT NULL,
  `accountNumber` varchar(191) DEFAULT NULL,
  `ifsc` varchar(191) DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `inventoryConfig` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`inventoryConfig`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `email`, `logo`, `startDate`, `endDate`, `invoiceTemplate`, `invoiceColor`, `showQrCode`, `invoiceLogo`, `planName`, `planId`, `planType`, `phone`, `website`, `address`, `city`, `state`, `zip`, `country`, `currency`, `bankName`, `accountHolder`, `accountNumber`, `ifsc`, `terms`, `notes`, `createdAt`, `updatedAt`, `inventoryConfig`) VALUES
(2, 'Tech Solutions Ltd.', 'company@gmail.com', 'https://res.cloudinary.com/dw48hcxi5/image/upload/v1769429256/company_logos/xqrh1msogmhlkbnlxdsl.jpg', NULL, NULL, 'New York', '#84cc16', 1, NULL, NULL, NULL, NULL, '1234567890', 'zirakboo.com', '123 Business St', 'indore', 'Madhya Pradesh', '4514465', 'India', 'GBP', 'HDFC', 'zirakbook', '964554354684', 'HDFC4512', 'By accessing or using this accounting software, you agree to comply with these terms and conditions. Users are responsible for maintaining the confidentiality of their account credentials and all activities performed under their account. The software provider shall not be held liable for any financial loss, data loss, or business interruption caused by incorrect data entry, system misuse, or temporary service unavailability due to maintenance or technical issues. While reasonable security measures are implemented to protect user data, absolute security cannot be guaranteed. Continued use of the software indicates acceptance of any updates or changes to these terms in accordance with applicable laws.', 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-26 09:08:39.493', '2026-01-29 11:14:52.711', '{\"reserveOnQuotation\":true,\"reserveOnSO\":true,\"challanAction\":\"ISSUE\"}');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `nameArabic` varchar(191) DEFAULT NULL,
  `companyName` varchar(191) DEFAULT NULL,
  `companyLocation` text DEFAULT NULL,
  `profileImage` longtext DEFAULT NULL,
  `anyFile` longtext DEFAULT NULL,
  `accountType` varchar(191) DEFAULT NULL,
  `balanceType` varchar(191) NOT NULL DEFAULT 'Debit',
  `accountName` varchar(191) DEFAULT NULL,
  `accountBalance` double NOT NULL DEFAULT 0,
  `creationDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `bankAccountNumber` varchar(191) DEFAULT NULL,
  `bankIFSC` varchar(191) DEFAULT NULL,
  `bankNameBranch` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `creditPeriod` int(11) DEFAULT NULL,
  `gstNumber` varchar(191) DEFAULT NULL,
  `gstEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `billingName` varchar(191) DEFAULT NULL,
  `billingPhone` varchar(191) DEFAULT NULL,
  `billingAddress` text DEFAULT NULL,
  `billingCity` varchar(191) DEFAULT NULL,
  `billingState` varchar(191) DEFAULT NULL,
  `billingCountry` varchar(191) DEFAULT NULL,
  `billingZipCode` varchar(191) DEFAULT NULL,
  `shippingSameAsBilling` tinyint(1) NOT NULL DEFAULT 0,
  `shippingName` varchar(191) DEFAULT NULL,
  `shippingPhone` varchar(191) DEFAULT NULL,
  `shippingAddress` text DEFAULT NULL,
  `shippingCity` varchar(191) DEFAULT NULL,
  `shippingState` varchar(191) DEFAULT NULL,
  `shippingCountry` varchar(191) DEFAULT NULL,
  `shippingZipCode` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `ledgerId` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `nameArabic`, `companyName`, `companyLocation`, `profileImage`, `anyFile`, `accountType`, `balanceType`, `accountName`, `accountBalance`, `creationDate`, `bankAccountNumber`, `bankIFSC`, `bankNameBranch`, `phone`, `email`, `creditPeriod`, `gstNumber`, `gstEnabled`, `billingName`, `billingPhone`, `billingAddress`, `billingCity`, `billingState`, `billingCountry`, `billingZipCode`, `shippingSameAsBilling`, `shippingName`, `shippingPhone`, `shippingAddress`, `shippingCity`, `shippingState`, `shippingCountry`, `shippingZipCode`, `companyId`, `ledgerId`, `createdAt`, `updatedAt`) VALUES
(1, 'Rahul', 'Rahul', 'Rahul', 'indore', '', '', '', 'Debit', 'Rahul', 1452000, '2026-01-26 00:00:00.000', 'BOI', 'BOI4152', 'BOI', '94564566678', 'rahul@gmail.com', 12, '54614646', 1, 'indore', '94564566678', 'indore', 'indore', 'Madhya Pradesh', 'India', '4514465', 1, 'indore', '94564566678', 'indore', 'indore', 'Madhya Pradesh', 'India', '4514465', 2, 7, '2026-01-26 09:17:26.578', '2026-01-26 09:17:26.578'),
(2, 'Jay', 'Jay', 'jay', 'indore', '', '', '', 'Debit', 'jay', 520000, '2026-01-26 00:00:00.000', 'BOB', 'BOB1234', 'BOB', '5244564566678', 'jay@gmail.com', 10, '976856345', 1, 'indore', '94564566678', 'indore', 'indore', 'Madhya Pradesh', 'India', '4514465', 1, 'indore', '94564566678', 'indore', 'indore', 'Madhya Pradesh', 'India', '4514465', 2, 8, '2026-01-26 09:18:12.073', '2026-01-26 09:18:12.073');

-- --------------------------------------------------------

--
-- Table structure for table `dashboardannouncement`
--

CREATE TABLE `dashboardannouncement` (
  `id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Active',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliverychallan`
--

CREATE TABLE `deliverychallan` (
  `id` int(11) NOT NULL,
  `challanNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `customerId` int(11) NOT NULL,
  `salesOrderId` int(11) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('PENDING','DELIVERED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `shippingAddress` text DEFAULT NULL,
  `shippingCity` varchar(191) DEFAULT NULL,
  `shippingEmail` varchar(191) DEFAULT NULL,
  `shippingPhone` varchar(191) DEFAULT NULL,
  `shippingState` varchar(191) DEFAULT NULL,
  `shippingZipCode` varchar(191) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `transportNote` text DEFAULT NULL,
  `vehicleNo` varchar(191) DEFAULT NULL,
  `carrier` varchar(191) DEFAULT NULL,
  `manualReference` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliverychallan`
--

INSERT INTO `deliverychallan` (`id`, `challanNumber`, `date`, `customerId`, `salesOrderId`, `companyId`, `notes`, `status`, `createdAt`, `updatedAt`, `shippingAddress`, `shippingCity`, `shippingEmail`, `shippingPhone`, `shippingState`, `shippingZipCode`, `remarks`, `transportNote`, `vehicleNo`, `carrier`, `manualReference`) VALUES
(3, 'DC-1769433203831', '2026-01-26 00:00:00.000', 2, NULL, 2, NULL, 'DELIVERED', '2026-01-26 13:13:23.856', '2026-01-29 06:53:36.122', 'indore', 'indore', 'jay@gmail.com', '5244564566678', 'Madhya Pradesh', '4514465', NULL, NULL, NULL, NULL, NULL),
(5, 'DC-33405195', '2026-01-27 00:00:00.000', 1, 2, 2, NULL, 'DELIVERED', '2026-01-27 06:47:25.947', '2026-01-29 06:51:39.131', 'indore', 'indore', 'rahul@gmail.com', '94564566678', 'Madhya Pradesh', '4514465', 'By accessing or using this accounting software, you agree to comply with these terms and conditions. Users are responsible for maintaining the confidentiality of their account credentials and all activities performed under their account. The software provider shall not be held liable for any financial loss, data loss, or business interruption caused by incorrect data entry, system misuse, or temporary service unavailability due to maintenance or technical issues. While reasonable security measures are implemented to protect user data, absolute security cannot be guaranteed. Continued use of the software indicates acceptance of any updates or changes to these terms in accordance with applicable laws.', 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '98819604631', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deliverychallanitem`
--

CREATE TABLE `deliverychallanitem` (
  `id` int(11) NOT NULL,
  `challanId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliverychallanitem`
--

INSERT INTO `deliverychallanitem` (`id`, `challanId`, `productId`, `warehouseId`, `quantity`, `createdAt`, `updatedAt`, `description`) VALUES
(3, 3, 3, 2, 10, '2026-01-26 13:13:23.856', '2026-01-26 13:13:23.856', 'Clothes'),
(5, 5, 1, 2, 5, '2026-01-27 06:47:25.947', '2026-01-27 06:47:25.947', 'IPhone 17 Pro Max');

-- --------------------------------------------------------

--
-- Table structure for table `expenseentry`
--

CREATE TABLE `expenseentry` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `expenseType` enum('DIRECT','INDIRECT') NOT NULL,
  `amount` double NOT NULL,
  `paymentMode` enum('CASH','BANK','CARD','UPI','CHEQUE','OTHER') NOT NULL,
  `description` text DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goodsreceiptnote`
--

CREATE TABLE `goodsreceiptnote` (
  `id` int(11) NOT NULL,
  `grnNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `vendorId` int(11) NOT NULL,
  `purchaseOrderId` int(11) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Received',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goodsreceiptnote`
--

INSERT INTO `goodsreceiptnote` (`id`, `grnNumber`, `date`, `vendorId`, `purchaseOrderId`, `companyId`, `notes`, `status`, `createdAt`, `updatedAt`) VALUES
(3, 'GRN-1769431243243', '2026-01-26 00:00:00.000', 2, 1, 2, 'Vehicle: 468686\nManual Ref: 6\nLogistics: sfsfete\nRemarks: fsdf', 'Received', '2026-01-26 12:40:43.315', '2026-01-26 12:51:58.737'),
(4, 'GRN-1769499428125', '2026-01-27 00:00:00.000', 1, 4, 2, 'Vehicle: 9645635435\nManual Ref: 21\nLogistics: TEsting\nRemarks: Demo', 'Received', '2026-01-27 07:37:08.134', '2026-01-27 07:37:08.134');

-- --------------------------------------------------------

--
-- Table structure for table `goodsreceiptnoteitem`
--

CREATE TABLE `goodsreceiptnoteitem` (
  `id` int(11) NOT NULL,
  `grnId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `description` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goodsreceiptnoteitem`
--

INSERT INTO `goodsreceiptnoteitem` (`id`, `grnId`, `productId`, `warehouseId`, `quantity`, `description`, `createdAt`, `updatedAt`) VALUES
(3, 3, 3, 2, 10, 'Clothes', '2026-01-26 12:40:43.315', '2026-01-26 12:40:43.315'),
(4, 4, 1, 2, 35, 'Test', '2026-01-27 07:37:08.134', '2026-01-27 07:37:08.134');

-- --------------------------------------------------------

--
-- Table structure for table `incomeentry`
--

CREATE TABLE `incomeentry` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `incomeType` enum('PRODUCT_SALES','SERVICE_INCOME','OTHER_INCOME') NOT NULL,
  `amount` double NOT NULL,
  `paymentMode` enum('CASH','BANK','CARD','UPI','CHEQUE','OTHER') NOT NULL,
  `description` text DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventoryadjustment`
--

CREATE TABLE `inventoryadjustment` (
  `id` int(11) NOT NULL,
  `voucherNo` varchar(191) NOT NULL,
  `manualVoucherNo` varchar(191) DEFAULT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `type` enum('ADD_STOCK','REMOVE_STOCK','ADJUST_VALUE') NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `totalValue` double NOT NULL DEFAULT 0,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventoryadjustment`
--

INSERT INTO `inventoryadjustment` (`id`, `voucherNo`, `manualVoucherNo`, `date`, `type`, `warehouseId`, `note`, `totalValue`, `companyId`, `createdAt`, `updatedAt`) VALUES
(3, 'ADJ-260129-6898', '54', '2026-01-29 00:00:00.000', 'ADD_STOCK', 2, 'test', 70000, 2, '2026-01-29 11:11:34.248', '2026-01-29 11:11:34.248');

-- --------------------------------------------------------

--
-- Table structure for table `inventoryadjustmentitem`
--

CREATE TABLE `inventoryadjustmentitem` (
  `id` int(11) NOT NULL,
  `inventoryAdjustmentId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL DEFAULT 0,
  `narration` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventoryadjustmentitem`
--

INSERT INTO `inventoryadjustmentitem` (`id`, `inventoryAdjustmentId`, `productId`, `warehouseId`, `quantity`, `rate`, `amount`, `narration`, `createdAt`, `updatedAt`) VALUES
(3, 3, 2, 2, 1, 70000, 70000, 'demo', '2026-01-29 11:11:34.248', '2026-01-29 11:11:34.248');

-- --------------------------------------------------------

--
-- Table structure for table `inventorytransaction`
--

CREATE TABLE `inventorytransaction` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `type` enum('OPENING_STOCK','TRANSFER','ADJUSTMENT','PURCHASE','SALE','RETURN','GRN') NOT NULL,
  `productId` int(11) NOT NULL,
  `fromWarehouseId` int(11) DEFAULT NULL,
  `toWarehouseId` int(11) DEFAULT NULL,
  `quantity` double NOT NULL,
  `reason` text DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventorytransaction`
--

INSERT INTO `inventorytransaction` (`id`, `date`, `type`, `productId`, `fromWarehouseId`, `toWarehouseId`, `quantity`, `reason`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, '2026-01-26 09:24:15.472', 'OPENING_STOCK', 1, NULL, 2, 45000, 'Opening Stock', 2, '2026-01-26 09:24:15.472', '2026-01-26 09:24:15.472'),
(2, '2026-01-26 09:25:20.404', 'OPENING_STOCK', 2, NULL, 1, 14000, 'Opening Stock', 2, '2026-01-26 09:25:20.404', '2026-01-26 09:25:20.404'),
(3, '2026-01-26 09:26:28.082', 'OPENING_STOCK', 3, NULL, 2, 142000, 'Opening Stock', 2, '2026-01-26 09:26:28.082', '2026-01-26 09:26:28.082'),
(4, '2026-01-26 12:01:44.917', 'SALE', 3, 2, NULL, 2, 'POS Sale: POS-000001', 2, '2026-01-26 12:01:44.658', '2026-01-26 12:01:44.917'),
(5, '2026-01-26 12:24:15.843', 'SALE', 3, 2, NULL, 10, 'Challan Issue: DC-1769430255831', 2, '2026-01-26 12:24:15.843', '2026-01-26 12:24:15.843'),
(8, '2026-01-26 12:28:07.646', 'SALE', 3, 2, NULL, 10, 'Invoice from SO: INV-1769430487570', 2, '2026-01-26 12:28:07.646', '2026-01-26 12:28:07.646'),
(9, '2026-01-26 12:32:24.246', 'RETURN', 3, NULL, 2, 10, 'Sales Return: 4534', 2, '2026-01-26 12:32:24.246', '2026-01-26 12:32:24.246'),
(10, '2026-01-26 00:00:00.000', 'GRN', 3, NULL, 2, 10, 'GRN: GRN-1769431243243', 2, '2026-01-26 12:40:43.315', '2026-01-26 12:40:43.315'),
(12, '2026-01-26 00:00:00.000', 'RETURN', 3, 2, NULL, 10, 'Purchase Return: PR-660537', 2, '2026-01-26 12:49:17.770', '2026-01-26 12:49:17.770'),
(13, '2026-01-26 13:12:49.954', 'SALE', 3, 2, NULL, 10, 'Challan Issue: DC-1769433169944', 2, '2026-01-26 13:12:49.954', '2026-01-26 13:12:49.954'),
(14, '2026-01-26 13:13:23.856', 'SALE', 3, 2, NULL, 10, 'Challan Issue: DC-1769433203831', 2, '2026-01-26 13:13:23.856', '2026-01-26 13:13:23.856'),
(15, '2026-01-27 06:37:20.779', 'SALE', 1, 2, NULL, 5, 'Challan Issue: 3', 2, '2026-01-27 06:37:20.779', '2026-01-27 06:37:20.779'),
(16, '2026-01-27 06:47:25.947', 'SALE', 1, 2, NULL, 5, 'Challan Issue: DC-33405195', 2, '2026-01-27 06:47:25.947', '2026-01-27 06:47:25.947'),
(17, '2026-01-27 00:00:00.000', 'GRN', 1, NULL, 2, 35, 'GRN: GRN-1769499428125', 2, '2026-01-27 07:37:08.134', '2026-01-27 07:37:08.134'),
(18, '2026-01-27 00:00:00.000', 'RETURN', 1, 2, NULL, 35, 'Purchase Return: PR-800815', 2, '2026-01-27 09:07:00.967', '2026-01-27 09:07:00.967'),
(19, '2026-01-27 09:07:27.381', 'SALE', 1, 2, NULL, 1, 'POS Sale: POS-000002', 2, '2026-01-27 09:07:27.283', '2026-01-27 09:07:27.381'),
(20, '2026-01-27 09:36:57.842', 'SALE', 2, 1, NULL, 1, 'POS Sale: POS-000003', 2, '2026-01-27 09:36:57.806', '2026-01-27 09:36:57.842'),
(21, '2026-01-29 06:43:45.597', 'SALE', 1, 2, NULL, 5, 'Invoice from SO: 102', 2, '2026-01-29 06:43:45.597', '2026-01-29 06:43:45.597'),
(22, '2026-01-29 11:09:34.965', 'TRANSFER', 2, 1, 2, 1, 'Voucher: VCH-260129-292. demo', 2, '2026-01-29 11:09:34.965', '2026-01-29 11:09:34.965'),
(25, '2026-01-29 11:11:34.248', 'ADJUSTMENT', 2, NULL, 2, 1, 'Adjustment (Add): ADJ-260129-6898. demo', 2, '2026-01-29 11:11:34.248', '2026-01-29 11:11:34.248');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `invoiceNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `dueDate` datetime(3) DEFAULT NULL,
  `customerId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `discountAmount` double NOT NULL DEFAULT 0,
  `taxAmount` double NOT NULL DEFAULT 0,
  `totalAmount` double NOT NULL,
  `paidAmount` double NOT NULL DEFAULT 0,
  `balanceAmount` double NOT NULL,
  `status` enum('UNPAID','PARTIAL','PAID','CANCELLED') NOT NULL DEFAULT 'UNPAID',
  `salesOrderId` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `deliveryChallanId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `invoiceNumber`, `date`, `dueDate`, `customerId`, `companyId`, `subtotal`, `discountAmount`, `taxAmount`, `totalAmount`, `paidAmount`, `balanceAmount`, `status`, `salesOrderId`, `notes`, `createdAt`, `updatedAt`, `deliveryChallanId`) VALUES
(6, 'INV-1769430487570', '2026-01-26 00:00:00.000', '2026-01-27 00:00:00.000', 2, 2, 100, 0, 1, 101, 201, 0, 'PAID', 1, 'demo', '2026-01-26 12:28:07.646', '2026-01-27 07:18:17.652', NULL),
(7, '102', '2026-01-29 00:00:00.000', '2026-01-31 00:00:00.000', 1, 2, 50, 0, 0.5, 50.5, 0, 50.5, 'UNPAID', 2, 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-29 06:43:45.597', '2026-01-29 06:51:07.766', NULL),
(8, '12', '2026-01-29 00:00:00.000', '2026-01-30 00:00:00.000', 1, 2, 100, 2, 19.6, 117.6, 0, 117.6, 'UNPAID', NULL, 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-29 06:51:39.131', '2026-01-29 06:51:39.131', 5),
(9, 'INV-1769669616113', '2026-01-29 00:00:00.000', NULL, 2, 2, 100, 1, 9.9, 108.9, 0, 108.9, 'UNPAID', NULL, 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-29 06:53:36.122', '2026-01-29 06:53:36.122', 3);

-- --------------------------------------------------------

--
-- Table structure for table `invoiceitem`
--

CREATE TABLE `invoiceitem` (
  `id` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `serviceId` int(11) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL,
  `taxRate` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `warehouseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoiceitem`
--

INSERT INTO `invoiceitem` (`id`, `invoiceId`, `productId`, `serviceId`, `description`, `quantity`, `rate`, `discount`, `amount`, `taxRate`, `createdAt`, `updatedAt`, `warehouseId`) VALUES
(6, 6, 3, NULL, 'Clothes', 10, 10, 0, 101, 1, '2026-01-26 12:28:07.646', '2026-01-26 12:28:07.646', 2),
(7, 7, 1, NULL, 'IPhone 17 Pro Max', 5, 10, 0, 50.5, 1, '2026-01-29 06:43:45.597', '2026-01-29 06:43:45.597', 2),
(8, 8, 1, NULL, 'IPhone 17 Pro Max', 5, 20, 2, 117.6, 20, '2026-01-29 06:51:39.131', '2026-01-29 06:51:39.131', 2),
(9, 9, 3, NULL, 'Clothes', 10, 10, 1, 108.9, 10, '2026-01-29 06:53:36.122', '2026-01-29 06:53:36.122', 2);

-- --------------------------------------------------------

--
-- Table structure for table `journalentry`
--

CREATE TABLE `journalentry` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `voucherNumber` varchar(191) NOT NULL,
  `narration` text DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journalentry`
--

INSERT INTO `journalentry` (`id`, `date`, `voucherNumber`, `narration`, `companyId`, `createdAt`, `updatedAt`) VALUES
(3, '2026-01-26 00:00:00.000', 'INV-1769430487570', 'Sales Invoice: INV-1769430487570', 2, '2026-01-26 12:28:07.646', '2026-01-26 12:28:07.646'),
(4, '2026-01-26 00:00:00.000', 'BILL-PO-1', 'Purchase Bill #BILL-PO-1', 2, '2026-01-26 12:45:03.353', '2026-01-26 12:45:03.353'),
(5, '2026-01-26 00:00:00.000', 'PR-660537', 'Purchase Return - testing', 2, '2026-01-26 12:49:17.770', '2026-01-26 12:49:17.770'),
(6, '2026-01-27 00:00:00.000', 'BILL-PO-4', 'Purchase Bill #BILL-PO-4', 2, '2026-01-27 07:37:58.942', '2026-01-27 07:37:58.942'),
(7, '2026-01-27 00:00:00.000', 'PR-800815', 'Purchase Return - testing', 2, '2026-01-27 09:07:00.967', '2026-01-27 09:07:00.967'),
(8, '2026-01-29 00:00:00.000', '102', 'Sales Invoice: 102', 2, '2026-01-29 06:43:45.597', '2026-01-29 06:43:45.597'),
(9, '2026-01-29 00:00:00.000', '12', 'Sales Invoice: 12', 2, '2026-01-29 06:51:39.131', '2026-01-29 06:51:39.131'),
(10, '2026-01-29 00:00:00.000', 'INV-1769669616113', 'Sales Invoice: INV-1769669616113', 2, '2026-01-29 06:53:36.122', '2026-01-29 06:53:36.122');

-- --------------------------------------------------------

--
-- Table structure for table `ledger`
--

CREATE TABLE `ledger` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `groupId` int(11) NOT NULL,
  `subGroupId` int(11) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `openingBalance` double NOT NULL DEFAULT 0,
  `currentBalance` double NOT NULL DEFAULT 0,
  `isControlAccount` tinyint(1) NOT NULL DEFAULT 0,
  `isEnabled` tinyint(1) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `parentLedgerId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `vendorId` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ledger`
--

INSERT INTO `ledger` (`id`, `name`, `groupId`, `subGroupId`, `companyId`, `openingBalance`, `currentBalance`, `isControlAccount`, `isEnabled`, `description`, `parentLedgerId`, `customerId`, `vendorId`, `createdAt`, `updatedAt`) VALUES
(1, 'Cash in Hand', 1, 1, 2, 0, 136367, 0, 1, NULL, NULL, NULL, NULL, '2026-01-26 09:10:01.581', '2026-01-29 10:34:23.389'),
(2, 'Inventory Asset', 1, NULL, 2, 0, 4248800000, 0, 1, NULL, NULL, NULL, NULL, '2026-01-26 09:10:01.593', '2026-01-26 09:26:28.062'),
(3, 'Cost of Goods Sold', 4, 8, 2, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2026-01-26 09:10:01.597', '2026-01-26 09:10:01.597'),
(4, 'Inventory Adjustment Expense', 4, 9, 2, 0, 212, 0, 1, NULL, NULL, NULL, NULL, '2026-01-26 09:10:01.602', '2026-01-26 09:59:11.342'),
(5, 'Opening Balance Equity', 5, NULL, 2, 0, -4248800120, 0, 1, NULL, NULL, NULL, NULL, '2026-01-26 09:10:01.605', '2026-01-29 07:17:42.342'),
(6, 'Assets', 1, NULL, 2, 0, 2225, 0, 1, 'Test', NULL, NULL, NULL, '2026-01-26 09:16:34.841', '2026-01-29 10:34:23.406'),
(7, 'Rahul', 1, 3, 2, 1452000, 1452168.1, 0, 1, 'Customer Ledger for Rahul', NULL, 1, NULL, '2026-01-26 09:17:26.578', '2026-01-29 06:51:39.131'),
(8, 'jay', 1, 3, 2, 520000, 520109.9, 0, 1, 'Customer Ledger for jay', NULL, 2, NULL, '2026-01-26 09:18:12.073', '2026-01-29 06:53:36.122'),
(9, 'Start Company Pvt. Ltd.', 2, 4, 2, 780000, 780000, 0, 1, 'Vendor Ledger for Start Company Pvt. Ltd.', NULL, NULL, 1, '2026-01-26 09:19:17.719', '2026-01-27 09:07:00.967'),
(10, 'XYZ Pvt. Ltd.', 2, 4, 2, 660000, 660000, 0, 1, 'Vendor Ledger for XYZ Pvt. Ltd.', NULL, NULL, 2, '2026-01-26 09:20:07.051', '2026-01-26 12:49:17.770'),
(11, 'Sales Income (POS)', 3, NULL, 2, 0, 138850, 0, 1, NULL, NULL, NULL, NULL, '2026-01-26 12:01:44.658', '2026-01-29 07:17:42.350'),
(12, 'Sales Return', 4, NULL, 2, 0, 100, 0, 1, 'Auto-created Sales Return Ledger', NULL, NULL, NULL, '2026-01-26 12:32:24.238', '2026-01-26 12:32:24.246'),
(15, 'Purchases', 4, 12, 2, 0, 0, 0, 1, 'General Purchases Account', NULL, NULL, NULL, '2026-01-26 12:45:03.353', '2026-01-27 09:07:00.967');

-- --------------------------------------------------------

--
-- Table structure for table `passwordrequest`
--

CREATE TABLE `passwordrequest` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Pending',
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `passwordrequest`
--

INSERT INTO `passwordrequest` (`id`, `userId`, `status`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 2, 'Approved', 2, '2026-01-26 11:50:29.767', '2026-01-26 11:58:08.442');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `paymentNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `vendorId` int(11) NOT NULL,
  `purchaseBillId` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `paymentMode` enum('CASH','BANK','CARD','UPI','CHEQUE','OTHER') NOT NULL,
  `referenceNumber` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `paymentNumber`, `date`, `vendorId`, `purchaseBillId`, `amount`, `paymentMode`, `referenceNumber`, `companyId`, `notes`, `createdAt`, `updatedAt`) VALUES
(1, '12455', '2026-01-26 00:00:00.000', 2, 3, 13198.79, 'OTHER', NULL, 2, 'demo', '2026-01-26 12:45:32.375', '2026-01-26 12:51:45.916'),
(2, '5', '2026-01-27 00:00:00.000', 1, 4, 44094.3825, 'BANK', NULL, 2, 'Payment for Bill #BILL-PO-4\n\nThis accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-27 09:06:34.678', '2026-01-27 09:06:34.678');

-- --------------------------------------------------------

--
-- Table structure for table `paymentrecord`
--

CREATE TABLE `paymentrecord` (
  `id` int(11) NOT NULL,
  `transactionId` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `customer` varchar(191) NOT NULL,
  `paymentMethod` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Pending',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `basePrice` double NOT NULL DEFAULT 0,
  `currency` varchar(191) NOT NULL DEFAULT 'USD',
  `invoiceLimit` varchar(191) NOT NULL DEFAULT '0',
  `additionalInvoicePrice` double NOT NULL DEFAULT 0,
  `userLimit` varchar(191) NOT NULL DEFAULT '0',
  `storageCapacity` varchar(191) NOT NULL DEFAULT '0',
  `billingCycle` varchar(191) NOT NULL DEFAULT 'Monthly',
  `status` varchar(191) NOT NULL DEFAULT 'Active',
  `modules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`modules`)),
  `totalPrice` double NOT NULL DEFAULT 0,
  `descriptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`descriptions`)),
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `planrequest`
--

CREATE TABLE `planrequest` (
  `id` int(11) NOT NULL,
  `companyName` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `planId` int(11) DEFAULT NULL,
  `planName` varchar(191) DEFAULT NULL,
  `billingCycle` varchar(191) NOT NULL DEFAULT 'Monthly',
  `startDate` datetime(3) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Pending',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posinvoice`
--

CREATE TABLE `posinvoice` (
  `id` int(11) NOT NULL,
  `invoiceNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `customerId` int(11) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `discountAmount` double NOT NULL DEFAULT 0,
  `taxAmount` double NOT NULL DEFAULT 0,
  `totalAmount` double NOT NULL,
  `paidAmount` double NOT NULL DEFAULT 0,
  `balanceAmount` double NOT NULL DEFAULT 0,
  `paymentMode` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Paid',
  `notes` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posinvoice`
--

INSERT INTO `posinvoice` (`id`, `invoiceNumber`, `date`, `customerId`, `companyId`, `subtotal`, `discountAmount`, `taxAmount`, `totalAmount`, `paidAmount`, `balanceAmount`, `paymentMode`, `status`, `notes`, `createdAt`, `updatedAt`) VALUES
(1, 'POS-000001', '2026-01-26 12:01:44.658', 2, 2, 2800, 0, 280, 3080, 3080, 0, 'CASH', 'Paid', NULL, '2026-01-26 12:01:44.658', '2026-01-26 12:01:44.886'),
(2, 'POS-000002', '2026-01-27 09:07:27.283', 1, 2, 45000, 0, 4500, 49500, 49500, 0, 'CASH', 'Paid', 'test', '2026-01-27 09:07:27.283', '2026-01-27 09:07:27.336'),
(3, 'POS-000003', '2026-01-27 09:36:57.806', 1, 2, 78000, 0, 7800, 85800, 85800, 0, 'CASH', 'Paid', 'demo', '2026-01-27 09:36:57.806', '2026-01-27 09:36:57.824');

-- --------------------------------------------------------

--
-- Table structure for table `posinvoiceitem`
--

CREATE TABLE `posinvoiceitem` (
  `id` int(11) NOT NULL,
  `posInvoiceId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `warehouseId` int(11) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `amount` double NOT NULL,
  `taxRate` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posinvoiceitem`
--

INSERT INTO `posinvoiceitem` (`id`, `posInvoiceId`, `productId`, `warehouseId`, `description`, `quantity`, `rate`, `amount`, `taxRate`, `createdAt`, `updatedAt`) VALUES
(1, 1, 3, 2, 'Clothes', 2, 1400, 3080, 10, '2026-01-26 12:01:44.658', '2026-01-26 12:01:44.887'),
(2, 2, 1, 2, 'IPhone 17 Pro Max', 1, 45000, 49500, 10, '2026-01-27 09:07:27.283', '2026-01-27 09:07:27.336'),
(3, 3, 2, 1, 'Laptop', 1, 78000, 85800, 10, '2026-01-27 09:36:57.806', '2026-01-27 09:36:57.824');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `hsn` varchar(191) DEFAULT NULL,
  `barcode` varchar(191) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `uomId` int(11) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `asOfDate` datetime(3) DEFAULT NULL,
  `taxAccount` varchar(191) DEFAULT NULL,
  `initialCost` double NOT NULL DEFAULT 0,
  `salePrice` double NOT NULL DEFAULT 0,
  `purchasePrice` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `sku`, `hsn`, `barcode`, `image`, `categoryId`, `uomId`, `unit`, `description`, `asOfDate`, `taxAccount`, `initialCost`, `salePrice`, `purchasePrice`, `discount`, `remarks`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'IPhone 17 Pro Max', 'MOBILE-001', '6468', '544634', 'https://res.cloudinary.com/dw48hcxi5/image/upload/v1769683904/products/vkev8amvxdrsxcd0ct2c.png', 1, 1, NULL, 'Test', '2026-01-26 00:00:00.000', '15', 45000, 45000, 40000, 10, 'Testing', 2, '2026-01-26 09:24:15.472', '2026-01-29 10:51:54.084'),
(2, 'Laptop', 'LAPTOP-001', '6468', '34536', 'https://res.cloudinary.com/dw48hcxi5/image/upload/v1769419472/products/ieui6ou6rv5fgjhwnhh3.jpg', 2, 1, NULL, 'Laptop', '2026-01-26 00:00:00.000', '10', 0, 78000, 70000, 9, 'Testing', 2, '2026-01-26 09:25:20.404', '2026-01-26 09:25:20.404'),
(3, 'Clothes', 'CLOTHES-001', '453645', '34536', 'https://res.cloudinary.com/dw48hcxi5/image/upload/v1769419534/products/bjzhaweuhj520nq8icys.png', 3, 1, NULL, 'Clothes', '2026-01-26 00:00:00.000', '10', 1400, 1400, 1199.99, 10, 'Testing', 2, '2026-01-26 09:26:28.082', '2026-01-26 09:26:28.082');

-- --------------------------------------------------------

--
-- Table structure for table `purchasebill`
--

CREATE TABLE `purchasebill` (
  `id` int(11) NOT NULL,
  `billNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `dueDate` datetime(3) DEFAULT NULL,
  `vendorId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `discountAmount` double NOT NULL DEFAULT 0,
  `taxAmount` double NOT NULL DEFAULT 0,
  `totalAmount` double NOT NULL,
  `paidAmount` double NOT NULL DEFAULT 0,
  `balanceAmount` double NOT NULL,
  `status` enum('UNPAID','PARTIAL','PAID','CANCELLED') NOT NULL DEFAULT 'UNPAID',
  `notes` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `grnId` int(11) DEFAULT NULL,
  `purchaseOrderId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasebill`
--

INSERT INTO `purchasebill` (`id`, `billNumber`, `date`, `dueDate`, `vendorId`, `companyId`, `subtotal`, `discountAmount`, `taxAmount`, `totalAmount`, `paidAmount`, `balanceAmount`, `status`, `notes`, `createdAt`, `updatedAt`, `grnId`, `purchaseOrderId`) VALUES
(3, 'BILL-PO-1', '2026-01-26 00:00:00.000', '2026-01-27 00:00:00.000', 2, 2, 11999.9, 1, 1199.89, 13198.79, 13198.79, 13198.79, 'PAID', 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-26 12:45:03.353', '2026-01-27 09:05:32.933', NULL, 1),
(4, 'BILL-PO-4', '2026-01-27 00:00:00.000', '2026-01-28 00:00:00.000', 1, 2, 1400000, 5, 2099.7325, 44094.3825, 44094.3825, 0, 'PAID', 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-27 07:37:58.942', '2026-01-27 09:06:34.678', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `purchasebillitem`
--

CREATE TABLE `purchasebillitem` (
  `id` int(11) NOT NULL,
  `purchaseBillId` int(11) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL,
  `taxRate` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `productId` int(11) DEFAULT NULL,
  `warehouseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasebillitem`
--

INSERT INTO `purchasebillitem` (`id`, `purchaseBillId`, `description`, `quantity`, `rate`, `discount`, `amount`, `taxRate`, `createdAt`, `updatedAt`, `productId`, `warehouseId`) VALUES
(5, 4, 'Clothes', 35, 1199.99, 5, 44094.3825, 5, '2026-01-27 07:52:02.286', '2026-01-27 07:52:02.286', 3, 2),
(6, 3, 'Clothes', 10, 1199.99, 1, 13198.79, 10, '2026-01-27 09:05:32.933', '2026-01-27 09:05:32.933', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorder`
--

CREATE TABLE `purchaseorder` (
  `id` int(11) NOT NULL,
  `orderNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `expectedDate` datetime(3) DEFAULT NULL,
  `vendorId` int(11) NOT NULL,
  `quotationId` int(11) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `discountAmount` double NOT NULL DEFAULT 0,
  `taxAmount` double NOT NULL DEFAULT 0,
  `totalAmount` double NOT NULL,
  `status` enum('PENDING','PARTIAL','COMPLETED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `notes` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchaseorder`
--

INSERT INTO `purchaseorder` (`id`, `orderNumber`, `date`, `expectedDate`, `vendorId`, `quotationId`, `companyId`, `subtotal`, `discountAmount`, `taxAmount`, `totalAmount`, `status`, `notes`, `createdAt`, `updatedAt`) VALUES
(1, 'PO-66634209', '2026-01-26 00:00:00.000', '2026-01-27 00:00:00.000', 2, 1, 2, 11999.9, 1, 1199.89, 13198.79, 'PENDING', 'sdfsd', '2026-01-26 12:37:07.150', '2026-01-26 12:53:17.298'),
(4, 'PO-13029564', '2026-01-27 00:00:00.000', '2026-01-28 00:00:00.000', 1, 2, 2, 1400000, 5, 69999.75, 1469994.75, 'COMPLETED', 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-27 07:36:24.210', '2026-01-27 07:37:58.942');

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorderitem`
--

CREATE TABLE `purchaseorderitem` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL,
  `taxRate` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `warehouseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchaseorderitem`
--

INSERT INTO `purchaseorderitem` (`id`, `orderId`, `productId`, `description`, `quantity`, `rate`, `discount`, `amount`, `taxRate`, `createdAt`, `updatedAt`, `warehouseId`) VALUES
(2, 1, 3, 'Clothes', 10, 1199.99, 1, 13198.79, 10, '2026-01-26 12:53:17.298', '2026-01-26 12:53:17.298', NULL),
(3, 4, 1, 'Test', 35, 40000, 5, 1469994.75, 5, '2026-01-27 07:36:24.210', '2026-01-27 07:36:24.210', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchasequotation`
--

CREATE TABLE `purchasequotation` (
  `id` int(11) NOT NULL,
  `quotationNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `expiryDate` datetime(3) DEFAULT NULL,
  `vendorId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `discountAmount` double NOT NULL DEFAULT 0,
  `taxAmount` double NOT NULL DEFAULT 0,
  `totalAmount` double NOT NULL,
  `status` enum('DRAFT','SENT','ACCEPTED','DECLINED','EXPIRED') NOT NULL DEFAULT 'DRAFT',
  `notes` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `attachments` text DEFAULT NULL,
  `manualReference` varchar(191) DEFAULT NULL,
  `terms` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasequotation`
--

INSERT INTO `purchasequotation` (`id`, `quotationNumber`, `date`, `expiryDate`, `vendorId`, `companyId`, `subtotal`, `discountAmount`, `taxAmount`, `totalAmount`, `status`, `notes`, `createdAt`, `updatedAt`, `attachments`, `manualReference`, `terms`) VALUES
(1, 'PQ-1769430121510', '2026-01-26 00:00:00.000', '2026-01-27 00:00:00.000', 2, 2, 11999.9, 1, 1199.89, 13198.79, 'DRAFT', 'sdfsd4', '2026-01-26 12:22:01.642', '2026-01-26 12:53:31.780', '', '4123', 'dgd23'),
(2, 'PQ-1769498596653', '2026-01-27 00:00:00.000', '2026-01-28 00:00:00.000', 1, 2, 1400000, 5, 69999.75, 1469994.75, 'ACCEPTED', 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-27 07:23:16.687', '2026-01-27 07:36:24.210', '', '4', 'By accessing or using this accounting software, you agree to comply with these terms and conditions. Users are responsible for maintaining the confidentiality of their account credentials and all activities performed under their account. The software provider shall not be held liable for any financial loss, data loss, or business interruption caused by incorrect data entry, system misuse, or temporary service unavailability due to maintenance or technical issues. While reasonable security measures are implemented to protect user data, absolute security cannot be guaranteed. Continued use of the software indicates acceptance of any updates or changes to these terms in accordance with applicable laws.');

-- --------------------------------------------------------

--
-- Table structure for table `purchasequotationitem`
--

CREATE TABLE `purchasequotationitem` (
  `id` int(11) NOT NULL,
  `quotationId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL,
  `taxRate` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `warehouseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasequotationitem`
--

INSERT INTO `purchasequotationitem` (`id`, `quotationId`, `productId`, `description`, `quantity`, `rate`, `discount`, `amount`, `taxRate`, `createdAt`, `updatedAt`, `warehouseId`) VALUES
(2, 1, 3, 'Clothes', 10, 1199.99, 1, 13198.79, 10, '2026-01-26 12:53:31.780', '2026-01-26 12:53:31.780', 2),
(4, 2, 1, 'Test', 35, 40000, 5, 1469994.75, 5, '2026-01-27 07:23:35.255', '2026-01-27 07:23:35.255', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchasereturn`
--

CREATE TABLE `purchasereturn` (
  `id` int(11) NOT NULL,
  `returnNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `vendorId` int(11) NOT NULL,
  `purchaseBillId` int(11) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `totalAmount` double NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Processed','Rejected','Draft') NOT NULL DEFAULT 'Pending',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasereturn`
--

INSERT INTO `purchasereturn` (`id`, `returnNumber`, `date`, `vendorId`, `purchaseBillId`, `companyId`, `totalAmount`, `reason`, `status`, `createdAt`, `updatedAt`) VALUES
(2, 'PR-660537', '2026-01-26 00:00:00.000', 2, 3, 2, 13198.79, 'testing', 'Processed', '2026-01-26 12:49:17.770', '2026-01-26 12:51:31.492'),
(3, 'PR-800815', '2026-01-27 00:00:00.000', 1, 4, 2, 1469994.75, 'testing', 'Processed', '2026-01-27 09:07:00.967', '2026-01-27 09:07:00.967');

-- --------------------------------------------------------

--
-- Table structure for table `purchasereturnitem`
--

CREATE TABLE `purchasereturnitem` (
  `id` int(11) NOT NULL,
  `purchaseReturnId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `amount` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchasereturnitem`
--

INSERT INTO `purchasereturnitem` (`id`, `purchaseReturnId`, `productId`, `warehouseId`, `quantity`, `rate`, `amount`, `createdAt`, `updatedAt`) VALUES
(3, 2, 3, 2, 10, 1199.99, 13198.79, '2026-01-26 12:51:31.492', '2026-01-26 12:51:31.492'),
(4, 3, 1, 2, 35, 40000, 1469994.75, '2026-01-27 09:07:00.967', '2026-01-27 09:07:00.967');

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `id` int(11) NOT NULL,
  `receiptNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `customerId` int(11) NOT NULL,
  `invoiceId` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `paymentMode` enum('CASH','BANK','CARD','UPI','CHEQUE','OTHER') NOT NULL,
  `referenceNumber` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receipt`
--

INSERT INTO `receipt` (`id`, `receiptNumber`, `date`, `customerId`, `invoiceId`, `amount`, `paymentMode`, `referenceNumber`, `companyId`, `notes`, `createdAt`, `updatedAt`) VALUES
(1, 'REC-1769430514898', '2026-01-26 00:00:00.000', 2, 6, 101, 'UPI', '1245', 2, 'test', '2026-01-26 12:28:34.911', '2026-01-26 12:28:34.911');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `permissions` text NOT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `permissions`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'Staff', '[\"manage role\",\"edit role\",\"manage accounts\",\"create accounts\",\"edit accounts\",\"delete accounts\",\"manage inventory\",\"create inventory\",\"edit inventory\",\"delete inventory\",\"manage sales\",\"create sales\",\"edit sales\",\"delete sales\",\"show sales\",\"send sales\",\"manage purchases\",\"create purchases\",\"edit purchases\",\"delete purchases\",\"manage pos\",\"create pos\",\"edit pos\",\"delete pos\"]', 2, '2026-01-26 10:48:52.399', '2026-01-26 10:48:52.399');

-- --------------------------------------------------------

--
-- Table structure for table `salesorder`
--

CREATE TABLE `salesorder` (
  `id` int(11) NOT NULL,
  `orderNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `expectedDate` datetime(3) DEFAULT NULL,
  `customerId` int(11) NOT NULL,
  `quotationId` int(11) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `discountAmount` double NOT NULL DEFAULT 0,
  `taxAmount` double NOT NULL DEFAULT 0,
  `totalAmount` double NOT NULL,
  `status` enum('PENDING','PARTIAL','COMPLETED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `notes` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesorder`
--

INSERT INTO `salesorder` (`id`, `orderNumber`, `date`, `expectedDate`, `customerId`, `quotationId`, `companyId`, `subtotal`, `discountAmount`, `taxAmount`, `totalAmount`, `status`, `notes`, `createdAt`, `updatedAt`) VALUES
(1, 'SO-1769433161863', '2026-01-26 00:00:00.000', NULL, 2, 1, 2, 100, 0, 1, 101, 'COMPLETED', 'sfsf', '2026-01-26 12:23:51.644', '2026-01-26 13:12:41.874'),
(2, 'SO-1769495143775', '2026-01-27 00:00:00.000', '2026-01-28 00:00:00.000', 1, 2, 2, 50, 0, 0.5, 50.5, 'COMPLETED', 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-27 06:25:43.781', '2026-01-29 06:43:45.597');

-- --------------------------------------------------------

--
-- Table structure for table `salesorderitem`
--

CREATE TABLE `salesorderitem` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `serviceId` int(11) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL,
  `taxRate` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `warehouseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesorderitem`
--

INSERT INTO `salesorderitem` (`id`, `orderId`, `productId`, `serviceId`, `description`, `quantity`, `rate`, `discount`, `amount`, `taxRate`, `createdAt`, `updatedAt`, `warehouseId`) VALUES
(4, 1, 3, NULL, 'Clothes', 10, 10, 0, 101, 1, '2026-01-26 13:12:41.874', '2026-01-26 13:12:41.874', 2),
(5, 2, 1, NULL, 'IPhone 17 Pro Max', 5, 10, 0, 50.5, 1, '2026-01-27 06:25:43.781', '2026-01-27 06:25:43.781', 2);

-- --------------------------------------------------------

--
-- Table structure for table `salesquotation`
--

CREATE TABLE `salesquotation` (
  `id` int(11) NOT NULL,
  `quotationNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `expiryDate` datetime(3) DEFAULT NULL,
  `customerId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `discountAmount` double NOT NULL DEFAULT 0,
  `taxAmount` double NOT NULL DEFAULT 0,
  `totalAmount` double NOT NULL,
  `status` enum('DRAFT','SENT','ACCEPTED','DECLINED','EXPIRED') NOT NULL DEFAULT 'DRAFT',
  `notes` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesquotation`
--

INSERT INTO `salesquotation` (`id`, `quotationNumber`, `date`, `expiryDate`, `customerId`, `companyId`, `subtotal`, `discountAmount`, `taxAmount`, `totalAmount`, `status`, `notes`, `createdAt`, `updatedAt`) VALUES
(1, 'QUO-1769495061920', '2026-01-26 00:00:00.000', NULL, 2, 2, 100, 1, 0.99, 99.99, 'ACCEPTED', 'Thank you for your business!', '2026-01-26 12:13:32.401', '2026-01-27 06:24:21.986'),
(2, 'QUO-1769495079728', '2026-01-26 00:00:00.000', '2026-01-28 00:00:00.000', 1, 2, 50, 10, 0.4, 40.4, 'ACCEPTED', 'This accounting software is designed to assist users in managing financial data such as invoices, expenses, payments, reports, and tax-related records. All information and reports generated by the system depend on the data entered by the user, and users should verify details before final submission. The software may receive updates, improvements, or feature changes to enhance performance, accuracy, and security. Regular data backups are recommended to avoid potential data loss.', '2026-01-26 13:57:41.935', '2026-01-27 06:25:43.781');

-- --------------------------------------------------------

--
-- Table structure for table `salesquotationitem`
--

CREATE TABLE `salesquotationitem` (
  `id` int(11) NOT NULL,
  `quotationId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `serviceId` int(11) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL,
  `taxRate` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `warehouseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesquotationitem`
--

INSERT INTO `salesquotationitem` (`id`, `quotationId`, `productId`, `serviceId`, `description`, `quantity`, `rate`, `discount`, `amount`, `taxRate`, `createdAt`, `updatedAt`, `warehouseId`) VALUES
(6, 1, 3, NULL, 'Clothes', 10, 10, 1, 99.99, 1, '2026-01-27 06:24:21.986', '2026-01-27 06:24:21.986', 2),
(7, 2, 1, NULL, 'IPhone 17 Pro Max', 5, 10, 10, 40.4, 1, '2026-01-27 06:24:39.737', '2026-01-27 06:24:39.737', 2);

-- --------------------------------------------------------

--
-- Table structure for table `salesreturn`
--

CREATE TABLE `salesreturn` (
  `id` int(11) NOT NULL,
  `returnNumber` varchar(191) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `customerId` int(11) NOT NULL,
  `invoiceId` int(11) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `totalAmount` double NOT NULL,
  `reason` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `autoVoucherNo` varchar(191) DEFAULT NULL,
  `manualVoucherNo` varchar(191) DEFAULT NULL,
  `status` enum('Pending','Processed','Rejected','Draft') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesreturn`
--

INSERT INTO `salesreturn` (`id`, `returnNumber`, `date`, `customerId`, `invoiceId`, `companyId`, `totalAmount`, `reason`, `createdAt`, `updatedAt`, `autoVoucherNo`, `manualVoucherNo`, `status`) VALUES
(1, '4534', '2026-01-26 00:00:00.000', 2, 6, 2, 100, '543', '2026-01-26 12:32:24.246', '2026-01-26 12:32:24.246', 'SRT-000001', '3453', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `salesreturnitem`
--

CREATE TABLE `salesreturnitem` (
  `id` int(11) NOT NULL,
  `salesReturnId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `amount` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salesreturnitem`
--

INSERT INTO `salesreturnitem` (`id`, `salesReturnId`, `productId`, `warehouseId`, `quantity`, `rate`, `amount`, `createdAt`, `updatedAt`) VALUES
(1, 1, 3, 2, 10, 10, 100, '2026-01-26 12:32:24.246', '2026-01-26 12:32:24.246');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `uomId` int(11) NOT NULL,
  `price` double NOT NULL,
  `taxRate` double NOT NULL DEFAULT 0,
  `allowInInvoices` tinyint(1) NOT NULL DEFAULT 1,
  `remarks` text DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `sku`, `description`, `uomId`, `price`, `taxRate`, `allowInInvoices`, `remarks`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'School', 'School-001', 'demo', 1, 12000, 9, 1, 'Test', 2, '2026-01-29 11:09:13.314', '2026-01-29 11:09:13.314');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `minOrderQty` double NOT NULL DEFAULT 0,
  `initialQty` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `reservedQuantity` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `warehouseId`, `productId`, `quantity`, `minOrderQty`, `initialQty`, `createdAt`, `updatedAt`, `reservedQuantity`) VALUES
(2, 1, 2, 13998, 100, 0, '2026-01-26 09:25:20.404', '2026-01-29 11:09:34.965', 0),
(3, 2, 3, 141968, 100, 0, '2026-01-26 09:26:28.082', '2026-01-26 13:13:23.856', 0),
(5, 2, 1, 44984, 100, 0, '2026-01-29 10:51:54.084', '2026-01-29 10:51:54.084', 0),
(6, 2, 2, 2, 0, 0, '2026-01-29 11:09:34.965', '2026-01-29 11:11:34.248', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stocktransfer`
--

CREATE TABLE `stocktransfer` (
  `id` int(11) NOT NULL,
  `voucherNo` varchar(191) NOT NULL,
  `manualVoucherNo` varchar(191) DEFAULT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `toWarehouseId` int(11) NOT NULL,
  `narration` text DEFAULT NULL,
  `totalAmount` double NOT NULL DEFAULT 0,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocktransfer`
--

INSERT INTO `stocktransfer` (`id`, `voucherNo`, `manualVoucherNo`, `date`, `toWarehouseId`, `narration`, `totalAmount`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'VCH-260129-292', '120', '2026-01-29 00:00:00.000', 2, 'test', 70000, 2, '2026-01-29 11:09:34.965', '2026-01-29 11:09:34.965');

-- --------------------------------------------------------

--
-- Table structure for table `stocktransferitem`
--

CREATE TABLE `stocktransferitem` (
  `id` int(11) NOT NULL,
  `stockTransferId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `fromWarehouseId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL DEFAULT 0,
  `narration` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocktransferitem`
--

INSERT INTO `stocktransferitem` (`id`, `stockTransferId`, `productId`, `fromWarehouseId`, `quantity`, `rate`, `amount`, `narration`, `createdAt`, `updatedAt`) VALUES
(1, 1, 2, 1, 1, 70000, 70000, 'demo', '2026-01-29 11:09:34.965', '2026-01-29 11:09:34.965');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `debitLedgerId` int(11) NOT NULL,
  `creditLedgerId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `narration` text DEFAULT NULL,
  `voucherType` enum('JOURNAL','SALES','PURCHASE','RECEIPT','PAYMENT','CONTRA','EXPENSE','INCOME','QUOTATION','SALES_ORDER','DELIVERY_CHALLAN','SALES_RETURN','CREDIT_NOTE','DEBIT_NOTE','PURCHASE_QUOTATION','PURCHASE_ORDER','GRN','PURCHASE_RETURN','POS_INVOICE') NOT NULL,
  `voucherNumber` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `journalEntryId` int(11) DEFAULT NULL,
  `invoiceId` int(11) DEFAULT NULL,
  `purchaseBillId` int(11) DEFAULT NULL,
  `receiptId` int(11) DEFAULT NULL,
  `paymentId` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `posInvoiceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `date`, `debitLedgerId`, `creditLedgerId`, `amount`, `narration`, `voucherType`, `voucherNumber`, `companyId`, `journalEntryId`, `invoiceId`, `purchaseBillId`, `receiptId`, `paymentId`, `createdAt`, `updatedAt`, `posInvoiceId`) VALUES
(1, '2026-01-26 00:00:00.000', 2, 5, 2025000000, 'Opening Stock for Product: IPhone 17 Pro Max', 'JOURNAL', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2026-01-26 09:22:51.222', '2026-01-26 09:22:51.222', NULL),
(2, '2026-01-26 00:00:00.000', 2, 5, 2025000000, 'Opening Stock for Product: IPhone 17 Pro Max', 'JOURNAL', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2026-01-26 09:24:15.459', '2026-01-26 09:24:15.459', NULL),
(3, '2026-01-26 00:00:00.000', 2, 5, 198800000, 'Opening Stock for Product: Clothes', 'JOURNAL', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2026-01-26 09:26:28.020', '2026-01-26 09:26:28.020', NULL),
(4, '2026-01-26 00:00:00.000', 4, 6, 212, '| fsdf (Ref: 1121)', 'EXPENSE', 'AUTO-001', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-26 09:57:04.392', '2026-01-26 09:57:04.392', NULL),
(7, '2026-01-26 12:01:44.932', 8, 11, 3080, 'POS Sale - POS-000001', 'POS_INVOICE', 'POS-000001', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-26 12:01:44.658', '2026-01-26 12:01:44.932', 1),
(8, '2026-01-26 12:01:44.971', 1, 8, 3080, 'Payment for POS POS-000001', 'RECEIPT', 'RCP-POS-000001', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-26 12:01:44.658', '2026-01-26 12:01:44.971', 1),
(11, '2026-01-26 00:00:00.000', 8, 11, 101, 'Sales to Jay', 'SALES', 'INV-1769430487570', 2, 3, 6, NULL, NULL, NULL, '2026-01-26 12:28:07.646', '2026-01-26 12:28:07.646', NULL),
(12, '2026-01-26 00:00:00.000', 8, 8, 101, 'Payment received from Jay for Invoice 6', 'RECEIPT', 'REC-1769430514898', 2, NULL, 6, NULL, 1, NULL, '2026-01-26 12:28:34.911', '2026-01-26 12:28:34.911', NULL),
(13, '2026-01-26 00:00:00.000', 12, 8, 100, 'Sales Return from Jay for Invoice ID: 6', 'SALES_RETURN', 'SRT-000001', 2, NULL, 6, NULL, NULL, NULL, '2026-01-26 12:32:24.246', '2026-01-26 12:32:24.246', NULL),
(14, '2026-01-26 00:00:00.000', 15, 10, 13198.79, 'Purchase Bill Booking', 'PURCHASE', 'BILL-PO-1', 2, 4, NULL, 3, NULL, NULL, '2026-01-26 12:45:03.353', '2026-01-26 12:45:03.353', NULL),
(15, '2026-01-26 00:00:00.000', 10, 15, 13198.79, 'Purchase Return', 'PURCHASE_RETURN', 'PR-660537', 2, 5, NULL, NULL, NULL, NULL, '2026-01-26 12:49:17.770', '2026-01-26 12:49:17.770', NULL),
(16, '2026-01-27 00:00:00.000', 15, 9, 1469994.75, 'Purchase Bill Booking', 'PURCHASE', 'BILL-PO-4', 2, 6, NULL, 4, NULL, NULL, '2026-01-27 07:37:58.942', '2026-01-27 07:37:58.942', NULL),
(17, '2026-01-27 00:00:00.000', 9, 15, 1469994.75, 'Purchase Return', 'PURCHASE_RETURN', 'PR-800815', 2, 7, NULL, NULL, NULL, NULL, '2026-01-27 09:07:00.967', '2026-01-27 09:07:00.967', NULL),
(18, '2026-01-27 09:07:27.386', 7, 11, 49500, 'POS Sale - POS-000002', 'POS_INVOICE', 'POS-000002', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-27 09:07:27.283', '2026-01-27 09:07:27.386', 2),
(19, '2026-01-27 09:07:27.411', 1, 7, 49500, 'Payment for POS POS-000002', 'RECEIPT', 'RCP-POS-000002', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-27 09:07:27.283', '2026-01-27 09:07:27.411', 2),
(20, '2026-01-27 09:36:57.850', 7, 11, 85800, 'POS Sale - POS-000003', 'POS_INVOICE', 'POS-000003', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-27 09:36:57.806', '2026-01-27 09:36:57.850', 3),
(21, '2026-01-27 09:36:57.873', 1, 7, 85800, 'Payment for POS POS-000003', 'RECEIPT', 'RCP-POS-000003', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-27 09:36:57.806', '2026-01-27 09:36:57.873', 3),
(22, '2026-01-29 00:00:00.000', 7, 11, 50.5, 'Sales to Rahul', 'SALES', '102', 2, 8, 7, NULL, NULL, NULL, '2026-01-29 06:43:45.597', '2026-01-29 06:43:45.597', NULL),
(23, '2026-01-29 00:00:00.000', 7, 11, 117.6, 'Sales to Rahul', 'SALES', '12', 2, 9, 8, NULL, NULL, NULL, '2026-01-29 06:51:39.131', '2026-01-29 06:51:39.131', NULL),
(24, '2026-01-29 00:00:00.000', 8, 11, 108.9, 'Sales to Jay', 'SALES', 'INV-1769669616113', 2, 10, 9, NULL, NULL, NULL, '2026-01-29 06:53:36.122', '2026-01-29 06:53:36.122', NULL),
(25, '2026-01-30 00:00:00.000', 5, 11, 120, 'test | demo (Ref: 123)', 'INCOME', 'INC-001', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-29 07:14:13.792', '2026-01-29 07:14:13.792', NULL),
(26, '2026-01-30 00:00:00.000', 5, 11, 120, 'test | demo (Ref: 123)', 'INCOME', 'INC-002', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-29 07:16:38.298', '2026-01-29 07:16:38.298', NULL),
(27, '2026-01-30 00:00:00.000', 5, 11, 120, 'test | demo (Ref: 123)', 'INCOME', 'INC-003', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-29 07:17:42.335', '2026-01-29 07:17:42.335', NULL),
(28, '2026-01-29 00:00:00.000', 1, 6, 120, 'test | demo (Ref: 124)', 'CONTRA', 'CNT-001', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-29 09:30:36.108', '2026-01-29 09:30:36.108', NULL),
(29, '2026-01-29 00:00:00.000', 6, 1, 2133, 'test', 'CONTRA', 'demo', 2, NULL, NULL, NULL, NULL, NULL, '2026-01-29 10:34:23.313', '2026-01-29 10:34:23.310', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uom`
--

CREATE TABLE `uom` (
  `id` int(11) NOT NULL,
  `category` varchar(191) NOT NULL,
  `unitName` varchar(191) NOT NULL,
  `weightPerUnit` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uom`
--

INSERT INTO `uom` (`id`, `category`, `unitName`, `weightPerUnit`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'Count', 'Packet', '20', 2, '2026-01-26 09:21:41.281', '2026-01-26 09:21:41.281');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL DEFAULT 'USER',
  `companyId` int(11) DEFAULT NULL,
  `avatar` longtext DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `loginEnabled` tinyint(1) NOT NULL DEFAULT 1,
  `roleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `companyId`, `avatar`, `createdAt`, `updatedAt`, `loginEnabled`, `roleId`) VALUES
(1, 'Super Admin', 'superadmin@gmail.com', '$2b$10$YBxU1mOYG5GRMmhrgdtdseOGOKfSAGit4b6.s4C3PgXw.hCZS2/iC', 'SUPERADMIN', NULL, NULL, '2026-01-26 09:08:39.426', '2026-01-26 09:08:39.426', 1, NULL);
INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `companyId`, `avatar`, `createdAt`, `updatedAt`, `loginEnabled`, `roleId`) VALUES
(2, 'Company User', 'company@gmail.com', '$2b$10$l0AwzskFUae.UmsaRS0lIOM9RrNhMtZdMki4Whgq6mU5jbdNRljeq', 'COMPANY', 2, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEBLAEsAAD/4QDWRXhpZgAASUkqAAgAAAADAA4BAgCMAAAAMgAAABoBBQABAAAAvgAAABsBBQABAAAAxgAAAAAAAABDcm9wIG9mIGZlbWFsZSBleWUgd2l0aCBjb2xvcmZ1bCBtYWtlIHVwLiBCZWF1dGlmdWwgZmFzaGlvbiBtb2RlbCB3aXRoIGNyZWF0aXZlIGFydCBtYWtldXAuIEFic3RyYWN0IGNvbG91cmZ1bCBzcGxhc2ggbWFrZS11cC4gSG9saSBmZXN0aXZhbCwBAAABAAAALAEAAAEAAAD/4QYNaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pgo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIj4KCTxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+CgkJPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczpJcHRjNHhtcENvcmU9Imh0dHA6Ly9pcHRjLm9yZy9zdGQvSXB0YzR4bXBDb3JlLzEuMC94bWxucy8iICAgeG1sbnM6R2V0dHlJbWFnZXNHSUZUPSJodHRwOi8veG1wLmdldHR5aW1hZ2VzLmNvbS9naWZ0LzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGx1cz0iaHR0cDovL25zLnVzZXBsdXMub3JnL2xkZi94bXAvMS4wLyIgIHhtbG5zOmlwdGNFeHQ9Imh0dHA6Ly9pcHRjLm9yZy9zdGQvSXB0YzR4bXBFeHQvMjAwOC0wMi0yOS8iIHhtbG5zOnhtcFJpZ2h0cz0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3JpZ2h0cy8iIHBob3Rvc2hvcDpDcmVkaXQ9IkdldHR5IEltYWdlcy9pU3RvY2twaG90byIgR2V0dHlJbWFnZXNHSUZUOkFzc2V0SUQ9IjgxNDQyMzc1MiIgeG1wUmlnaHRzOldlYlN0YXRlbWVudD0iaHR0cHM6Ly93d3cuaXN0b2NrcGhvdG8uY29tL2xlZ2FsL2xpY2Vuc2UtYWdyZWVtZW50P3V0bV9tZWRpdW09b3JnYW5pYyZhbXA7dXRtX3NvdXJjZT1nb29nbGUmYW1wO3V0bV9jYW1wYWlnbj1pcHRjdXJsIiBwbHVzOkRhdGFNaW5pbmc9Imh0dHA6Ly9ucy51c2VwbHVzLm9yZy9sZGYvdm9jYWIvRE1JLVBST0hJQklURUQtRVhDRVBUU0VBUkNIRU5HSU5FSU5ERVhJTkciID4KPGRjOmNyZWF0b3I+PHJkZjpTZXE+PHJkZjpsaT5Qcm9zdG9jay1TdHVkaW88L3JkZjpsaT48L3JkZjpTZXE+PC9kYzpjcmVhdG9yPjxkYzpkZXNjcmlwdGlvbj48cmRmOkFsdD48cmRmOmxpIHhtbDpsYW5nPSJ4LWRlZmF1bHQiPkNyb3Agb2YgZmVtYWxlIGV5ZSB3aXRoIGNvbG9yZnVsIG1ha2UgdXAuIEJlYXV0aWZ1bCBmYXNoaW9uIG1vZGVsIHdpdGggY3JlYXRpdmUgYXJ0IG1ha2V1cC4gQWJzdHJhY3QgY29sb3VyZnVsIHNwbGFzaCBtYWtlLXVwLiBIb2xpIGZlc3RpdmFsPC9yZGY6bGk+PC9yZGY6QWx0PjwvZGM6ZGVzY3JpcHRpb24+CjxwbHVzOkxpY2Vuc29yPjxyZGY6U2VxPjxyZGY6bGkgcmRmOnBhcnNlVHlwZT0nUmVzb3VyY2UnPjxwbHVzOkxpY2Vuc29yVVJMPmh0dHBzOi8vd3d3LmlzdG9ja3Bob3RvLmNvbS9waG90by9saWNlbnNlLWdtODE0NDIzNzUyLT91dG1fbWVkaXVtPW9yZ2FuaWMmYW1wO3V0bV9zb3VyY2U9Z29vZ2xlJmFtcDt1dG1fY2FtcGFpZ249aXB0Y3VybDwvcGx1czpMaWNlbnNvclVSTD48L3JkZjpsaT48L3JkZjpTZXE+PC9wbHVzOkxpY2Vuc29yPgoJCTwvcmRmOkRlc2NyaXB0aW9uPgoJPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KPD94cGFja2V0IGVuZD0idyI/Pgr/7QDeUGhvdG9zaG9w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', '2026-01-26 09:08:39.484', '2026-01-26 11:58:08.442', 1, NULL);
INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `companyId`, `avatar`, `createdAt`, `updatedAt`, `loginEnabled`, `roleId`) VALUES
(4, 'User', 'user@gmail.com', '$2b$10$4xrsJJunjfQGVwvfoFgebOhYneoQd2ErsRuYu8omgioJeeXHOh8qi', 'Staff', 2, 'data:image/jpeg;base64,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', '2026-01-26 11:15:59.453', '2026-01-26 11:41:19.848', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `nameArabic` varchar(191) DEFAULT NULL,
  `companyName` varchar(191) DEFAULT NULL,
  `companyLocation` text DEFAULT NULL,
  `profileImage` longtext DEFAULT NULL,
  `anyFile` longtext DEFAULT NULL,
  `accountType` varchar(191) DEFAULT NULL,
  `balanceType` varchar(191) NOT NULL DEFAULT 'Credit',
  `accountName` varchar(191) DEFAULT NULL,
  `accountBalance` double NOT NULL DEFAULT 0,
  `creationDate` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `bankAccountNumber` varchar(191) DEFAULT NULL,
  `bankIFSC` varchar(191) DEFAULT NULL,
  `bankNameBranch` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `creditPeriod` int(11) DEFAULT NULL,
  `gstNumber` varchar(191) DEFAULT NULL,
  `gstEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `billingName` varchar(191) DEFAULT NULL,
  `billingPhone` varchar(191) DEFAULT NULL,
  `billingAddress` text DEFAULT NULL,
  `billingCity` varchar(191) DEFAULT NULL,
  `billingState` varchar(191) DEFAULT NULL,
  `billingCountry` varchar(191) DEFAULT NULL,
  `billingZipCode` varchar(191) DEFAULT NULL,
  `shippingSameAsBilling` tinyint(1) NOT NULL DEFAULT 0,
  `shippingName` varchar(191) DEFAULT NULL,
  `shippingPhone` varchar(191) DEFAULT NULL,
  `shippingAddress` text DEFAULT NULL,
  `shippingCity` varchar(191) DEFAULT NULL,
  `shippingState` varchar(191) DEFAULT NULL,
  `shippingCountry` varchar(191) DEFAULT NULL,
  `shippingZipCode` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `ledgerId` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `name`, `nameArabic`, `companyName`, `companyLocation`, `profileImage`, `anyFile`, `accountType`, `balanceType`, `accountName`, `accountBalance`, `creationDate`, `bankAccountNumber`, `bankIFSC`, `bankNameBranch`, `phone`, `email`, `creditPeriod`, `gstNumber`, `gstEnabled`, `billingName`, `billingPhone`, `billingAddress`, `billingCity`, `billingState`, `billingCountry`, `billingZipCode`, `shippingSameAsBilling`, `shippingName`, `shippingPhone`, `shippingAddress`, `shippingCity`, `shippingState`, `shippingCountry`, `shippingZipCode`, `companyId`, `ledgerId`, `createdAt`, `updatedAt`) VALUES
(1, 'Start Company Pvt. Ltd.', 'Start Company Pvt. Ltd.', 'Start Company Pvt. Ltd.', 'indore', '', '', '', 'Credit', 'Start Company Pvt. Ltd.', 780000, '2026-01-26 00:00:00.000', 'SBI', 'SBI4152', 'SBI', '94564566678', 'star@gmail.com', 12, '4653', 1, 'indore', '94564566678', 'indore', 'indore', 'Madhya Pradesh', 'India', '4514465', 0, 'indore', '94564566678', 'indore', 'indore', 'Madhya Pradesh', 'India', '4514465', 2, 9, '2026-01-26 09:19:17.719', '2026-01-27 09:07:00.967'),
(2, 'XYZ Pvt. Ltd.', 'XYZ Pvt. Ltd.', 'XYZ Pvt. Ltd.', 'indore', '', '', '', 'Credit', 'XYZ Pvt. Ltd.', 660000, '2026-01-26 00:00:00.000', 'BOI', 'BOI4152', 'BOI', '94564566678', 'xyz@gmail.com', 45, '976856345', 1, 'indore', '94564566678', 'indore', 'indore', 'Madhya Pradesh', 'India', '4514465', 0, 'indore', '94564566678', 'indore', 'indore', 'Madhya Pradesh', 'India', '4514465', 2, 10, '2026-01-26 09:20:07.051', '2026-01-26 12:49:17.770');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` int(11) NOT NULL,
  `voucherNumber` varchar(191) NOT NULL,
  `voucherType` enum('EXPENSE','INCOME','CONTRA') NOT NULL,
  `date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `companyId` int(11) NOT NULL,
  `companyName` varchar(191) DEFAULT NULL,
  `logo` longtext DEFAULT NULL,
  `paidFromLedgerId` int(11) DEFAULT NULL,
  `paidToLedgerId` int(11) DEFAULT NULL,
  `paidFromAccount` varchar(191) DEFAULT NULL,
  `paidToParty` varchar(191) DEFAULT NULL,
  `vendorId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `subtotal` double NOT NULL DEFAULT 0,
  `totalAmount` double NOT NULL,
  `notes` text DEFAULT NULL,
  `signature` longtext DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `voucherNumber`, `voucherType`, `date`, `companyId`, `companyName`, `logo`, `paidFromLedgerId`, `paidToLedgerId`, `paidFromAccount`, `paidToParty`, `vendorId`, `customerId`, `subtotal`, `totalAmount`, `notes`, `signature`, `createdAt`, `updatedAt`) VALUES
(1, 'V-2026-505', 'EXPENSE', '2026-01-26 00:00:00.000', 2, 'Company', 'data:image/png;base64,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', 1, 10, 'Cash in Hand', 'XYZ Pvt. Ltd.', NULL, NULL, 700000, 700000, 'Test', NULL, '2026-01-26 09:28:53.953', '2026-01-26 09:56:17.093');

-- --------------------------------------------------------

--
-- Table structure for table `voucheritem`
--

CREATE TABLE `voucheritem` (
  `id` int(11) NOT NULL,
  `voucherId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `productName` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `rate` double NOT NULL,
  `amount` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voucheritem`
--

INSERT INTO `voucheritem` (`id`, `voucherId`, `productId`, `productName`, `description`, `quantity`, `rate`, `amount`, `createdAt`, `updatedAt`) VALUES
(3, 1, NULL, 'Laptop', NULL, 10, 70000, 700000, '2026-01-26 09:56:17.093', '2026-01-26 09:56:17.093');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `addressLine1` varchar(191) DEFAULT NULL,
  `addressLine2` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postalCode` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `companyId` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `name`, `location`, `addressLine1`, `addressLine2`, `city`, `state`, `postalCode`, `country`, `companyId`, `createdAt`, `updatedAt`) VALUES
(1, 'Main Warehouse', 'indore', 'indore', 'Indore', 'indore', 'Madhya Pradesh', '4514465', 'India', 2, '2026-01-26 09:20:34.081', '2026-01-26 09:20:34.081'),
(2, 'Warehouse Hub', 'Mumbai', 'Mumbai , Maharashtra', 'Mumbai , Maharashtra', 'Mumbai', 'Maharashtra', '451440', 'India', 2, '2026-01-26 09:20:59.050', '2026-01-26 09:20:59.050');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('16a0c5c8-d390-4b46-8ffb-412d534b95a3', '439dd5608b768a9caed7dd32849228dd5654922474d323e55f2d47f7a1160826', '2026-01-26 08:49:37.944', '20260122122920_purchase_workflow_fix_2', NULL, NULL, '2026-01-26 08:49:36.381', 1),
('2f5f69f1-333f-41cd-bff9-ae6f4a55bf0e', 'de3eb714704d486aa5e5561fe27206716004b9c2323e8c5dc0bee445fafb6d89', '2026-01-26 08:49:36.238', '20260121114319_add_inventory_config_and_reserved_qty', NULL, NULL, '2026-01-26 08:49:36.225', 1),
('52eff3f9-4401-499d-acc8-3929806f2f7a', 'f8c25529243f570b9d5e2ed6b9c8b84841d68b80a85f10b5821094fb246d184b', '2026-01-26 08:49:36.206', '20260121104517_link_invoice_to_challan', NULL, NULL, '2026-01-26 08:49:36.147', 1),
('5b9fd055-841d-419b-98d2-7e7fe405c72f', '9090595c24e9d74ca46c202635fb0f14feb46961f9bdf0006a598df9f205f43b', '2026-01-26 08:49:36.146', '20260121095406_add_discount_to_items', NULL, NULL, '2026-01-26 08:49:31.296', 1),
('60125733-15ba-430a-9870-0c082a65e7d7', 'e4f3c067bd31becc6aa8ee6bd52829b41b73d5f177a44a243ebb97d7fd7b0093', '2026-01-26 08:49:36.215', '20260121110103_add_description_to_challan_item', NULL, NULL, '2026-01-26 08:49:36.208', 1),
('b9fc95a1-9fd6-4727-9d0b-518bb90c5bd7', 'a4b59c6cfcb0f85dd58d2f1328a4c4ee200f70198302920d0d32479039d3be8b', '2026-01-26 08:49:36.371', '20260121135246_update_invoice_warehouse_relations', NULL, NULL, '2026-01-26 08:49:36.328', 1),
('c6f1bf67-4bba-4cd7-8fa5-8b26952d4ddc', '9051ef21783094ca0f7e777c0869e11eb78f4440a28e1836d9287cc04eadc76b', '2026-01-26 08:49:36.224', '20260121110224_add_shipping_fields_to_challan', NULL, NULL, '2026-01-26 08:49:36.216', 1),
('e21d8e20-b113-43b6-acdd-bc9ab4187656', '4d915ae36a2805d09545aa52b7a61d9f954f4ae545b5522a9b72cc796209f4e7', '2026-01-26 08:49:53.389', '20260126084952_add_voucher_models', NULL, NULL, '2026-01-26 08:49:52.281', 1),
('e7ff5532-a701-4321-90b1-85fdd3403be7', '12cb385fef6aec196cc726132f576ae2e9cd2f4b63ba41aac11b277d7181f83f', '2026-01-26 08:49:36.379', '20260122110723_add_fields_to_sales_return', NULL, NULL, '2026-01-26 08:49:36.372', 1),
('fe2cc836-c7cd-490a-ae36-a1556fa58175', 'e0004ea46358d12f2dc6e65b017cc08d2bf0d81fdcc01130f677830f73555a6d', '2026-01-26 08:49:36.327', '20260121114437_add_warehouse_to_sales_docs', NULL, NULL, '2026-01-26 08:49:36.239', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountgroup`
--
ALTER TABLE `accountgroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `AccountGroup_companyId_name_key` (`companyId`,`name`);

--
-- Indexes for table `accountsubgroup`
--
ALTER TABLE `accountsubgroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `AccountSubGroup_companyId_groupId_name_key` (`companyId`,`groupId`,`name`),
  ADD KEY `AccountSubGroup_groupId_fkey` (`groupId`);

--
-- Indexes for table `bankaccount`
--
ALTER TABLE `bankaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BankAccount_companyId_accountNumber_key` (`companyId`,`accountNumber`);

--
-- Indexes for table `banktransaction`
--
ALTER TABLE `banktransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BankTransaction_bankAccountId_fkey` (`bankAccountId`),
  ADD KEY `BankTransaction_companyId_fkey` (`companyId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Category_companyId_name_key` (`companyId`,`name`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Company_email_key` (`email`),
  ADD KEY `Company_planId_fkey` (`planId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Customer_companyId_email_key` (`companyId`,`email`);

--
-- Indexes for table `dashboardannouncement`
--
ALTER TABLE `dashboardannouncement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverychallan`
--
ALTER TABLE `deliverychallan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `DeliveryChallan_companyId_challanNumber_key` (`companyId`,`challanNumber`),
  ADD KEY `DeliveryChallan_customerId_fkey` (`customerId`),
  ADD KEY `DeliveryChallan_salesOrderId_fkey` (`salesOrderId`);

--
-- Indexes for table `deliverychallanitem`
--
ALTER TABLE `deliverychallanitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DeliveryChallanItem_challanId_fkey` (`challanId`),
  ADD KEY `DeliveryChallanItem_productId_fkey` (`productId`),
  ADD KEY `DeliveryChallanItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `expenseentry`
--
ALTER TABLE `expenseentry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ExpenseEntry_companyId_fkey` (`companyId`);

--
-- Indexes for table `goodsreceiptnote`
--
ALTER TABLE `goodsreceiptnote`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `GoodsReceiptNote_companyId_grnNumber_key` (`companyId`,`grnNumber`),
  ADD KEY `GoodsReceiptNote_vendorId_fkey` (`vendorId`),
  ADD KEY `GoodsReceiptNote_purchaseOrderId_fkey` (`purchaseOrderId`);

--
-- Indexes for table `goodsreceiptnoteitem`
--
ALTER TABLE `goodsreceiptnoteitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GoodsReceiptNoteItem_grnId_fkey` (`grnId`),
  ADD KEY `GoodsReceiptNoteItem_productId_fkey` (`productId`),
  ADD KEY `GoodsReceiptNoteItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `incomeentry`
--
ALTER TABLE `incomeentry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IncomeEntry_companyId_fkey` (`companyId`);

--
-- Indexes for table `inventoryadjustment`
--
ALTER TABLE `inventoryadjustment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `InventoryAdjustment_companyId_voucherNo_key` (`companyId`,`voucherNo`),
  ADD KEY `InventoryAdjustment_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `inventoryadjustmentitem`
--
ALTER TABLE `inventoryadjustmentitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `InventoryAdjustmentItem_inventoryAdjustmentId_fkey` (`inventoryAdjustmentId`),
  ADD KEY `InventoryAdjustmentItem_productId_fkey` (`productId`),
  ADD KEY `InventoryAdjustmentItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `inventorytransaction`
--
ALTER TABLE `inventorytransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `InventoryTransaction_productId_fkey` (`productId`),
  ADD KEY `InventoryTransaction_fromWarehouseId_fkey` (`fromWarehouseId`),
  ADD KEY `InventoryTransaction_toWarehouseId_fkey` (`toWarehouseId`),
  ADD KEY `InventoryTransaction_companyId_fkey` (`companyId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Invoice_companyId_invoiceNumber_key` (`companyId`,`invoiceNumber`),
  ADD KEY `Invoice_customerId_fkey` (`customerId`),
  ADD KEY `Invoice_salesOrderId_fkey` (`salesOrderId`),
  ADD KEY `Invoice_deliveryChallanId_fkey` (`deliveryChallanId`);

--
-- Indexes for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `InvoiceItem_invoiceId_fkey` (`invoiceId`),
  ADD KEY `InvoiceItem_productId_fkey` (`productId`),
  ADD KEY `InvoiceItem_serviceId_fkey` (`serviceId`),
  ADD KEY `InvoiceItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `journalentry`
--
ALTER TABLE `journalentry`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `JournalEntry_companyId_voucherNumber_key` (`companyId`,`voucherNumber`);

--
-- Indexes for table `ledger`
--
ALTER TABLE `ledger`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Ledger_companyId_name_key` (`companyId`,`name`),
  ADD UNIQUE KEY `Ledger_customerId_key` (`customerId`),
  ADD UNIQUE KEY `Ledger_vendorId_key` (`vendorId`),
  ADD KEY `Ledger_groupId_fkey` (`groupId`),
  ADD KEY `Ledger_subGroupId_fkey` (`subGroupId`),
  ADD KEY `Ledger_parentLedgerId_fkey` (`parentLedgerId`);

--
-- Indexes for table `passwordrequest`
--
ALTER TABLE `passwordrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PasswordRequest_userId_fkey` (`userId`),
  ADD KEY `PasswordRequest_companyId_fkey` (`companyId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Payment_companyId_paymentNumber_key` (`companyId`,`paymentNumber`),
  ADD KEY `Payment_vendorId_fkey` (`vendorId`),
  ADD KEY `Payment_purchaseBillId_fkey` (`purchaseBillId`);

--
-- Indexes for table `paymentrecord`
--
ALTER TABLE `paymentrecord`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PaymentRecord_transactionId_key` (`transactionId`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planrequest`
--
ALTER TABLE `planrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PlanRequest_planId_fkey` (`planId`);

--
-- Indexes for table `posinvoice`
--
ALTER TABLE `posinvoice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PosInvoice_companyId_invoiceNumber_key` (`companyId`,`invoiceNumber`),
  ADD KEY `PosInvoice_customerId_fkey` (`customerId`);

--
-- Indexes for table `posinvoiceitem`
--
ALTER TABLE `posinvoiceitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PosInvoiceItem_posInvoiceId_fkey` (`posInvoiceId`),
  ADD KEY `PosInvoiceItem_productId_fkey` (`productId`),
  ADD KEY `PosInvoiceItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Product_companyId_name_key` (`companyId`,`name`),
  ADD KEY `Product_categoryId_fkey` (`categoryId`),
  ADD KEY `Product_uomId_fkey` (`uomId`);

--
-- Indexes for table `purchasebill`
--
ALTER TABLE `purchasebill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PurchaseBill_companyId_billNumber_key` (`companyId`,`billNumber`),
  ADD KEY `PurchaseBill_vendorId_fkey` (`vendorId`),
  ADD KEY `PurchaseBill_purchaseOrderId_fkey` (`purchaseOrderId`),
  ADD KEY `PurchaseBill_grnId_fkey` (`grnId`);

--
-- Indexes for table `purchasebillitem`
--
ALTER TABLE `purchasebillitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PurchaseBillItem_purchaseBillId_fkey` (`purchaseBillId`),
  ADD KEY `PurchaseBillItem_productId_fkey` (`productId`),
  ADD KEY `PurchaseBillItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PurchaseOrder_companyId_orderNumber_key` (`companyId`,`orderNumber`),
  ADD UNIQUE KEY `PurchaseOrder_quotationId_key` (`quotationId`),
  ADD KEY `PurchaseOrder_vendorId_fkey` (`vendorId`);

--
-- Indexes for table `purchaseorderitem`
--
ALTER TABLE `purchaseorderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PurchaseOrderItem_orderId_fkey` (`orderId`),
  ADD KEY `PurchaseOrderItem_productId_fkey` (`productId`),
  ADD KEY `PurchaseOrderItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `purchasequotation`
--
ALTER TABLE `purchasequotation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PurchaseQuotation_companyId_quotationNumber_key` (`companyId`,`quotationNumber`),
  ADD KEY `PurchaseQuotation_vendorId_fkey` (`vendorId`);

--
-- Indexes for table `purchasequotationitem`
--
ALTER TABLE `purchasequotationitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PurchaseQuotationItem_quotationId_fkey` (`quotationId`),
  ADD KEY `PurchaseQuotationItem_productId_fkey` (`productId`),
  ADD KEY `PurchaseQuotationItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `purchasereturn`
--
ALTER TABLE `purchasereturn`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PurchaseReturn_companyId_returnNumber_key` (`companyId`,`returnNumber`),
  ADD KEY `PurchaseReturn_vendorId_fkey` (`vendorId`),
  ADD KEY `PurchaseReturn_purchaseBillId_fkey` (`purchaseBillId`);

--
-- Indexes for table `purchasereturnitem`
--
ALTER TABLE `purchasereturnitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PurchaseReturnItem_purchaseReturnId_fkey` (`purchaseReturnId`),
  ADD KEY `PurchaseReturnItem_productId_fkey` (`productId`),
  ADD KEY `PurchaseReturnItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Receipt_companyId_receiptNumber_key` (`companyId`,`receiptNumber`),
  ADD KEY `Receipt_customerId_fkey` (`customerId`),
  ADD KEY `Receipt_invoiceId_fkey` (`invoiceId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_companyId_name_key` (`companyId`,`name`),
  ADD KEY `role_companyId_idx` (`companyId`);

--
-- Indexes for table `salesorder`
--
ALTER TABLE `salesorder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SalesOrder_companyId_orderNumber_key` (`companyId`,`orderNumber`),
  ADD UNIQUE KEY `SalesOrder_quotationId_key` (`quotationId`),
  ADD KEY `SalesOrder_customerId_fkey` (`customerId`);

--
-- Indexes for table `salesorderitem`
--
ALTER TABLE `salesorderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SalesOrderItem_orderId_fkey` (`orderId`),
  ADD KEY `SalesOrderItem_productId_fkey` (`productId`),
  ADD KEY `SalesOrderItem_serviceId_fkey` (`serviceId`),
  ADD KEY `SalesOrderItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `salesquotation`
--
ALTER TABLE `salesquotation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SalesQuotation_companyId_quotationNumber_key` (`companyId`,`quotationNumber`),
  ADD KEY `SalesQuotation_customerId_fkey` (`customerId`);

--
-- Indexes for table `salesquotationitem`
--
ALTER TABLE `salesquotationitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SalesQuotationItem_quotationId_fkey` (`quotationId`),
  ADD KEY `SalesQuotationItem_productId_fkey` (`productId`),
  ADD KEY `SalesQuotationItem_serviceId_fkey` (`serviceId`),
  ADD KEY `SalesQuotationItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `salesreturn`
--
ALTER TABLE `salesreturn`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SalesReturn_companyId_returnNumber_key` (`companyId`,`returnNumber`),
  ADD KEY `SalesReturn_customerId_fkey` (`customerId`),
  ADD KEY `SalesReturn_invoiceId_fkey` (`invoiceId`);

--
-- Indexes for table `salesreturnitem`
--
ALTER TABLE `salesreturnitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SalesReturnItem_salesReturnId_fkey` (`salesReturnId`),
  ADD KEY `SalesReturnItem_productId_fkey` (`productId`),
  ADD KEY `SalesReturnItem_warehouseId_fkey` (`warehouseId`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Service_companyId_name_key` (`companyId`,`name`),
  ADD KEY `Service_uomId_fkey` (`uomId`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Stock_warehouseId_productId_key` (`warehouseId`,`productId`),
  ADD KEY `Stock_productId_fkey` (`productId`);

--
-- Indexes for table `stocktransfer`
--
ALTER TABLE `stocktransfer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StockTransfer_companyId_voucherNo_key` (`companyId`,`voucherNo`),
  ADD KEY `StockTransfer_toWarehouseId_fkey` (`toWarehouseId`);

--
-- Indexes for table `stocktransferitem`
--
ALTER TABLE `stocktransferitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StockTransferItem_stockTransferId_fkey` (`stockTransferId`),
  ADD KEY `StockTransferItem_productId_fkey` (`productId`),
  ADD KEY `StockTransferItem_fromWarehouseId_fkey` (`fromWarehouseId`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Transaction_debitLedgerId_fkey` (`debitLedgerId`),
  ADD KEY `Transaction_creditLedgerId_fkey` (`creditLedgerId`),
  ADD KEY `Transaction_companyId_fkey` (`companyId`),
  ADD KEY `Transaction_journalEntryId_fkey` (`journalEntryId`),
  ADD KEY `Transaction_invoiceId_fkey` (`invoiceId`),
  ADD KEY `Transaction_purchaseBillId_fkey` (`purchaseBillId`),
  ADD KEY `Transaction_receiptId_fkey` (`receiptId`),
  ADD KEY `Transaction_paymentId_fkey` (`paymentId`),
  ADD KEY `Transaction_posInvoiceId_fkey` (`posInvoiceId`);

--
-- Indexes for table `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UOM_companyId_category_unitName_key` (`companyId`,`category`,`unitName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_email_key` (`email`),
  ADD KEY `User_companyId_fkey` (`companyId`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Vendor_companyId_email_key` (`companyId`,`email`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `voucher_companyId_voucherNumber_key` (`companyId`,`voucherNumber`),
  ADD KEY `voucher_vendorId_idx` (`vendorId`),
  ADD KEY `voucher_customerId_idx` (`customerId`),
  ADD KEY `voucher_paidFromLedgerId_idx` (`paidFromLedgerId`),
  ADD KEY `voucher_paidToLedgerId_idx` (`paidToLedgerId`);

--
-- Indexes for table `voucheritem`
--
ALTER TABLE `voucheritem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucheritem_voucherId_idx` (`voucherId`),
  ADD KEY `voucheritem_productId_idx` (`productId`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Warehouse_companyId_name_key` (`companyId`,`name`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountgroup`
--
ALTER TABLE `accountgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `accountsubgroup`
--
ALTER TABLE `accountsubgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bankaccount`
--
ALTER TABLE `bankaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banktransaction`
--
ALTER TABLE `banktransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dashboardannouncement`
--
ALTER TABLE `dashboardannouncement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverychallan`
--
ALTER TABLE `deliverychallan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deliverychallanitem`
--
ALTER TABLE `deliverychallanitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expenseentry`
--
ALTER TABLE `expenseentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goodsreceiptnote`
--
ALTER TABLE `goodsreceiptnote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `goodsreceiptnoteitem`
--
ALTER TABLE `goodsreceiptnoteitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `incomeentry`
--
ALTER TABLE `incomeentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventoryadjustment`
--
ALTER TABLE `inventoryadjustment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventoryadjustmentitem`
--
ALTER TABLE `inventoryadjustmentitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventorytransaction`
--
ALTER TABLE `inventorytransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `journalentry`
--
ALTER TABLE `journalentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ledger`
--
ALTER TABLE `ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `passwordrequest`
--
ALTER TABLE `passwordrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paymentrecord`
--
ALTER TABLE `paymentrecord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planrequest`
--
ALTER TABLE `planrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posinvoice`
--
ALTER TABLE `posinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posinvoiceitem`
--
ALTER TABLE `posinvoiceitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchasebill`
--
ALTER TABLE `purchasebill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchasebillitem`
--
ALTER TABLE `purchasebillitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchaseorderitem`
--
ALTER TABLE `purchaseorderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchasequotation`
--
ALTER TABLE `purchasequotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchasequotationitem`
--
ALTER TABLE `purchasequotationitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchasereturn`
--
ALTER TABLE `purchasereturn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchasereturnitem`
--
ALTER TABLE `purchasereturnitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salesorder`
--
ALTER TABLE `salesorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salesorderitem`
--
ALTER TABLE `salesorderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `salesquotation`
--
ALTER TABLE `salesquotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salesquotationitem`
--
ALTER TABLE `salesquotationitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `salesreturn`
--
ALTER TABLE `salesreturn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salesreturnitem`
--
ALTER TABLE `salesreturnitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stocktransfer`
--
ALTER TABLE `stocktransfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stocktransferitem`
--
ALTER TABLE `stocktransferitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `uom`
--
ALTER TABLE `uom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `voucheritem`
--
ALTER TABLE `voucheritem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountgroup`
--
ALTER TABLE `accountgroup`
  ADD CONSTRAINT `AccountGroup_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `accountsubgroup`
--
ALTER TABLE `accountsubgroup`
  ADD CONSTRAINT `AccountSubGroup_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `AccountSubGroup_groupId_fkey` FOREIGN KEY (`groupId`) REFERENCES `accountgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bankaccount`
--
ALTER TABLE `bankaccount`
  ADD CONSTRAINT `BankAccount_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `banktransaction`
--
ALTER TABLE `banktransaction`
  ADD CONSTRAINT `BankTransaction_bankAccountId_fkey` FOREIGN KEY (`bankAccountId`) REFERENCES `bankaccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `BankTransaction_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `Category_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `Company_planId_fkey` FOREIGN KEY (`planId`) REFERENCES `plan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `Customer_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deliverychallan`
--
ALTER TABLE `deliverychallan`
  ADD CONSTRAINT `DeliveryChallan_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `DeliveryChallan_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `DeliveryChallan_salesOrderId_fkey` FOREIGN KEY (`salesOrderId`) REFERENCES `salesorder` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `deliverychallanitem`
--
ALTER TABLE `deliverychallanitem`
  ADD CONSTRAINT `DeliveryChallanItem_challanId_fkey` FOREIGN KEY (`challanId`) REFERENCES `deliverychallan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `DeliveryChallanItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `DeliveryChallanItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `expenseentry`
--
ALTER TABLE `expenseentry`
  ADD CONSTRAINT `ExpenseEntry_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `goodsreceiptnote`
--
ALTER TABLE `goodsreceiptnote`
  ADD CONSTRAINT `GoodsReceiptNote_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `GoodsReceiptNote_purchaseOrderId_fkey` FOREIGN KEY (`purchaseOrderId`) REFERENCES `purchaseorder` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `GoodsReceiptNote_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendor` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `goodsreceiptnoteitem`
--
ALTER TABLE `goodsreceiptnoteitem`
  ADD CONSTRAINT `GoodsReceiptNoteItem_grnId_fkey` FOREIGN KEY (`grnId`) REFERENCES `goodsreceiptnote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `GoodsReceiptNoteItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `GoodsReceiptNoteItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `incomeentry`
--
ALTER TABLE `incomeentry`
  ADD CONSTRAINT `IncomeEntry_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventoryadjustment`
--
ALTER TABLE `inventoryadjustment`
  ADD CONSTRAINT `InventoryAdjustment_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `InventoryAdjustment_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `inventoryadjustmentitem`
--
ALTER TABLE `inventoryadjustmentitem`
  ADD CONSTRAINT `InventoryAdjustmentItem_inventoryAdjustmentId_fkey` FOREIGN KEY (`inventoryAdjustmentId`) REFERENCES `inventoryadjustment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `InventoryAdjustmentItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `InventoryAdjustmentItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `inventorytransaction`
--
ALTER TABLE `inventorytransaction`
  ADD CONSTRAINT `InventoryTransaction_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `InventoryTransaction_fromWarehouseId_fkey` FOREIGN KEY (`fromWarehouseId`) REFERENCES `warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `InventoryTransaction_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `InventoryTransaction_toWarehouseId_fkey` FOREIGN KEY (`toWarehouseId`) REFERENCES `warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `Invoice_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Invoice_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Invoice_deliveryChallanId_fkey` FOREIGN KEY (`deliveryChallanId`) REFERENCES `deliverychallan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Invoice_salesOrderId_fkey` FOREIGN KEY (`salesOrderId`) REFERENCES `salesorder` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `invoiceitem`
--
ALTER TABLE `invoiceitem`
  ADD CONSTRAINT `InvoiceItem_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `InvoiceItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `InvoiceItem_serviceId_fkey` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `InvoiceItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `journalentry`
--
ALTER TABLE `journalentry`
  ADD CONSTRAINT `JournalEntry_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ledger`
--
ALTER TABLE `ledger`
  ADD CONSTRAINT `Ledger_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Ledger_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Ledger_groupId_fkey` FOREIGN KEY (`groupId`) REFERENCES `accountgroup` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Ledger_parentLedgerId_fkey` FOREIGN KEY (`parentLedgerId`) REFERENCES `ledger` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Ledger_subGroupId_fkey` FOREIGN KEY (`subGroupId`) REFERENCES `accountsubgroup` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Ledger_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `passwordrequest`
--
ALTER TABLE `passwordrequest`
  ADD CONSTRAINT `PasswordRequest_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PasswordRequest_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `Payment_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Payment_purchaseBillId_fkey` FOREIGN KEY (`purchaseBillId`) REFERENCES `purchasebill` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Payment_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendor` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `planrequest`
--
ALTER TABLE `planrequest`
  ADD CONSTRAINT `PlanRequest_planId_fkey` FOREIGN KEY (`planId`) REFERENCES `plan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `posinvoice`
--
ALTER TABLE `posinvoice`
  ADD CONSTRAINT `PosInvoice_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PosInvoice_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `posinvoiceitem`
--
ALTER TABLE `posinvoiceitem`
  ADD CONSTRAINT `PosInvoiceItem_posInvoiceId_fkey` FOREIGN KEY (`posInvoiceId`) REFERENCES `posinvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PosInvoiceItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PosInvoiceItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Product_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Product_uomId_fkey` FOREIGN KEY (`uomId`) REFERENCES `uom` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `purchasebill`
--
ALTER TABLE `purchasebill`
  ADD CONSTRAINT `PurchaseBill_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseBill_grnId_fkey` FOREIGN KEY (`grnId`) REFERENCES `goodsreceiptnote` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseBill_purchaseOrderId_fkey` FOREIGN KEY (`purchaseOrderId`) REFERENCES `purchaseorder` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseBill_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendor` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchasebillitem`
--
ALTER TABLE `purchasebillitem`
  ADD CONSTRAINT `PurchaseBillItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseBillItem_purchaseBillId_fkey` FOREIGN KEY (`purchaseBillId`) REFERENCES `purchasebill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseBillItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD CONSTRAINT `PurchaseOrder_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseOrder_quotationId_fkey` FOREIGN KEY (`quotationId`) REFERENCES `purchasequotation` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseOrder_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendor` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchaseorderitem`
--
ALTER TABLE `purchaseorderitem`
  ADD CONSTRAINT `PurchaseOrderItem_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `purchaseorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseOrderItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseOrderItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `purchasequotation`
--
ALTER TABLE `purchasequotation`
  ADD CONSTRAINT `PurchaseQuotation_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseQuotation_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendor` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchasequotationitem`
--
ALTER TABLE `purchasequotationitem`
  ADD CONSTRAINT `PurchaseQuotationItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseQuotationItem_quotationId_fkey` FOREIGN KEY (`quotationId`) REFERENCES `purchasequotation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseQuotationItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `purchasereturn`
--
ALTER TABLE `purchasereturn`
  ADD CONSTRAINT `PurchaseReturn_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseReturn_purchaseBillId_fkey` FOREIGN KEY (`purchaseBillId`) REFERENCES `purchasebill` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseReturn_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendor` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchasereturnitem`
--
ALTER TABLE `purchasereturnitem`
  ADD CONSTRAINT `PurchaseReturnItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseReturnItem_purchaseReturnId_fkey` FOREIGN KEY (`purchaseReturnId`) REFERENCES `purchasereturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PurchaseReturnItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `Receipt_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Receipt_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Receipt_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesorder`
--
ALTER TABLE `salesorder`
  ADD CONSTRAINT `SalesOrder_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesOrder_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesOrder_quotationId_fkey` FOREIGN KEY (`quotationId`) REFERENCES `salesquotation` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `salesorderitem`
--
ALTER TABLE `salesorderitem`
  ADD CONSTRAINT `SalesOrderItem_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `salesorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesOrderItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesOrderItem_serviceId_fkey` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesOrderItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `salesquotation`
--
ALTER TABLE `salesquotation`
  ADD CONSTRAINT `SalesQuotation_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesQuotation_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `salesquotationitem`
--
ALTER TABLE `salesquotationitem`
  ADD CONSTRAINT `SalesQuotationItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesQuotationItem_quotationId_fkey` FOREIGN KEY (`quotationId`) REFERENCES `salesquotation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesQuotationItem_serviceId_fkey` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesQuotationItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `salesreturn`
--
ALTER TABLE `salesreturn`
  ADD CONSTRAINT `SalesReturn_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesReturn_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesReturn_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `salesreturnitem`
--
ALTER TABLE `salesreturnitem`
  ADD CONSTRAINT `SalesReturnItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesReturnItem_salesReturnId_fkey` FOREIGN KEY (`salesReturnId`) REFERENCES `salesreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SalesReturnItem_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `Service_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Service_uomId_fkey` FOREIGN KEY (`uomId`) REFERENCES `uom` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `Stock_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Stock_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stocktransfer`
--
ALTER TABLE `stocktransfer`
  ADD CONSTRAINT `StockTransfer_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `StockTransfer_toWarehouseId_fkey` FOREIGN KEY (`toWarehouseId`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `stocktransferitem`
--
ALTER TABLE `stocktransferitem`
  ADD CONSTRAINT `StockTransferItem_fromWarehouseId_fkey` FOREIGN KEY (`fromWarehouseId`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `StockTransferItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `StockTransferItem_stockTransferId_fkey` FOREIGN KEY (`stockTransferId`) REFERENCES `stocktransfer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `Transaction_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Transaction_creditLedgerId_fkey` FOREIGN KEY (`creditLedgerId`) REFERENCES `ledger` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Transaction_debitLedgerId_fkey` FOREIGN KEY (`debitLedgerId`) REFERENCES `ledger` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Transaction_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Transaction_journalEntryId_fkey` FOREIGN KEY (`journalEntryId`) REFERENCES `journalentry` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Transaction_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Transaction_posInvoiceId_fkey` FOREIGN KEY (`posInvoiceId`) REFERENCES `posinvoice` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Transaction_purchaseBillId_fkey` FOREIGN KEY (`purchaseBillId`) REFERENCES `purchasebill` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Transaction_receiptId_fkey` FOREIGN KEY (`receiptId`) REFERENCES `receipt` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `uom`
--
ALTER TABLE `uom`
  ADD CONSTRAINT `UOM_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `User_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `vendor`
--
ALTER TABLE `vendor`
  ADD CONSTRAINT `Vendor_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `voucher_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voucher_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `voucher_paidFromLedgerId_fkey` FOREIGN KEY (`paidFromLedgerId`) REFERENCES `ledger` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `voucher_paidToLedgerId_fkey` FOREIGN KEY (`paidToLedgerId`) REFERENCES `ledger` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `voucher_vendorId_fkey` FOREIGN KEY (`vendorId`) REFERENCES `vendor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `voucheritem`
--
ALTER TABLE `voucheritem`
  ADD CONSTRAINT `voucheritem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `voucheritem_voucherId_fkey` FOREIGN KEY (`voucherId`) REFERENCES `voucher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `Warehouse_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
