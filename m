Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13AAB31F7AC
	for <lists+linux-doc@lfdr.de>; Fri, 19 Feb 2021 11:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhBSKxr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 Feb 2021 05:53:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhBSKxY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Feb 2021 05:53:24 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD09EC061794
        for <linux-doc@vger.kernel.org>; Fri, 19 Feb 2021 02:52:20 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id t25so3777572pga.2
        for <linux-doc@vger.kernel.org>; Fri, 19 Feb 2021 02:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/z4/inaUQyi6A7ziFBiSuphvc4zlbtBFhhYbLAw/G34=;
        b=dTHGW2GrZQlpZCCgS5ZGbbONBlwQ67ce+8mCMu/g5KK3ueEVcctzYjxaprsXTtbPGJ
         Yq9NXwoiKFoDETUkpr+m96ZD2lg7P1WqXsUavgtl2ohvjVdJ9cfbsGBovwDhldFU91Cf
         +1OUoo4ftVwOJpwt0oWmAc6yldLkuY2HEdz5TGqzKWHCSk3LKNruRlqm4EIdkzbc6xEP
         9GZt9M9HlBL16qyEF49t82HbU+nV60t7h5e26EDBC5VhON1kDSQEXXizdaQB154IOWDN
         piK3eDp6mKC45Z0WnuMNi/vpyTQC7h4JIzSMJvoDIA0InFn+88jIfH/kI11xEyB76OnD
         nc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/z4/inaUQyi6A7ziFBiSuphvc4zlbtBFhhYbLAw/G34=;
        b=eHeMhQ0I9uFDYg8c/l2UhvSycj1ph8IIQg0bS7lrDBZma2i7mDrhSUwf+V7PIl65zZ
         kqFrerm/2fe/05TLE4KVNI0bi95eMI8yoGfwHYh2/nIDWgEeYyL/VKkh+lpa/KmgyHF/
         j9if/ZiPRv6hOoEswlxDyqqsdgLt0/i7Qx0cBq3YZtwMKx7nCH9811BY2lN75oVo+4Mf
         eywTAMNnR1f1JTHgYYzIQH7JyvNcF/wvWKMZWJ3O4abermaVOKV4hlNYNFq8kLASWWTU
         VzpGUUyUwBWH49NqcgfIgeCiXdCXfH/OO8WgIO8Anbqo+W+jycVUejL+E+zKkyjsnhaZ
         jp5Q==
X-Gm-Message-State: AOAM530jYYtuBMKsUQiTVP6T6XluV8xlNJD4KzEzg1khKiVNM2iuINkA
        2CJgxTbTQHubQroJjEkqBvytXA==
X-Google-Smtp-Source: ABdhPJwOmS9HqudSELeMjO7sH1YZWGFBDRQ+Usrfu04u4QL8cAeQ4UBBNVPlDp0EZzgLb+Zm8DkQIQ==
X-Received: by 2002:a62:8fd4:0:b029:1de:d484:e1f7 with SMTP id n203-20020a628fd40000b02901ded484e1f7mr8781404pfd.78.1613731940261;
        Fri, 19 Feb 2021 02:52:20 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id x1sm9662193pgj.37.2021.02.19.02.52.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2021 02:52:19 -0800 (PST)
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
        david@redhat.com, naoya.horiguchi@nec.com,
        joao.m.martins@oracle.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>,
        Miaohe Lin <linmiaohe@huawei.com>
Subject: [PATCH v16 2/9] mm: hugetlb: introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
Date:   Fri, 19 Feb 2021 18:49:47 +0800
Message-Id: <20210219104954.67390-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210219104954.67390-1-songmuchun@bytedance.com>
References: <20210219104954.67390-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The option HUGETLB_PAGE_FREE_VMEMMAP allows for the freeing of
some vmemmap pages associated with pre-allocated HugeTLB pages.
For example, on X86_64 6 vmemmap pages of size 4KB each can be
saved for each 2MB HugeTLB page. 4094 vmemmap pages of size 4KB
each can be saved for each 1GB HugeTLB page.

When a HugeTLB page is allocated or freed, the vmemmap array
representing the range associated with the page will need to be
remapped. When a page is allocated, vmemmap pages are freed
after remapping. When a page is freed, previously discarded
vmemmap pages must be allocated before remapping.

The config option is introduced early so that supporting code
can be written to depend on the option. The initial version of
the code only provides support for x86-64.

Like other code which frees vmemmap, this config option depends on
HAVE_BOOTMEM_INFO_NODE. The routine register_page_bootmem_info() is
used to register bootmem info. Therefore, make sure
register_page_bootmem_info is enabled if HUGETLB_PAGE_FREE_VMEMMAP
is defined.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
---
 arch/x86/mm/init_64.c | 2 +-
 fs/Kconfig            | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

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
index 97e7b77c9309..de87f234f1e9 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -237,6 +237,12 @@ config HUGETLBFS
 config HUGETLB_PAGE
 	def_bool HUGETLBFS
 
+config HUGETLB_PAGE_FREE_VMEMMAP
+	def_bool HUGETLB_PAGE
+	depends on X86_64
+	depends on SPARSEMEM_VMEMMAP
+	depends on HAVE_BOOTMEM_INFO_NODE
+
 config MEMFD_CREATE
 	def_bool TMPFS || HUGETLBFS
 
-- 
2.11.0

