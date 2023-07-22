Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB9975DF3E
	for <lists+linux-doc@lfdr.de>; Sun, 23 Jul 2023 01:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjGVXPR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 22 Jul 2023 19:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGVXPQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jul 2023 19:15:16 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B29B1708
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 16:15:15 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7659db6339eso149831985a.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 16:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1690067714; x=1690672514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXElrv06JK6ubX3O8HfdY1dTf7E2OdArtAZ3IXA7EKs=;
        b=MqCdFdFdVTTsNdqd7a+xzhmq+/LUHtdY6xsY5wr3z4/kwOiTDbnyLic0aYc5jSUAai
         Fls1V658MGJnX5mm8K/uAxOlFLYzEUz+Japtx9a4BnSvSX4VJmkvFOl5XDIKf06sDPKX
         21UiJ6w6gXx4dFsxzua0q7bp7P16vsnZ/HYO38i2CC1ihjSEx8dl2J1tmHXJxfcGtS2U
         f6J0PeiE2z58XMKgEuJsjbuxKK1dtbQTRriU5fO4Tf+ljmHbqqapHubprl7UOROa/09y
         DGetG6MBSsoaPIw9C8YA9es8Ouoe5qbzpO9ZeolUU2GCXJ2MqDm6VWevM+3zD8zddiVf
         vwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690067714; x=1690672514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXElrv06JK6ubX3O8HfdY1dTf7E2OdArtAZ3IXA7EKs=;
        b=Fs8i47XvKVOQ74mnhww3tmstyGsIQwUc8DvnkVttWuqGJcBPPbMGQys9NYVAil4epf
         1CYdyHWat2k1FiDhnZ2ICTcJhCbutJFZLg4m0WumGynCaX937aa6Io0/tU9A08uo0272
         KvmjZYSDkzHG/2qcjVNJRAZ+ev0cz3ahlFCC401Kzl+FpzxJS3NPR2lRjNNrb/CvAlwR
         HnPSgTql0hh8y4/Seez2svK8pA279tCHWcffDDxn7a+xzYpa7klHIWrWFq2rmZnjMa16
         5M7nv1hYAFrDsUjY4pqoHNpaZT3B/2/M/YDU0Mpccem0YlmrX+C6RGzPc2Xj+9+816N7
         owvA==
X-Gm-Message-State: ABy/qLaLl2/ssFSkBqfRX+bnn4M01oxc6KYRq2OVcXeZFZin1DgfjWHV
        kqlFOXmr7uSEDohuRwkoaYY2HQ==
X-Google-Smtp-Source: APBJJlEwEWhxXUuJjs4OHq12cJyfHYs2GwALr861Aofp1I2rAlFZ0uSkxnIVzvs0yNYsBhj+03etpQ==
X-Received: by 2002:a05:620a:258b:b0:767:dd1e:967b with SMTP id x11-20020a05620a258b00b00767dd1e967bmr3977698qko.39.1690067714674;
        Sat, 22 Jul 2023 16:15:14 -0700 (PDT)
Received: from soleen.c.googlers.com.com (193.132.150.34.bc.googleusercontent.com. [34.150.132.193])
        by smtp.gmail.com with ESMTPSA id u21-20020ae9c015000000b007675c4b530fsm2075957qkk.28.2023.07.22.16.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 16:15:14 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, akpm@linux-foundation.org,
        corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com
Subject: [PATCH v2 0/3] page table check warn instead of panic
Date:   Sat, 22 Jul 2023 23:15:05 +0000
Message-ID: <20230722231508.1030269-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changelog:
v2:
 - Moved "Check writable zero page in page table check" to be last in
   series so not to add more BUG_ON.
 - Removed page_table_check=panic as was suggested by Mathew Wilcox
v1:
  https://lore.kernel.org/linux-mm/20220911095923.3614387-1-pasha.tatashin@soleen.com/

Page table check when detects errors panics the kernel, instead,
print warnings as it is more useful, and it was agreed the right
behaviour for kernel.

In case when panic is still preferred, there is panic_on_warn sysctl
option.

Pasha Tatashin (2):
  mm/page_table_check: Do WARN_ON instead of BUG_ON
  doc/vm: add information about page_table_check warn_on behavior

Rick Edgecombe (1):
  mm/page_table_check: Check writable zero page in page table check

 Documentation/mm/page_table_check.rst |  5 ++--
 mm/page_table_check.c                 | 39 ++++++++++++++++-----------
 2 files changed, 27 insertions(+), 17 deletions(-)

-- 
2.41.0.487.g6d72f3e995-goog

