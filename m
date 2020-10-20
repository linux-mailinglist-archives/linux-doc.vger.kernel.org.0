Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40EBD28A187
	for <lists+linux-doc@lfdr.de>; Sat, 10 Oct 2020 23:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgJJVND (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 10 Oct 2020 17:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731183AbgJJTxO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Oct 2020 15:53:14 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E139C0613DD
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2020 02:37:38 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k8so9035282pfk.2
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2020 02:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uY6vICbjDw3/Nue8pip9A8mVoEd17wpGPbuSUfwpgAU=;
        b=ZExhGn5E7TXEAkrOuICsp54Kn74Ct9cwsfd90HFmv+XN2tQ942iV3ILHBfOgo08WlT
         ZoWJnvomag6+gHkPcheBZq5Y9Ejh62rC8TuDG5Dj/iD0wEvxoNuVNyNlnAyEb6JK23z6
         CKXSW6YBgYNkxycXtKeQPWhTn7zYA1XMV7Hi+yme7WdIY+mEFE5G4CorQZcGVsNpWNEg
         UJr7cgxW7hHfgrH87WpxmuWPhJs45PfR4AJsLlWLG8bHsrpEIwb6VtJr+xUTeZg3n2LA
         7MScPliDIpMr8goqp62304++kV062l+BRt469hSNLwqb4Q1mXDZxOVJJ2hz76ebmsgU4
         akqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uY6vICbjDw3/Nue8pip9A8mVoEd17wpGPbuSUfwpgAU=;
        b=LDgP/PgiRbdLGj/SQjq51gFO9jKpHuzf8sP4OR4ELCCklf1Gc6MpUnPr/v9dtwT3m0
         c2Fqs3UejN2VY8vZzvNq71bigTxR5CQeNqxUPtruet7hvc15cM0NF+SK4oVxJCa9uzF5
         nz3j3sdchLIm6zCjfhrBMp8vt5bvIJ6srLQXOLYiXbja8+bnlERvoS0ppsd01aUv77A/
         EHmfPMK4c01OBoogtRpjpTFecXen2tlYjGlGhf4rpCoNZZxDMOdodOuvEsR+YGGfLejI
         zHZ+sYz+xQ/q5ud7Rx3al/3CrAZ8OHE+3e2Rmtqx9oZWGkHDJA5uENH/fngrgXVLU2K3
         QUtw==
X-Gm-Message-State: AOAM532fIVfiI11PASJ9WRWairXiW1OpPUFEXFlXok+2wBrZZjVw+ym5
        PAQRT1rfRvPxUS2a+lRBn5mifA==
X-Google-Smtp-Source: ABdhPJyytESe/AHRO3S9jwTuCwjstQ6JjoCgGo3kxsZX9PXWwayWGDrEuzzbG6UuArzf20PBChrRiA==
X-Received: by 2002:a62:1851:0:b029:154:8ed7:bf5d with SMTP id 78-20020a6218510000b02901548ed7bf5dmr15732802pfy.66.1602322657935;
        Sat, 10 Oct 2020 02:37:37 -0700 (PDT)
Received: from Zs-MacBook-Pro.local.net ([103.136.220.68])
        by smtp.gmail.com with ESMTPSA id d128sm13793124pfd.94.2020.10.10.02.37.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Oct 2020 02:37:37 -0700 (PDT)
From:   zangchunxin@bytedance.com
To:     corbet@lwn.net
Cc:     andre.azevedo@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunxin Zang <zangchunxin@bytedance.com>
Subject: [PATCH] Documentation/scheduler: Modify the description of sched-stats column 9
Date:   Sat, 10 Oct 2020 17:37:30 +0800
Message-Id: <20201010093730.28567-1-zangchunxin@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Chunxin Zang <zangchunxin@bytedance.com>

The column 9 get datas from sched_info->pcount. It's update
when context_switch only. So it meaning 'times' not 'timeslices'.

Signed-off-by: Chunxin Zang <zangchunxin@bytedance.com>
---
 Documentation/scheduler/sched-stats.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
index dd9b99a025f7..5fd17a85e7fd 100644
--- a/Documentation/scheduler/sched-stats.rst
+++ b/Documentation/scheduler/sched-stats.rst
@@ -59,7 +59,7 @@ Next three are statistics describing scheduling latency:
      7) sum of all time spent running by tasks on this processor (in jiffies)
      8) sum of all time spent waiting to run by tasks on this processor (in
         jiffies)
-     9) # of timeslices run on this cpu
+     9) # of times task hits this cpu
 
 
 Domain statistics
-- 
2.11.0

