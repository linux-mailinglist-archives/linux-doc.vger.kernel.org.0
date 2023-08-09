Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1C2776CCD
	for <lists+linux-doc@lfdr.de>; Thu, 10 Aug 2023 01:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbjHIXYd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Aug 2023 19:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbjHIXYa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Aug 2023 19:24:30 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0841FCC
        for <linux-doc@vger.kernel.org>; Wed,  9 Aug 2023 16:24:27 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-686b643df5dso251900b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Aug 2023 16:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691623467; x=1692228267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tar+fwRF9EwexnZBlGXBQ+bino7OPSUOa9FVKEDgW8=;
        b=qdQX3WNwo4sWt4WkjKnJ08HLG31URbRoXVf7H5AnZ3n4OTaa437cOko2jjYggYBNx3
         Uqtl8hjdOaQ5sFdI1pNdsg5WlvudRipmfEHH3jC3kSBPVvsl7sDCBIi9hJH3htjd+Scj
         +x4lyW8BfGjDQRdW6mPcEQh967lWkyY2MfrU8iYYuoqSur4+c4vzP8UjeTWZVpmWsXTi
         GrPLP1dKdTJl7/hWM1px5eML9DIPSblOF40Phwg5YuT2IX5LPipDqccZemKALDv8ntos
         VpDwK38TgYbp1DMAPUyfGhk2yDGhNkoAIbI8xAeXULhQkWloI08NyYlwSj+DJ7tiDJ+v
         bzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691623467; x=1692228267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tar+fwRF9EwexnZBlGXBQ+bino7OPSUOa9FVKEDgW8=;
        b=FiEo1SF8fK8z5jk/WJP9rLzViGHi/7HKBi48M8yU4lRdHtmT43E2nUo5Fxuby8qLq7
         Bzn2R3mTjor4R8kRc1gmw62bZP9xUZWWdMDs/a3XlP7VAPNQixn9iSHtU1BYI/2n5tOR
         wMCt5nbTwLqSC+dO+WOhkjoASCEs0monUhvBsiJE7JskRI8OEpjFYneLPPL5hUBzmaO/
         q61BCFw7AlrCYuQ1a/6q7+8x4+8I9TyhnEogIa50Xhl928o9WFgRpvNW2aOvDcg4ZgfH
         S54WqGndgv7OrJS2v7AbxgIRqd1MILseAiI0XydYG7k7Z8YNJAKqddxphcZKihrTM+5J
         5UrA==
X-Gm-Message-State: AOJu0YycVuIO4jBlCwl6Us9i4mMYMJI4zgjBntEDefXuoOdjMrdvbYdU
        vx2nTccRrqzBfWkXEzurqwmO+g==
X-Google-Smtp-Source: AGHT+IHPggFTtnxabsF/jkLvnF3G7KP5USE4CizFGjoAWFxir/OOf3x64PmOQQ970Z2IhxBU3MEknw==
X-Received: by 2002:a05:6a20:12c2:b0:131:4808:d5a1 with SMTP id v2-20020a056a2012c200b001314808d5a1mr781717pzg.28.1691623467045;
        Wed, 09 Aug 2023 16:24:27 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902d35200b001b54d064a4bsm82765plk.259.2023.08.09.16.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 16:24:26 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     charlie@rivosinc.com, conor@kernel.org, paul.walmsley@sifive.com,
        palmer@rivosinc.com, aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
        alexghiti@rivosinc.com
Subject: [PATCH v10 4/4] RISC-V: mm: Document mmap changes
Date:   Wed,  9 Aug 2023 16:22:04 -0700
Message-ID: <20230809232218.849726-5-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809232218.849726-1-charlie@rivosinc.com>
References: <20230809232218.849726-1-charlie@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The behavior of mmap is modified with this patch series, so explain the
changes to the mmap hint address behavior.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/riscv/vm-layout.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 5462c84f4723..69ff6da1dbf8 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -133,3 +133,25 @@ RISC-V Linux Kernel SV57
    ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+Userspace VAs
+--------------------
+To maintain compatibility with software that relies on the VA space with a
+maximum of 48 bits the kernel will, by default, return virtual addresses to
+userspace from a 48-bit range (sv48). This default behavior is achieved by
+passing 0 into the hint address parameter of mmap. On CPUs with an address space
+smaller than sv48, the CPU maximum supported address space will be the default.
+
+Software can "opt-in" to receiving VAs from another VA space by providing
+a hint address to mmap. A hint address passed to mmap will cause the largest
+address space that fits entirely into the hint to be used, unless there is no
+space left in the address space. If there is no space available in the requested
+address space, an address in the next smallest available address space will be
+returned.
+
+For example, in order to obtain 48-bit VA space, a hint address greater than
+:code:`1 << 47` must be provided. Note that this is 47 due to sv48 userspace
+ending at :code:`1 << 47` and the addresses beyond this are reserved for the
+kernel. Similarly, to obtain 57-bit VA space addresses, a hint address greater
+than or equal to :code:`1 << 56` must be provided.
-- 
2.34.1

