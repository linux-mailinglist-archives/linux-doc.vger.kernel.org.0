Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159E62FB038
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jan 2021 06:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733312AbhASEpY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Jan 2021 23:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387396AbhASEmU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 23:42:20 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1F3C0617BB
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:40 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id l14so8591546qvh.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QvpjocIxpAJpwN7ZjZNHW+XRgnc1ELBaL7ZfGJrMLlI=;
        b=XRy2OGUg5hLWOeu5p9VjC+KJDzgv78GpWBjRExYOoUjMXODE1Qlmd+bvAca8Pjj56f
         u5uX2U7vfhOiXps7xYJEBjj1PIafrizIUHn6rDOZjlQvPCgpTiPNSVZxDtM+lZWMfUZw
         VzTPUdSjIaIlGR8ERwKSrQaAedKkzzc69i41s2G39mW/XToWzu5HnES6bUsoOBkxk64k
         n3dLOVPiKaVj9skz8RMuPHvkbgDUiXZHRLh/292iuZ3S2ocYbugyKzNG/0A4zoT8KSkJ
         2KPpIu+kDh3JGdRuiyNzh0LoglL4VlghwPE6S8Hbm8wJI/Qglerjg3HDdJlNCJzcxe7u
         BGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QvpjocIxpAJpwN7ZjZNHW+XRgnc1ELBaL7ZfGJrMLlI=;
        b=oPkYzIPRdmTduL/csYQd0hiIbZ2Emhox/XOVI0xN3GAZIiNTzu0e6Asgj9HcQCCOCs
         zEOdTYGQjXlCRdq+9a7xMsckqtAe3EmwC0WIh14h0VWYCYHDYbGUazcw0lidn3e2dwIw
         qWfmcC9D+cYTyqbkFyaxxo+h0xLbmIi17j22KJbAqWaELSdadHUPoTVNFjRJBmxhnKie
         /VRgNuuj8H3jslriUboTxlx0dlu4YhjmUKuUV7SfOhlxi85C5J+WmN0rxEm/Foel3/VX
         TUNoJsX7xQ4lUtPqcLJsAlr2aWHfrYwJd4V1i1R3n88it9VgTLedDx56Xm5EX+SIR9aJ
         lOsA==
X-Gm-Message-State: AOAM532xbPsgRpYLddpTA0Vivtp/KZYJececb67NJkQMStIEJNBLviSK
        1IMpgMSStMdfIrqLy9mzke5E6g==
X-Google-Smtp-Source: ABdhPJwpbVdkpRy0J4ckx/2PKmlfUNG8zKleCZqZeUYKzqHFhj2xCJj4QMJRcIxiHfhG+OfgYfKR4w==
X-Received: by 2002:a0c:ecce:: with SMTP id o14mr2590819qvq.18.1611031180011;
        Mon, 18 Jan 2021 20:39:40 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id z20sm11934536qkz.37.2021.01.18.20.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 20:39:39 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org, ira.weiny@intel.com,
        linux-kselftest@vger.kernel.org
Subject: [PATCH v5 11/14] mm/gup: change index type to long as it counts pages
Date:   Mon, 18 Jan 2021 23:39:17 -0500
Message-Id: <20210119043920.155044-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119043920.155044-1-pasha.tatashin@soleen.com>
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In __get_user_pages_locked() i counts number of pages which should be
long, as long is used in all other places to contain number of pages, and
32-bit becomes increasingly small for handling page count proportional
values.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 mm/gup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index c301ab060de6..dfe90b254bc6 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1479,7 +1479,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 {
 	struct vm_area_struct *vma;
 	unsigned long vm_flags;
-	int i;
+	long i;
 
 	/* calculate required read or write permissions.
 	 * If FOLL_FORCE is set, we only require the "MAY" flags.
-- 
2.25.1

