Return-Path: <linux-doc+bounces-61067-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E2B83601
	for <lists+linux-doc@lfdr.de>; Thu, 18 Sep 2025 09:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 289331C25364
	for <lists+linux-doc@lfdr.de>; Thu, 18 Sep 2025 07:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC622EC08F;
	Thu, 18 Sep 2025 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBgds0F/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EC42EA48F
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758181282; cv=none; b=NwB5Hc32zZS6b97Oekn9Pz/t4nueN4nQtQll4+3IzIJZc3HzHhaeus/3OyBRNrqobOEDxP2bGrQx/YWdCbGjF5uixAR540xMyatE5BSl9XxbyTqCdsyPdsBjkDhoRS329tv565uotia2dI9kl2BRjfiDeOtgDey1F/64o60xHvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758181282; c=relaxed/simple;
	bh=CYo+ThRi9YLTkaPWPwEFZLSRw7Sr+EbigfCEpDbe8Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rf5NyTe8x4+FL4wtILhDVRW1glX+f6JS2+4TMXZpV4SbTbqw2D3oo+y7DAfjHwr9zizoCHRZuW/74/pPcrYzDhwShmbimiLazV2uj8CwfKDrVxSVzBY7rIyAEgKMxx4K9WPxzvSzzg5z0y4HO7Yjt1RIU5dGaQ7+WHNAb+EfeW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBgds0F/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2697899a202so6032055ad.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758181280; x=1758786080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LP3Bd0aP9DzURHwOKIT419E9RC6+Q/KgVNOlgFr+0G0=;
        b=KBgds0F/cXRkx3KY4iMVJ4mymdq9NXiNlPyR3kUw0LWPPr2nj70JIaVQlZHbS/o+9X
         Yj8UJ6nKWKZuBYTODwMZrd9/QSqA6NuDeoWmMJzkT02tTz+FCgTZ8VNgevZYDU56PSTX
         CCAsfhk70LrSGe9Nic5GuBbqlJa/urQtWtaavSrP3aM+2uFp82CxMWEptI7D1EITR5nL
         9lLJ+2m5YAZzX46LBn4IFpLEW5NS6A1f3lg4g6QRdoZdXu51lBjxAAVHiSilNFLLx+JP
         EA3q7Tt6Ira+F0kn6s/6aoxqUse/PHGWQN0edLs8VfWdFcdJyBmaqb0fJX7RqReRFbq5
         imfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758181280; x=1758786080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LP3Bd0aP9DzURHwOKIT419E9RC6+Q/KgVNOlgFr+0G0=;
        b=irsJv29P/L7VLsNR85+o6TUXQlSKVwGocOHKGfTggHSC20jgo02hUBlrTbBq747hmy
         zUxsuD4k7dONrzOCH0r2eBruWxoXctnGSRi17w8idMP7CdG0Wb7lroNg1YQsuji0vqPN
         70oYmfBnDmFKtW/+4NkAhJrRCW/iZYkxT4x3ageBXSgT+guwmVIQL7lJNoVaKJwZmK46
         5DwYgem+NRnJxhHxzLwDel9Cl9DYlIZsaNTC4T2dhUn+AK4KDj7x7QAfdnHO8PzCg0nH
         oAIqaMxZlkVHJ/Yf3XEUtmm2PnTX33mZzrTfBmuDLedpkIp80bi15yo0pFbmlK576IIv
         G3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXbgBcFiABDBGAECwaVD1JCwbljpgbQCMtZN9580+xYU9ptZk4oMIxbkODO2A+d8iPLJPTKOlzx3JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YznGOU4gkBaBx1jXEO+k0e8DaIKrv772s6NBbwEpRnKxbZmF1WG
	LXdXIo6dcAEZE1JeFao2bCA46lzqRIIA62ZBen/6w+NF6WOrt9DXwfFt
X-Gm-Gg: ASbGnctKBaBo1/bHeJyzSnwMb8JAlesFw/AUfMqb7ESPsSBFRjJIgI/ekEDJNjtzbpD
	htxzc6XRHe9oEFf7eCaYsq3knR6jiVCYk/rDVb3uNL5f/KJWk6zslWMFGFJ/E3waEh6f6DYz2e+
	K7vxhgujcCSKNoEJUwauAHJPCAbW15upNqq5iS2W9gpOxTGMps3IGIyl2niQB7J1EFJdc2ehEV5
	JYE0AqfzzBRhYZ/ENXztDYLW9a6anWA5rUaHSmLMq00eoTUt9pkqzkbEoMoFVIu59zkHQCjrA30
	a3ljRXlKnBUtlEO1hcALwYtVh4OJsHByDDeo90VFh+E1N2wqOC9P1DpcxhE+JxWTKmn+hHcMZtz
	m1p2ZE7furGRyukZjLzbv82TfgRfWEIXhdv0C+2T6
X-Google-Smtp-Source: AGHT+IGi3Ysot5IFecJ/wpDgRLZt6n6fWBTeX763QBB3HvcW2dLPStQT8hc/gLqLnajn/K5Fb/M7rg==
X-Received: by 2002:a17:902:e5d2:b0:24c:ba8e:c5bc with SMTP id d9443c01a7336-2697c8166b3mr34846665ad.8.1758181280234;
        Thu, 18 Sep 2025 00:41:20 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053e77sm17158665ad.7.2025.09.18.00.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 00:41:19 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 037A34207D19; Thu, 18 Sep 2025 14:41:15 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux cgroups <cgroups@vger.kernel.org>
Cc: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v3] Documentation: cgroup-v2: Replace manual table of contents with contents:: directive
Date: Thu, 18 Sep 2025 14:40:49 +0700
Message-ID: <20250918074048.18563-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3815; i=bagasdotme@gmail.com; h=from:subject; bh=CYo+ThRi9YLTkaPWPwEFZLSRw7Sr+EbigfCEpDbe8Ew=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBmnt72vtGax8Xuy9de5ENNTaU3hhg/u7T53WMnw7EURz 7sy613PdZSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiM2oZ/ooxfNj0NX7yjUtb TDgVdjMZtT9Tu6AWdMa1XXr701nmslGMDFPu/Fzx5U3ahCNvlh3MOce3J2uGZlq8qhXvO6ZjNwu 3iTMDAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

cgroup v2 docs is a lengthy single docs, as compared to cgroup v1 which
is split into several reST files. Meanwhile, its manually-arranged table
of contents can get (and indeed) out-of-sync with actual contents when
new sections forget to be added to it.

Replace it with automatically-generated table of contents via contents::
directive.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v2 [1]:

  * Revert back to v1 approach [2] (Michal)

[1]: https://lore.kernel.org/lkml/20250915081942.25077-1-bagasdotme@gmail.com/
[2]: https://lore.kernel.org/lkml/20250910072334.30688-3-bagasdotme@gmail.com/

 Documentation/admin-guide/cgroup-v2.rst | 79 +------------------------
 1 file changed, 1 insertion(+), 78 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index a1e3d431974c20..fdd3ee6cfe87a4 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -13,84 +13,7 @@ of cgroup including core and specific controller behaviors.  All
 future changes must be reflected in this document.  Documentation for
 v1 is available under :ref:`Documentation/admin-guide/cgroup-v1/index.rst <cgroup-v1>`.
 
-.. CONTENTS
-
-   1. Introduction
-     1-1. Terminology
-     1-2. What is cgroup?
-   2. Basic Operations
-     2-1. Mounting
-     2-2. Organizing Processes and Threads
-       2-2-1. Processes
-       2-2-2. Threads
-     2-3. [Un]populated Notification
-     2-4. Controlling Controllers
-       2-4-1. Enabling and Disabling
-       2-4-2. Top-down Constraint
-       2-4-3. No Internal Process Constraint
-     2-5. Delegation
-       2-5-1. Model of Delegation
-       2-5-2. Delegation Containment
-     2-6. Guidelines
-       2-6-1. Organize Once and Control
-       2-6-2. Avoid Name Collisions
-   3. Resource Distribution Models
-     3-1. Weights
-     3-2. Limits
-     3-3. Protections
-     3-4. Allocations
-   4. Interface Files
-     4-1. Format
-     4-2. Conventions
-     4-3. Core Interface Files
-   5. Controllers
-     5-1. CPU
-       5-1-1. CPU Interface Files
-     5-2. Memory
-       5-2-1. Memory Interface Files
-       5-2-2. Usage Guidelines
-       5-2-3. Memory Ownership
-     5-3. IO
-       5-3-1. IO Interface Files
-       5-3-2. Writeback
-       5-3-3. IO Latency
-         5-3-3-1. How IO Latency Throttling Works
-         5-3-3-2. IO Latency Interface Files
-       5-3-4. IO Priority
-     5-4. PID
-       5-4-1. PID Interface Files
-     5-5. Cpuset
-       5.5-1. Cpuset Interface Files
-     5-6. Device
-     5-7. RDMA
-       5-7-1. RDMA Interface Files
-     5-8. DMEM
-     5-9. HugeTLB
-       5.9-1. HugeTLB Interface Files
-     5-10. Misc
-       5.10-1 Miscellaneous cgroup Interface Files
-       5.10-2 Migration and Ownership
-     5-11. Others
-       5-11-1. perf_event
-     5-N. Non-normative information
-       5-N-1. CPU controller root cgroup process behaviour
-       5-N-2. IO controller root cgroup process behaviour
-   6. Namespace
-     6-1. Basics
-     6-2. The Root and Views
-     6-3. Migration and setns(2)
-     6-4. Interaction with Other Namespaces
-   P. Information on Kernel Programming
-     P-1. Filesystem Support for Writeback
-   D. Deprecated v1 Core Features
-   R. Issues with v1 and Rationales for v2
-     R-1. Multiple Hierarchies
-     R-2. Thread Granularity
-     R-3. Competition Between Inner Nodes and Threads
-     R-4. Other Interface Issues
-     R-5. Controller Issues and Remedies
-       R-5-1. Memory
-
+.. contents::
 
 Introduction
 ============

base-commit: 1f783f733450f72725c0040a2b3075614fa0fb5c
-- 
An old man doll... just what I always wanted! - Clara


