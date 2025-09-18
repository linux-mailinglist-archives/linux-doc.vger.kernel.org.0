Return-Path: <linux-doc+bounces-56450-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F7B2830E
	for <lists+linux-doc@lfdr.de>; Fri, 15 Aug 2025 17:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D3357B93FF
	for <lists+linux-doc@lfdr.de>; Fri, 15 Aug 2025 15:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6814F304999;
	Fri, 15 Aug 2025 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0x65c.net header.i=@0x65c.net header.b="JFtrnlU+"
X-Original-To: linux-doc@vger.kernel.org
Received: from m239-4.eu.mailgun.net (m239-4.eu.mailgun.net [185.250.239.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E6305E0E
	for <linux-doc@vger.kernel.org>; Fri, 15 Aug 2025 15:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.250.239.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755272340; cv=none; b=ca0BHZJVSPwKXXbvio1JxXYJKuATgzMNx8s9p2TUXCw7leJEGxTc/JG7zzLedyxHZVgDose8wuFU1AW9d3pw3qhN+vPl/khx0NPYb7JlPVJBU3APPZWBA6iCVnBsOfZU3byADrCm6ynNR8QTzyl/yG8X1WYzH0yGvLm2wWnyXso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755272340; c=relaxed/simple;
	bh=5tQ4CjJEGw0g5kPBiUHlzngWyj8hm0U1PNDAoqkvlqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/68EuidXfPLIR1HWrQdJS83jjlGdOEqlHDs8FULn0u3EdukrvEx2sJ0RqKyWca1HP6ayPkIOi7vpH532+67bLFEwqkMi67guEgMDRMM2B2N0JsrgIAOukx1oyBk3VDG0MidJuvToFhsHlNkeW/9a4Cl03ea2w67iNWbvHGDcCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x65c.net; spf=pass smtp.mailfrom=0x65c.net; dkim=pass (2048-bit key) header.d=0x65c.net header.i=@0x65c.net header.b=JFtrnlU+; arc=none smtp.client-ip=185.250.239.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x65c.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x65c.net
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=0x65c.net; q=dns/txt; s=email; t=1755272336; x=1755279536;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=f9ccNxfcK3sEBlBPYF9k8p2zcJ8aW3uNnCuA6Buc4Do=;
 b=JFtrnlU+5j35/oxBPABmAESHmrnli/9zpBf4BmgxIxhuDvP9Ql0dNojMuG4SdVADyFvgfdRlIPZdUuaXt9cITIPltN7Gf3fpCq9K7G4/8OGz2vt3GNFlpDnwNIUyIhweM8qukIUBgPz+aw29CpqYYYUvcWmnBqkID4pLrYL1jqt7j0XG13QiAeDy6I1p3Xwinia/kEQFVZKRy/vgm4nYzoPr/K5bWPHvnPZRaIuZlTh4pkvQcdcYBFga7vsz+eKWDb3t9ckvp2gL8toRv62NSxMypCo8G8ZR7Bib/vKIKDKXHg21EIj21/CLRm5UkUTWYEBdAuYNz71pWpz0Ve6Y4A==
X-Mailgun-Sid: WyI1NDY3NyIsImxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmciLCI1NGVmNCJd
Received: from fedora (pub082136115007.dh-hfc.datazug.ch [82.136.115.7]) by
 nomad-client-influx-c1dk with SMTP id 689f549003c0e2ff1bb12d20; Fri, 15 Aug
 2025 15:38:56 GMT
X-Mailgun-Sending-Ip: 185.250.239.4
Sender: alessandro@0x65c.net
From: Alessandro Ratti <alessandro@0x65c.net>
To: jgg@ziepe.ca,
	kevin.tian@intel.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	iommu@lists.linux.dev,
	linux-doc@vger.kernel.org,
	alessandro.ratti@gmail.com,
	Alessandro Ratti <alessandro@0x65c.net>
Subject: [PATCH] Documentation: fix spelling errors in iommufd.rst
Date: Fri, 15 Aug 2025 17:37:26 +0200
Message-ID: <20250815153840.188213-2-alessandro@0x65c.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815153840.188213-1-alessandro@0x65c.net>
References: <20250815153840.188213-1-alessandro@0x65c.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch corrects two minor spelling issues found in
Documentation/userspace-api/iommufd.rst:

- "primarly" -> "primarily"
- "sharable" -> "shareable"

Found using codespell(1).

Signed-off-by: Alessandro Ratti <alessandro@0x65c.net>
---
 Documentation/userspace-api/iommufd.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/iommufd.rst b/Documentation/userspace-api/iommufd.rst
index 03f7510384d2..f1c4d21e5c5e 100644
--- a/Documentation/userspace-api/iommufd.rst
+++ b/Documentation/userspace-api/iommufd.rst
@@ -43,7 +43,7 @@ Following IOMMUFD objects are exposed to userspace:
 
 - IOMMUFD_OBJ_HWPT_PAGING, representing an actual hardware I/O page table
   (i.e. a single struct iommu_domain) managed by the iommu driver. "PAGING"
-  primarly indicates this type of HWPT should be linked to an IOAS. It also
+  primarily indicates this type of HWPT should be linked to an IOAS. It also
   indicates that it is backed by an iommu_domain with __IOMMU_DOMAIN_PAGING
   feature flag. This can be either an UNMANAGED stage-1 domain for a device
   running in the user space, or a nesting parent stage-2 domain for mappings
@@ -76,7 +76,7 @@ Following IOMMUFD objects are exposed to userspace:
 
   * Security namespace for guest owned ID, e.g. guest-controlled cache tags
   * Non-device-affiliated event reporting, e.g. invalidation queue errors
-  * Access to a sharable nesting parent pagetable across physical IOMMUs
+  * Access to a shareable nesting parent pagetable across physical IOMMUs
   * Virtualization of various platforms IDs, e.g. RIDs and others
   * Delivery of paravirtualized invalidation
   * Direct assigned invalidation queues
-- 
2.39.5


