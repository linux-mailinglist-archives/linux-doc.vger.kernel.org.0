Return-Path: <linux-doc+bounces-31633-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CF39DA0EB
	for <lists+linux-doc@lfdr.de>; Wed, 27 Nov 2024 03:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11BA7168E89
	for <lists+linux-doc@lfdr.de>; Wed, 27 Nov 2024 02:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFE414F102;
	Wed, 27 Nov 2024 02:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RElf2k7h"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E314A099
	for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 02:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732676281; cv=none; b=SqEKD/PEdgcvbcf70ZiwUzj+gboTu8KDmf/OLk26fXW259jhE5VscuIDttlZ2U142PpFjfIlQ5JT6xwaeNNEJfczGh5+6HeeRgQmv6NAEGtfYB2ablrdK8r3Xkr0S8IamZPWwabuRm3FUkqYSpDTnA1sMm8CDnO2X9FsxNyQ6f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732676281; c=relaxed/simple;
	bh=n3v2ZTKy4XayzWP8FCTYHWj0NyVizXv/4ojexhsmJFw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nIQIBoqYwg6KMdKq4SACpA+SQRQdZo2mBwV+xt9rmAN+0DmPYqwgdU55vt2ZBhBKMS4ED3fRz7XUmqOxOUP+wIqzK6ap6JwoAKJQf5AeRB+EWKBwuXK9ogqFdaRQOqIqRwMHyzrRXlNUuKXRqGqhIUVdPkFTMCQvPY+k+v6fNBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuanchu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RElf2k7h; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuanchu.bounces.google.com
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-71d3fa73518so1663031a34.0
        for <linux-doc@vger.kernel.org>; Tue, 26 Nov 2024 18:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732676278; x=1733281078; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PZpBMHL8IdsZHMO87vdTflNT6N6icPZfEjrZz1n0oFE=;
        b=RElf2k7hxC2lnn71XaZXdrFRxNlEO3cTvLQINs6bpLOLmMzYSMkopjpOmMPFIjFY3d
         uHC/1EUEbCavJrX/h6mv/BrVxzNUjSOcWbLr5PPSgtAe0DQN9pHF0ZMeBPINB0kF+bfx
         1+jK9flgY6W5UOzr/UpUkR+dDJIW/Z5pIQBPUd53eROs5RVLu4nRznVg+NIs4lOPf/Cf
         UH2tb64f9J4QV6uL64fMeLA3qr9dGKEPdzwN4fhsbdMhuV2jxnIk38ImmA+k1G4xCtck
         3QBkCK98BA1OYQNtwbpOVHF30BzJSLqhn0XZqfs4wkuOxZyMS/IhAWr5Vxy51mo7PGX0
         LXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732676278; x=1733281078;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZpBMHL8IdsZHMO87vdTflNT6N6icPZfEjrZz1n0oFE=;
        b=gkXzFenPzsy2abGkvs2t+Bc/+XN4gvTZwQjhvB+IfHJjvlutVrgwB6T5xyMPgKHRJc
         4KUQfzVw7vUlGNsiIxO1g0TCJZKKkzY9Nfph12QebfAw7qXCsiawWSYmbU+/FU9uZhRX
         R1yC1Xb7TmiwHUTMNGGvtbJj5mleyxhMMWen132Ju45nfQ5L+3uaV8v7ANQQCbFajCl7
         Qu2Y76AZVzv7/KW0zWX9whFpa+i/VvAC0ybRFLK2ebEteoSi+NhS7flLWS2MfnpmeNdy
         cbVSmXazWjRIPSrapZzOlUeOfN022+pJM93VLv6ocZkad1v523mXTx6+e66lR8mZFtq0
         4xwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrOsFKrJrDWHB5+ezfcRqch7674JQ7IbtblWlG2twG779DLdGlYOWp6Skwc2Zx5wBRcbXMlsS6MMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC/BpjnpnE5Q3aVhrbP5CUk7ankw1Cke0reg5RS/SjrrfBabVa
	dvvD2emcPhsN+nxdAAQ9zUYfMAzPcqy33LC844t5mQbMJx+HftsygWeTxdnOVp6/JqCzrHmieNl
	K81RKbA==
X-Google-Smtp-Source: AGHT+IFKHf2rAZNzRLIYi5pyoUxBdmbZ99C2meBLNg4KMzGEhTQ6C34gvUg4FAtRwQPJnnGabMdsTk0k6Rq/
X-Received: from oabuz16.prod.google.com ([2002:a05:6870:af90:b0:295:ebc2:deb2])
 (user=yuanchu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:5d8f:b0:297:270c:575
 with SMTP id 586e51a60fabf-29dc40097dbmr1170968fac.16.1732676278453; Tue, 26
 Nov 2024 18:57:58 -0800 (PST)
Date: Tue, 26 Nov 2024 18:57:27 -0800
In-Reply-To: <20241127025728.3689245-1-yuanchu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241127025728.3689245-1-yuanchu@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241127025728.3689245-9-yuanchu@google.com>
Subject: [PATCH v4 8/9] Docs/admin-guide/cgroup-v2: document workingset reporting
From: Yuanchu Xie <yuanchu@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Khalid Aziz <khalid.aziz@oracle.com>, 
	Henry Huang <henry.hj@antgroup.com>, Yu Zhao <yuzhao@google.com>, 
	Dan Williams <dan.j.williams@intel.com>, Gregory Price <gregory.price@memverge.com>, 
	Huang Ying <ying.huang@intel.com>, Lance Yang <ioworker0@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Daniel Watson <ozzloy@each.do>, Yuanchu Xie <yuanchu@google.com>, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add workingset reporting documentation for better discoverability of
its memcg interfaces. Point the memcg documentation to
Documentation/admin-guide/mm/workingset_report.rst for more details.

Signed-off-by: Yuanchu Xie <yuanchu@google.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 35 +++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 2cb58daf3089..67a183f08245 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1784,6 +1784,41 @@ The following nested keys are defined.
 	Shows pressure stall information for memory. See
 	:ref:`Documentation/accounting/psi.rst <psi>` for details.
 
+  memory.workingset.page_age
+	A read-only histogram which exists on non-root cgroups.
+
+	This breaks down the cgroup's memory footprint into different
+	types of memory and groups them per-node into user-defined coldness
+	bins.
+
+	The output format of memory.workingset.page_age is::
+
+	  N0
+	  <interval 0 of node 0> type=<type bytes in interval 0 of node 0>
+	  <interval 1 of node 0> type=<type bytes in interval 1 of node 0>
+	  ...
+	  18446744073709551615 type=<the rest of type bytes of node 0>
+
+	The type of memory can be anon, file, or new types added later.
+	Don't rely on the types remaining fixed.  See
+	:ref:`Documentation/admin-guide/mm/workingset_report.rst <workingset_report>`
+	for details.
+
+  memory.workingset.refresh_interval
+	A read-write nested-keyed file which exists on non-root cgroups.
+
+	Setting it to a non-zero value for any node enables working set
+	reporting for that node.  The default is 0 for each node.   See
+	:ref:`Documentation/admin-guide/mm/workingset_report.rst <workingset_report>`
+	for details.
+
+  memory.workingset.report_threshold
+	A read-write nested-keyed file which exists on non-root cgroups.
+
+	The amount of milliseconds to wait before reporting the working
+	set again.  The default is 0 for each node.  See
+	:ref:`Documentation/admin-guide/mm/workingset_report.rst <workingset_report>`
+	for details.
 
 Usage Guidelines
 ~~~~~~~~~~~~~~~~
-- 
2.47.0.338.g60cca15819-goog


