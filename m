Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D5831BF22
	for <lists+linux-doc@lfdr.de>; Mon, 15 Feb 2021 17:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhBOQZP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Feb 2021 11:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbhBOQSZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 11:18:25 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2181FC061A29
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:14:08 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id r77so6775725qka.12
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=z/iYHqVeCyWybAIwBASO/JRh5H6y4Wucaqn9XTIErdQ=;
        b=It0uOql+v9VUh5dtoEQx48A5m1/+Ns2m8GJk4dTI/WcWKQxD0YMc+v1DKN3iYJBntO
         KEI4g2vN3aCTXfyqiWi9oE3tQGrxZLu6MUxidcAWeWbz98B9GLRMhMb5dz8BbXorcHD8
         /r23qJSou3Llajvr3/9frF/pZqqrlte9PPOIvHSil+IaSSGRtnaMpxT+jiqzmpJ5N7YK
         wwg04GBl5eESmyrU4L9Tbn1oLltoVGrd4seNgaCA1nIdwQ04G/hN8tV3OLAhlkOge30t
         apXyGF+hRSlxpFnBM6KnSPz62yW5dNfttYUfN63YI4WdwflFEI4ssurnH6bC6M4TkgH/
         85eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z/iYHqVeCyWybAIwBASO/JRh5H6y4Wucaqn9XTIErdQ=;
        b=Teap448F77KHaGpb5T9qtrJeMtT/tL1ZBV5QwbXUyhw3rWnNqo/hkAQiiICwfEWEaJ
         8qhn7xD5TUEq8AAN1h6WY+gTnyKg/m9ldpK4Q0TSGQSYwNPVFhayFlyZSbdwLuKW6VGv
         +wrV02ZQ49o7MqKPqJXnC2PM0O1FYEdYT1X+PntDSi7LsE4L1mopjbOT1WX61YPfT5A1
         HkeWsDjXe+lPWe4rlq+NpZ+ApanNtOrvcuPfSte5rUHw8trUC4Yk61TxVIWi3C6MCC1l
         lENudA12AmuGqmLB2zmgc6ZRtOlyMN2hPXitN8u8KN1af+LfTlfZAfyl9sVLRPDHkKea
         2bkA==
X-Gm-Message-State: AOAM531rxO/p8V/sMxIZKbZt2Ng6XGX5+vrf1AbxxKFxS2fYo5GrBXP+
        R3lkNeX28onZF5T1q2WwSnqbjg==
X-Google-Smtp-Source: ABdhPJy8OPy6mq/ST9kEwL/ThGKcrCNz7CRNWwuQGlBM+pZiRxaf0OJHpTCaNQYf86QINqvRqUEb5g==
X-Received: by 2002:a05:620a:48c:: with SMTP id 12mr15239797qkr.290.1613405647410;
        Mon, 15 Feb 2021 08:14:07 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id u7sm10909213qta.75.2021.02.15.08.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:14:07 -0800 (PST)
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
        linux-kselftest@vger.kernel.org, jmorris@namei.org
Subject: [PATCH v11 10/14] memory-hotplug.rst: add a note about ZONE_MOVABLE and page pinning
Date:   Mon, 15 Feb 2021 11:13:45 -0500
Message-Id: <20210215161349.246722-11-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210215161349.246722-1-pasha.tatashin@soleen.com>
References: <20210215161349.246722-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the special handling of page pinning when ZONE_MOVABLE present.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 Documentation/admin-guide/mm/memory-hotplug.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 5c4432c96c4b..c6618f99f765 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -357,6 +357,15 @@ creates ZONE_MOVABLE as following.
    Unfortunately, there is no information to show which memory block belongs
    to ZONE_MOVABLE. This is TBD.
 
+.. note::
+   Techniques that rely on long-term pinnings of memory (especially, RDMA and
+   vfio) are fundamentally problematic with ZONE_MOVABLE and, therefore, memory
+   hot remove. Pinned pages cannot reside on ZONE_MOVABLE, to guarantee that
+   memory can still get hot removed - be aware that pinning can fail even if
+   there is plenty of free memory in ZONE_MOVABLE. In addition, using
+   ZONE_MOVABLE might make page pinning more expensive, because pages have to be
+   migrated off that zone first.
+
 .. _memory_hotplug_how_to_offline_memory:
 
 How to offline memory
-- 
2.25.1

