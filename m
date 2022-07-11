Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F965709BE
	for <lists+linux-doc@lfdr.de>; Mon, 11 Jul 2022 20:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbiGKSLY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 11 Jul 2022 14:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbiGKSLX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jul 2022 14:11:23 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BF820F5D
        for <linux-doc@vger.kernel.org>; Mon, 11 Jul 2022 11:11:18 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-31cac89d87cso49952517b3.18
        for <linux-doc@vger.kernel.org>; Mon, 11 Jul 2022 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=37XjpwINbIdCZOixjlZ7DvCc9OsQ74PUxXtDLJLAMo4=;
        b=IGiyhqhxriPnKAgqV311rQDmdO12mi2/guaqtzz3mgBzIbpqRQMHf7uelOX72j4nGc
         MYbky0QOOv8+y7b5C9oVG4vxM7XJDppT1Sx+Un/13hdgwUdPIF/wuesJYIrsSNdOxEhC
         3jZAR38HwfyjjdawLFfgrHZmGHp5crwHTY5xWVXsHgsHTQ9qgwCUOIrCBscNWnKCIrRr
         9tqXJG4uZSX+5Ug0rC1T3GoYb6pMwZGFpZ0upBjcRHXeKd+KunH/etzIhdbD+9mYUhU8
         7kBkGn8xR8SDxMHYd+GgA35EdNby72zVXx92yrj7VpYLw0WXVlrl6H1KbTFBVgSZHQwh
         ZEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=37XjpwINbIdCZOixjlZ7DvCc9OsQ74PUxXtDLJLAMo4=;
        b=28Hu1qUcnZ67kTSXcihd3ZGVcPemNC9NNZOdsT/On60WHAnhuXEIAOg7oahIH3xpAT
         QR6RiLNiSJkVh5bC9yQTrCQqM0bmnVRkJwBTGpJJBm/j7dXET73z+8RNXD8G2dn7coxz
         iOkZWhYKS/CZ/tvuxOKrQgkVJe+YUZ5RBnPyXsS6OaY+T5q3YxKPpbXzdfLhLqysbEt+
         MPX9aKetkO8GLzLVWOIa4ywjUMzmWwcXmA/uEuDEPabbAAbbCPXV9r+8f82dT3wH/hOu
         4ysq54WzX/IF3eC6i0AKELyBdpHfp//dzpbmVMUspZX48O65J0AiScwVnGgBtMgi1rf7
         Tx4g==
X-Gm-Message-State: AJIora/gyQYLkG9oZvb1TrSINKl3OWqQ99sLluavQmjFolfwrtgzQ/Eu
        wNS7+FgaNqIt2Ifiv03YGkvQhUEzs3MKi7IvaaY=
X-Google-Smtp-Source: AGRyM1t3o9MGllrJmYwYsI6Eh1blY0EaoLJloeGoMm8iXYkkrvr9JNskwbGliGv3yrbPrkQJtDpHenoxX1qKCva3hq4=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:1f7d:643f:d86b:d30])
 (user=ndesaulniers job=sendgmr) by 2002:a81:998e:0:b0:31c:3c64:ceae with SMTP
 id q136-20020a81998e000000b0031c3c64ceaemr20750431ywg.494.1657563077827; Mon,
 11 Jul 2022 11:11:17 -0700 (PDT)
Date:   Mon, 11 Jul 2022 11:10:58 -0700
Message-Id: <20220711181101.1559558-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657563058; l=1024;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=UwBPgIcopp176p+9NLELYyArInZxsbOzJt598/EPZHw=;
 b=FFllqwq8yPj+R6TWOEXNM/20Ih2vUuarPXeoC0vRo+LhfHMzE6uno3y1ovfyYPHNKok9IN7Pha/J
 vN/MdOtbBo/XF1PjkbttYs3NzLl3ApI8dCvX6b/3/k3hGvH9ArdI
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH] Documentation/process: Add embargoed HW contact for LLVM
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Darren Hart <darren@os.amperecomputing.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Should the need for toolchain mitigations ever be necessary, add a group
for toolchain ambassadors.

Add Nick Desaulniers as LLVM's ambassador for the embargoed hardware
issues process.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/process/embargoed-hardware-issues.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index 95999302d279..48bd249d96b9 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -264,6 +264,9 @@ an involved disclosed party. The current ambassadors list:
 
   Amazon
   Google	Kees Cook <keescook@chromium.org>
+
+  GCC
+  LLVM		Nick Desaulniers <ndesaulniers@google.com>
   ============= ========================================================
 
 If you want your organization to be added to the ambassadors list, please
-- 
2.37.0.144.g8ac04bfd2-goog

