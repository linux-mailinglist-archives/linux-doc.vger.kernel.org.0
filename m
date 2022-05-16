Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B6E5281DD
	for <lists+linux-doc@lfdr.de>; Mon, 16 May 2022 12:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242562AbiEPKXS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 16 May 2022 06:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233014AbiEPKXQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 06:23:16 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4C5DF13
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 03:23:03 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id v10so13645728pgl.11
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wM6Azq4KvZFXPTLv4RjX04U+2mm1UIR+U1KSQ2B9MTI=;
        b=8H8QXlCOxjBgjGZh3+z6KHLhzw4I/ccGgMza3sUfGcJ+ykdaqDuU7NJXywJqXBmZvm
         PPb9ZKan1kfrxhDdsKPryMHGMax0yEKcyFZcEs3baaX23BtrzlOgvT3ijDwn92aNcYVT
         rIY1UjeWjfnn6WsbW+NJ4GczWjtYtJr5qOjrk12P4s6qHql7WRb0/RrPSoUEw/VTfiNY
         1e7zhvlatMu3Kj6s3Q8WciSzxWO4jZjeBuLtzoa/5+/MKSd8/BwwrpTJ5+16BO81hVxX
         WeK3JkMVs8MK6NyaFCm0yMZkQ8f5Q4hs/2fEqv96Mtp5NUA5hRTOO9IQdg7bW1JxFo+6
         tSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wM6Azq4KvZFXPTLv4RjX04U+2mm1UIR+U1KSQ2B9MTI=;
        b=NCAD/tZyBp2M42+nMrsBkf28ebhWeXiyimn6CKH3tZGUvSpc+Z/CvBC5ZraO+FOa3N
         d85rQISiRau3IT0GfYQ9FKlFG2Osxk5F3xXnFEv2U4geVtOhniWY9nLYd8tZP/+TGtqw
         cRLvPg5PDWGwWCIPL/rS4RGLw9wBUgOt1OJ4lAPRvA9u9iKSbcwcSG+giHRy2EpCQ/Yd
         PQ24oNo/AqGnhr0ZS83c1eG0B/ga3ipVeizE+FTVUl+qqrVGuvfSXwRnGVQZuM9Ztj0D
         PWHQ1JCyBrcwrTf+tAGwaqYSoMM+pyE+iXTGKyqQEPHEfWh2qnimEwjCK6+fDELKKIZZ
         q52Q==
X-Gm-Message-State: AOAM530PUGv7fXBesnk2357fUefQMUNd8adtrENtlQiJ/FIzeenq/giD
        h4etT72jEo8USpKPTycPwmcM6A==
X-Google-Smtp-Source: ABdhPJwA0KYogIQnhHX+aOs8Ju/cjBq8V+xpTctszclbnMr/9fG5BJnPxGY5TbdCQtotKncPsTpNvQ==
X-Received: by 2002:a63:89c7:0:b0:3da:ee16:c84 with SMTP id v190-20020a6389c7000000b003daee160c84mr14940129pgd.320.1652696582639;
        Mon, 16 May 2022 03:23:02 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id i9-20020aa79089000000b0050dc76281e4sm6472731pfa.190.2022.05.16.03.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 03:23:02 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v12 0/7] add hugetlb_optimize_vmemmap sysctl
Date:   Mon, 16 May 2022 18:22:04 +0800
Message-Id: <20220516102211.41557-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series is based on next-20220428.

This series amis to add hugetlb_optimize_vmemmap sysctl to enable or disable
the feature of optimizing vmemmap pages associated with HugeTLB pages.

v12:
  - Add patch 3 and patch 4 to handle the coexistence of hugetlb_free_vmemmap
    and memory_hotplug.memmap_on_memory (David).
  - Remove Reviewed-by from Mike in the last parch since it is changed.

v11:
  - Collect Reviewed-by from Mike.
  - Remove hugetlb_optimize_vmemmap_enabled() check from flush_free_hpage_work().

v10:
  - Collect Reviewed-by from Mike.
  - Remove hugetlb_optimize_vmemmap_enabled() check from
    hugetlb_optimize_vmemmap_pages() (Mike).
  - Add more explanation to Documentation/admin-guide/sysctl/vm.rst.
  - Fix cannot disable the feature via hugetlb_optimize_vmemmap sysctl (Mike).
  - Update patch 2's commit log (Mike).

v9:
  - Go back to v3 since checking the size of struct page at config time is
    very complex.

v8:
  - Fix compilation (scripts/selinux/mdp/mdp.c) error when
    CONFIG_SECURITY_SELINUX is selected.

v7:
  - Fix circular dependency issue reported by kernel test robot.
  - Introduce CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP instead of
    STRUCT_PAGE_SIZE_IS_POWER_OF_2.
  - Add more comments into vm.rst to explain hugetlb_optimize_vmemmap (Andrew).
  - Drop the patch "sysctl: allow to set extra1 to SYSCTL_ONE".
  - Add a new patch "use kstrtobool for hugetlb_vmemmap param parsing".
  - Reuse static_key's refcount to count the number of HugeTLB pages with
    vmemmap pages optimized to simplify the lock scheme.

v6:
  - Remove "make syncconfig" from Kbuild.

v5:
  - Fix not working properly if one is workig off of a very clean build
    reported by Luis Chamberlain.
  - Add Suggested-by for Luis Chamberlain.

v4:
  - Introduce STRUCT_PAGE_SIZE_IS_POWER_OF_2 inspired by Luis.

v3:
  - Add pr_warn_once() (Mike).
  - Handle the transition from enabling to disabling (Luis)

v2:
  - Fix compilation when !CONFIG_MHP_MEMMAP_ON_MEMORY reported by kernel
    test robot <lkp@intel.com>.
  - Move sysctl code from kernel/sysctl.c to mm/hugetlb_vmemmap.c.

Muchun Song (7):
  mm: hugetlb_vmemmap: disable hugetlb_optimize_vmemmap when struct page
    crosses page boundaries
  mm: hugetlb_vmemmap: use kstrtobool for hugetlb_vmemmap param parsing
  mm: memory_hotplug: enumerate all supported section flags
  mm: hotplug: introduce SECTION_CANNOT_OPTIMIZE_VMEMMAP
  mm: hugetlb_vmemmap: remove hugetlb_optimize_vmemmap_enabled()
  sysctl: handle table->maxlen properly for proc_dobool
  mm: hugetlb_vmemmap: add hugetlb_optimize_vmemmap sysctl

 Documentation/admin-guide/kernel-parameters.txt | 22 +++----
 Documentation/admin-guide/sysctl/vm.rst         | 38 ++++++++++++
 arch/arm64/mm/flush.c                           | 13 +---
 fs/lockd/svc.c                                  |  2 +-
 include/linux/kconfig.h                         |  1 +
 include/linux/mmzone.h                          | 54 +++++++++++++---
 include/linux/page-flags.h                      | 16 +----
 kernel/sysctl.c                                 | 22 ++++---
 mm/hugetlb_vmemmap.c                            | 82 ++++++++++++++++++-------
 mm/memory_hotplug.c                             |  7 ++-
 mm/sparse.c                                     |  7 +++
 11 files changed, 186 insertions(+), 78 deletions(-)

-- 
2.11.0

