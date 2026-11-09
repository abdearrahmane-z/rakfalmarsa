-- CreateTable
CREATE TABLE `AdminUser` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `passwordHash` VARCHAR(191) NOT NULL,
    `role` ENUM('ADMIN', 'EDITOR') NOT NULL DEFAULT 'EDITOR',
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `AdminUser_email_key`(`email`),
    INDEX `AdminUser_role_isActive_idx`(`role`, `isActive`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SiteSettings` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `siteName` VARCHAR(191) NOT NULL DEFAULT 'راك فالمـرسى',
    `tagline` VARCHAR(500) NULL,
    `logoMediaId` INTEGER NULL,
    `heroMediaId` INTEGER NULL,
    `phone` VARCHAR(50) NULL,
    `email` VARCHAR(191) NULL,
    `address` VARCHAR(500) NULL,
    `workingHours` VARCHAR(500) NULL,
    `facebookUrl` VARCHAR(500) NULL,
    `instagramUrl` VARCHAR(500) NULL,
    `youtubeUrl` VARCHAR(500) NULL,
    `latitude` DECIMAL(10, 7) NULL,
    `longitude` DECIMAL(10, 7) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Media` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `storageKey` VARCHAR(500) NOT NULL,
    `originalName` VARCHAR(255) NULL,
    `altText` VARCHAR(500) NULL,
    `mimeType` VARCHAR(100) NOT NULL,
    `sizeBytes` INTEGER NULL,
    `width` INTEGER NULL,
    `height` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Media_storageKey_key`(`storageKey`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TouristPlace` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `shortText` VARCHAR(500) NULL,
    `description` TEXT NULL,
    `address` VARCHAR(500) NULL,
    `latitude` DECIMAL(10, 7) NULL,
    `longitude` DECIMAL(10, 7) NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `featured` BOOLEAN NOT NULL DEFAULT false,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `coverMediaId` INTEGER NULL,

    UNIQUE INDEX `TouristPlace_slug_key`(`slug`),
    INDEX `TouristPlace_status_featured_sortOrder_idx`(`status`, `featured`, `sortOrder`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Experience` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `shortText` VARCHAR(500) NULL,
    `description` TEXT NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `featured` BOOLEAN NOT NULL DEFAULT false,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `coverMediaId` INTEGER NULL,

    UNIQUE INDEX `Experience_slug_key`(`slug`),
    INDEX `Experience_status_featured_sortOrder_idx`(`status`, `featured`, `sortOrder`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `NewsPost` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `excerpt` VARCHAR(1000) NULL,
    `content` LONGTEXT NOT NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `publishedAt` DATETIME(3) NULL,
    `authorId` INTEGER NOT NULL,
    `coverMediaId` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `NewsPost_slug_key`(`slug`),
    INDEX `NewsPost_status_publishedAt_idx`(`status`, `publishedAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Event` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `excerpt` VARCHAR(1000) NULL,
    `description` TEXT NULL,
    `location` VARCHAR(500) NULL,
    `startsAt` DATETIME(3) NOT NULL,
    `endsAt` DATETIME(3) NULL,
    `status` ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `organizerId` INTEGER NOT NULL,
    `coverMediaId` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Event_slug_key`(`slug`),
    INDEX `Event_status_startsAt_idx`(`status`, `startsAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ContactMessage` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fullName` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `message` TEXT NOT NULL,
    `status` ENUM('UNREAD', 'READ', 'REPLIED', 'ARCHIVED') NOT NULL DEFAULT 'UNREAD',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `ContactMessage_status_createdAt_idx`(`status`, `createdAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TouristPlaceMedia` (
    `placeId` INTEGER NOT NULL,
    `mediaId` INTEGER NOT NULL,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,

    INDEX `TouristPlaceMedia_placeId_sortOrder_idx`(`placeId`, `sortOrder`),
    PRIMARY KEY (`placeId`, `mediaId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ExperienceMedia` (
    `experienceId` INTEGER NOT NULL,
    `mediaId` INTEGER NOT NULL,
    `sortOrder` INTEGER NOT NULL DEFAULT 0,

    INDEX `ExperienceMedia_experienceId_sortOrder_idx`(`experienceId`, `sortOrder`),
    PRIMARY KEY (`experienceId`, `mediaId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Session` (
    `id` VARCHAR(191) NOT NULL,
    `sid` VARCHAR(191) NOT NULL,
    `data` TEXT NOT NULL,
    `expiresAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Session_sid_key`(`sid`),
    INDEX `Session_expiresAt_idx`(`expiresAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SiteSettings` ADD CONSTRAINT `SiteSettings_logoMediaId_fkey` FOREIGN KEY (`logoMediaId`) REFERENCES `Media`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SiteSettings` ADD CONSTRAINT `SiteSettings_heroMediaId_fkey` FOREIGN KEY (`heroMediaId`) REFERENCES `Media`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TouristPlace` ADD CONSTRAINT `TouristPlace_coverMediaId_fkey` FOREIGN KEY (`coverMediaId`) REFERENCES `Media`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Experience` ADD CONSTRAINT `Experience_coverMediaId_fkey` FOREIGN KEY (`coverMediaId`) REFERENCES `Media`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NewsPost` ADD CONSTRAINT `NewsPost_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `AdminUser`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NewsPost` ADD CONSTRAINT `NewsPost_coverMediaId_fkey` FOREIGN KEY (`coverMediaId`) REFERENCES `Media`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Event` ADD CONSTRAINT `Event_organizerId_fkey` FOREIGN KEY (`organizerId`) REFERENCES `AdminUser`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Event` ADD CONSTRAINT `Event_coverMediaId_fkey` FOREIGN KEY (`coverMediaId`) REFERENCES `Media`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TouristPlaceMedia` ADD CONSTRAINT `TouristPlaceMedia_placeId_fkey` FOREIGN KEY (`placeId`) REFERENCES `TouristPlace`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TouristPlaceMedia` ADD CONSTRAINT `TouristPlaceMedia_mediaId_fkey` FOREIGN KEY (`mediaId`) REFERENCES `Media`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ExperienceMedia` ADD CONSTRAINT `ExperienceMedia_experienceId_fkey` FOREIGN KEY (`experienceId`) REFERENCES `Experience`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ExperienceMedia` ADD CONSTRAINT `ExperienceMedia_mediaId_fkey` FOREIGN KEY (`mediaId`) REFERENCES `Media`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
