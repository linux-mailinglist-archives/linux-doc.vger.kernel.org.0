Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4DE51F4C7
	for <lists+linux-doc@lfdr.de>; Mon,  9 May 2022 08:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiEIGmh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 May 2022 02:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233156AbiEIGdU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 02:33:20 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F471882D1
        for <linux-doc@vger.kernel.org>; Sun,  8 May 2022 23:29:24 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id t11-20020a17090ad50b00b001d95bf21996so16157451pju.2
        for <linux-doc@vger.kernel.org>; Sun, 08 May 2022 23:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q/ROXewp2cxt4q3Bz4z9TGgbOWGYmpSqNQy/66wnJeM=;
        b=Nd+Eloii8ZKgFxPbiLDEdOiwu9gNmv7JQhUlmY18jKXPbt8GZYA3VbL+0xQKqnO/rs
         K51O5M/mOEAHIdWaUS3TzAOe2e3rIHF2xCRpeoVqGQG8x3TyUC7H1Ku50uE2gi4opZMo
         M7jWGEOulU2tOo6bBHGlDVgFQkHdgx/knt8Xs2cQC0MWU+7HBSFD8XiqDOyGyrChyDib
         VDuUwsnoJA7BzYQtXPiNkbBN9NCnyJ5JZ1Mb4feFscvUpp3VVJwrSL1Q3obb5OABQZbK
         3xtqpOUJpFYYR8AWZMuOoyrnfMzPvTGTLplK1T1ChNkqeyUzEOf6uwKDLO0mABCJtqxZ
         tV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q/ROXewp2cxt4q3Bz4z9TGgbOWGYmpSqNQy/66wnJeM=;
        b=dVU9egx+tFG3JheNoMg5PZcLyAtjKyVCIpWeNYqFRlyJ+ap+PaLMJn91EyXTKGAL9X
         DD9e3cP6C5EqDJHGBA6SBEpSHhEm5TcrD3knpuCsudOY+CXcA+XNpi1/619idZA1UaVK
         zwRIDtqa43Xebw7D3v/XRSIk31njF1mAA6FEh8lfBCqrk2X01IRzOx3Nte5rgDkU5v+N
         n4ezIxhWFHf2l8VI0xkksb377t4Ku24MDMsr3UC38b6NUBNIYLf/iwoOJJHfZMLZOsjk
         T1vBY5kxpBHJpzqQZRbkkhXOlHzCvOG+T8vDXK1wegrYaFhUCg+PxhMDkhEo5lcNlT4w
         iwvw==
X-Gm-Message-State: AOAM531/6mu/9+iKSc8euZC1CD1rbgDo6yrb/VSclmbcUzhg6HuYmTos
        iLfLJyHtoYHljmb/JEUNooaCuA==
X-Google-Smtp-Source: ABdhPJxwZiwU/4zQ7JSumL48lEGxXI7GAVzr7kAz6DKM+6n6aUS++edLr7xdJqjOjuqdGRPiyXaVUw==
X-Received: by 2002:a17:90a:cf89:b0:1d7:7055:f49c with SMTP id i9-20020a17090acf8900b001d77055f49cmr17109634pju.12.1652077756422;
        Sun, 08 May 2022 23:29:16 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id k17-20020a170902ba9100b0015e8d4eb2c2sm6162001pls.268.2022.05.08.23.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 23:29:16 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v10 0/4] add hugetlb_optimize_vmemmap sysctl
Date:   Mon,  9 May 2022 14:26:59 +0800
Message-Id: <20220509062703.64249-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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

Muchun Song (4):
  mm: hugetlb_vmemmap: disable hugetlb_optimize_vmemmap when struct page
    crosses page boundaries
  mm: memory_hotplug: override memmap_on_memory when
    hugetlb_free_vmemmap=on
  mm: hugetlb_vmemmap: use kstrtobool for hugetlb_vmemmap param parsing
  mm: hugetlb_vmemmap: add hugetlb_optimize_vmemmap sysctl

 Documentation/admin-guide/kernel-parameters.txt |   6 +-
 Documentation/admin-guide/sysctl/vm.rst         |  39 +++++++++
 include/linux/memory_hotplug.h                  |   9 ++
 mm/hugetlb.c                                    |   3 +
 mm/hugetlb_vmemmap.c                            | 105 ++++++++++++++++++++----
 mm/memory_hotplug.c                             |  27 ++++--
 6 files changed, 165 insertions(+), 24 deletions(-)

-- 
2.11.0

