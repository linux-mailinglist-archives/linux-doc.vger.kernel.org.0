Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83E48653D5C
	for <lists+linux-doc@lfdr.de>; Thu, 22 Dec 2022 10:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiLVJRJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 22 Dec 2022 04:17:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235003AbiLVJRG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Dec 2022 04:17:06 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F5C20F45
        for <linux-doc@vger.kernel.org>; Thu, 22 Dec 2022 01:17:05 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id u19so3434120ejm.8
        for <linux-doc@vger.kernel.org>; Thu, 22 Dec 2022 01:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWgdTaVoa5qu+SyKBPOqpyG8l+WOI84pd0n3Dy38GcU=;
        b=U0oIHqjyc/QAR8FDSw9DidXPhhKEKPzFBYt9+d2EmqwGfptBLDtVhcIOndYbHCbvJ8
         2t5WJcvI4GzXA0qeCRSAj7FGJM7+iLIQ6YsL1Xmbw2tnWTd9xRenq33ync9u+OWSGLum
         /nHT+Dwx4i3YIz3FRW87xA79vqXhvpxGeDklfoFhbMnbkmZ8XwpKTZcMhPbNNC4a0hnq
         QPOucczRbQSBKzg2Znj/63d2CKwaFjI7d9hw31bTonYWWV6VDHVU/X8lhgD+aJAjHkFe
         1WMYQd08j3QEkVta80CONk+JpqomQ5pLfqytUlQzrNtZDgG5xJjp1+cRFVXlUkolBkPC
         VktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWgdTaVoa5qu+SyKBPOqpyG8l+WOI84pd0n3Dy38GcU=;
        b=NU+mrEI7wZUpqzYeWZgXrgnoJEfTJHncP2BHWQgEniwMA5Licf4PYwvNqwKtH39V80
         hyyWojyARI8GKhWAyJlPrpWwKmDKreE0l8bTnr55EdxTaKjL0CU0AFhEmsB/nX+/Qzis
         KkgyCzUQ1B9qWvAoUyrtZ7eZRGM7GJSjqaf/wRMb7iJjfyiZ1Bh4LYAuzcuuOAZEw+3t
         O01F9Yf+F7sZo6vpluizEXvIL62LjotzxgkdgAhjxxXyrdTAdAVWd7CvHxDYHB5uluyJ
         DlCQfz8yaeWqOvwZv6WrWN8MVb3kF+18tyfDF4mPi/KuGm7Xsk4+agZChTdmqn+n4ro9
         USiw==
X-Gm-Message-State: AFqh2ko2e7plZwagbTGuIqIdAqy45vAjpFqvgWGKw6ZzkrBm20kGlhv0
        4Yxk7AV0pypZDreaLFr3fUxpVQ==
X-Google-Smtp-Source: AMrXdXuAhZXJjeqFNgfF9FOIJBrdld+yAZuaSog/qvpLdb2c0jE829UuVB5H8G9GoA2gjp4kzvfJhQ==
X-Received: by 2002:a17:907:6e16:b0:7c0:9f6f:6d8 with SMTP id sd22-20020a1709076e1600b007c09f6f06d8mr5040158ejc.2.1671700623648;
        Thu, 22 Dec 2022 01:17:03 -0800 (PST)
Received: from alba.. ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090682cc00b007c6be268252sm29072ejy.77.2022.12.22.01.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 01:17:03 -0800 (PST)
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
To:     gregkh@linuxfoundation.org, sashal@kernel.org, corbet@lwn.net
Cc:     stable@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, joneslee@google.com,
        Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] Documentation: stable: Add rule on what kind of patches are accepted
Date:   Thu, 22 Dec 2022 11:16:58 +0200
Message-Id: <20221222091658.1975240-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The list of rules on what kind of patches are accepted, and which ones
are not into the “-stable” tree, did not mention anything about new
features and let the reader use its own judgement. One may be under the
impression that new features are not accepted at all, but that's not true:
new features are not accepted unless they fix a reported problem.
Update documentation with missing rule.

Link: https://lore.kernel.org/lkml/fc60e8da-1187-ca2b-1aa8-28e01ea2769a@linaro.org/T/#mff820d23793baf637a1b39f5dfbcd9d4d0f0c3a6
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/process/stable-kernel-rules.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/stable-kernel-rules.rst b/Documentation/process/stable-kernel-rules.rst
index 2fd8aa593a28..266290fab1d9 100644
--- a/Documentation/process/stable-kernel-rules.rst
+++ b/Documentation/process/stable-kernel-rules.rst
@@ -22,6 +22,7 @@ Rules on what kind of patches are accepted, and which ones are not, into the
    maintainer and include an addendum linking to a bugzilla entry if it
    exists and additional information on the user-visible impact.
  - New device IDs and quirks are also accepted.
+ - New features are not accepted unless they fix a reported problem.
  - No "theoretical race condition" issues, unless an explanation of how the
    race can be exploited is also provided.
  - It cannot contain any "trivial" fixes in it (spelling changes,
-- 
2.34.1

