Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 888A152E2BD
	for <lists+linux-doc@lfdr.de>; Fri, 20 May 2022 04:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242358AbiETC4b (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 19 May 2022 22:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233612AbiETC4a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 May 2022 22:56:30 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55655F8D9
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 19:56:27 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id m12so6312023plb.4
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 19:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=arFWL10Ch1n8yhdI9Mk3g6bNs91IYU+HlkP+JS3nOtc=;
        b=wizXH2T4i0hpvyt1QyLKg8TJlFJ0pfc6am4wF+te/O3S9glO8olN0SHXNgf4XMOoeA
         vV2Wnl58mBKeekoB6US+vMjbV3r6LPQEj/7d2af5doeUV7LO3RAnChsoB+paO63F+lE3
         gIPtQB8Ee/hMqlf28gB6G0/OTsSEN7FhLi5vHK0GQNb2sbI+CJfs5nHoUTlVCtnj/TYK
         Sk6i6HD1cC+PTtTSSAi94V29xLQ7WhlBol3au+V0pxZ3UHwyuy4gCQv6l6w5VW3jZVFl
         E8eSg2aW86VGC044TmzYkarO+G2YkcYUswMF/Gshk+GKcHuvJgULhv9XTs+YgMxXR6w6
         3fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=arFWL10Ch1n8yhdI9Mk3g6bNs91IYU+HlkP+JS3nOtc=;
        b=40tWsvfxyFNvqSdXyEes30sMJJ2iaSD0UoUtScqAmP1EHT9BRyVEsf31OwwsELEWWD
         NXIr2EN2wkh2JFmYmXYwieo9CmE180LcvMgQ+gwBFUkFxUH7LjxYahJ52vw9OsSo5p2C
         c/ElHrZdFV9sYnHIDciTg/75T5w1ZuZC/r5evYK0bEQuqkPNBvKPegJQdvPDQbPYpCSe
         L8zzXxB+4qwgLDKhPFk0+UHx91OcGcQZpPeyxGD9ueDaPge91ZLhmFbCsgFi9jiTooFc
         2AX4HnJJJYKu0bqL0H5CYJ1iNFxo4vjuXRHVnl7UarEaGSkRXmdhR6oDjDAfQUkNEdY+
         MpjQ==
X-Gm-Message-State: AOAM533mEI3mgrvSbQvBk/xeJHeR6OWYFaTSmNJxFM8eZnG9VLngOc7k
        AMVoL6LhykALzUfOV8Zhc4sCDQ==
X-Google-Smtp-Source: ABdhPJzmfzbWN5y+2+2LQpGTfqGvPCPq3Ax+cTXuRcr74nqsBxj1mht756PZTm11HL7tsYT9gkMvYw==
X-Received: by 2002:a17:90b:4d0c:b0:1df:c9a6:84d8 with SMTP id mw12-20020a17090b4d0c00b001dfc9a684d8mr8900143pjb.231.1653015386971;
        Thu, 19 May 2022 19:56:26 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id o10-20020a62f90a000000b0050dc76281a5sm225675pfh.127.2022.05.19.19.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 19:56:26 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, akpm@linux-foundation.org, paulmck@kernel.org,
        mike.kravetz@oracle.com, osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 0/2] make hugetlb_optimize_vmemmap compatible with memmap_on_memory
Date:   Fri, 20 May 2022 10:55:36 +0800
Message-Id: <20220520025538.21144-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series makes hugetlb_optimize_vmemmap compatible with memmap_on_memory
and is based on next-20220518.  The reason refers to the patch 2's commit log.

v2:
 - Fix compile error when !CONFIG_ZONE_DEVICE reported by kernel test robot.

Muchun Song (2):
  mm: memory_hotplug: enumerate all supported section flags
  mm: memory_hotplug: introduce SECTION_CANNOT_OPTIMIZE_VMEMMAP

 Documentation/admin-guide/kernel-parameters.txt | 22 ++++----
 Documentation/admin-guide/sysctl/vm.rst         |  5 +-
 include/linux/kconfig.h                         |  1 +
 include/linux/memory_hotplug.h                  |  9 ----
 include/linux/mmzone.h                          | 71 ++++++++++++++++++++++---
 mm/hugetlb_vmemmap.c                            | 28 +++++++---
 mm/memory_hotplug.c                             | 28 +++++-----
 mm/sparse.c                                     |  8 +++
 8 files changed, 119 insertions(+), 53 deletions(-)

-- 
2.11.0

