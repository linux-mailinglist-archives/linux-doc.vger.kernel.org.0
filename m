Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E102E0BB5
	for <lists+linux-doc@lfdr.de>; Tue, 22 Dec 2020 15:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbgLVOa7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Dec 2020 09:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgLVOau (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Dec 2020 09:30:50 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1EAC061285
        for <linux-doc@vger.kernel.org>; Tue, 22 Dec 2020 06:29:51 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id x1so2875142pgh.12
        for <linux-doc@vger.kernel.org>; Tue, 22 Dec 2020 06:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ntojA21L7AWHHQRUBdhZHwBioWXg1bVrcDP2ArBhkkY=;
        b=XTTONU2KZyeFIIukV/BEYoa3ybU4lZ89lYtgBqJ1YEuOA9kkye11aJ91ssriUtJ4F+
         vXAfW2eN15sPIGPeOX8NTzTs0K8/CGg8oaTVLSCpaNQ+BlYuHMhjWi3dIlkbgPQPOOAh
         9NWYI3ZLds0WcSf53RD5hHHtXjxQRUMwXlt4231q+ReNs7A2XyIa5qlL5yf1IFLGazvU
         jV/vu6/OwgYhLa93+DACagHBc6EOIrEMG5CZUVLC5UlbhalmucW6ugVkhQ9rEtqHzPMu
         wGFC9fy58EIrm0sitEf0aJ9c9PaEKeyWDUPqB22b2HqSBL9gSH/XiCbGcYcb1eTUuOUi
         Y/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ntojA21L7AWHHQRUBdhZHwBioWXg1bVrcDP2ArBhkkY=;
        b=X0t4CDc1HauyHmsQrYTanGUqHqlJsjnPJ4TGiu1468jbZCyKJJAYI+ENSV2L/VmvBN
         58afNkD709HEQ0+WQmuWbxQY6+8JvsdgcwMklG6EQKXOEZx4sSpqwfVRBdssXTFHs9Tz
         zu1SkRnLT13BrZlx2EftpifGWG8dJTp/wmtSEDn9P4yP1PJT446NHQJooqltv9P5HWF1
         uQz6YGQxasw01b0DnNWkvH2dVc1Wm+lbkwjP4d+8p8VCI/8T8C93UzO0zzp703K/z3U/
         inrnx4KOskpPFOjouPxxc0dLCnaxW6NTidyKMXuxQZMYaJAiC73gY52UiJihliWt7+Ev
         ZnPQ==
X-Gm-Message-State: AOAM5325CtJpcMThzhRD9ha+ZHD4aKmsmWrh3s5gv168RteP52RxyE8G
        iDim0eBXHjYZ9Bx7vKWR2AOgMA==
X-Google-Smtp-Source: ABdhPJzCUCmTavcCtYy0Cgeu988bfVe0mdBav9lSJTTmQ2B5meYZqqFRw1PChtjMNZxchKxCfkqcwQ==
X-Received: by 2002:a62:8683:0:b029:1a4:4f3f:7e75 with SMTP id x125-20020a6286830000b02901a44f3f7e75mr20092143pfd.68.1608647391128;
        Tue, 22 Dec 2020 06:29:51 -0800 (PST)
Received: from localhost.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id a31sm21182088pgb.93.2020.12.22.06.29.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 06:29:50 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, naoya.horiguchi@nec.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v11 02/11] mm/hugetlb: Introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
Date:   Tue, 22 Dec 2020 22:24:31 +0800
Message-Id: <20201222142440.28930-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201222142440.28930-1-songmuchun@bytedance.com>
References: <20201222142440.28930-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The HUGETLB_PAGE_FREE_VMEMMAP option is used to enable the freeing
of unnecessary vmemmap associated with HugeTLB pages. The config
option is introduced early so that supporting code can be written
to depend on the option. The initial version of the code only
provides support for x86-64.

Like other code which frees vmemmap, this config option depends on
HAVE_BOOTMEM_INFO_NODE. The routine register_page_bootmem_info() is
used to register bootmem info. Therefore, make sure
register_page_bootmem_info is enabled if HUGETLB_PAGE_FREE_VMEMMAP
is defined.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 arch/x86/mm/init_64.c |  2 +-
 fs/Kconfig            | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 0a45f062826e..0435bee2e172 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1225,7 +1225,7 @@ static struct kcore_list kcore_vsyscall;
 
 static void __init register_page_bootmem_info(void)
 {
-#ifdef CONFIG_NUMA
+#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)
 	int i;
 
 	for_each_online_node(i)
diff --git a/fs/Kconfig b/fs/Kconfig
index 976e8b9033c4..e7c4c2a79311 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -245,6 +245,24 @@ config HUGETLBFS
 config HUGETLB_PAGE
 	def_bool HUGETLBFS
 
+config HUGETLB_PAGE_FREE_VMEMMAP
+	def_bool HUGETLB_PAGE
+	depends on X86_64
+	depends on SPARSEMEM_VMEMMAP
+	depends on HAVE_BOOTMEM_INFO_NODE
+	help
+	  The option HUGETLB_PAGE_FREE_VMEMMAP allows for the freeing of
+	  some vmemmap pages associated with pre-allocated HugeTLB pages.
+	  For example, on X86_64 6 vmemmap pages of size 4KB each can be
+	  saved for each 2MB HugeTLB page.  4094 vmemmap pages of size 4KB
+	  each can be saved for each 1GB HugeTLB page.
+
+	  When a HugeTLB page is allocated or freed, the vmemmap array
+	  representing the range associated with the page will need to be
+	  remapped.  When a page is allocated, vmemmap pages are freed
+	  after remapping.  When a page is freed, previously discarded
+	  vmemmap pages must be allocated before remapping.
+
 config MEMFD_CREATE
 	def_bool TMPFS || HUGETLBFS
 
-- 
2.11.0

