Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0BC220CDC
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2020 14:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbgGOMXj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 15 Jul 2020 08:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728766AbgGOMXi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jul 2020 08:23:38 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F742C061755
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2020 05:23:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f7so2492834wrw.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2020 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVdISYiS8HEy4aersiAqtxJUUdWsfYZxho+YIECAEc0=;
        b=EENkeYdpmz+Fa/oxs41nGObcWJcqqjRB5xU7cJqLc5cQW53tOkVHHOJktnz14IYzeO
         zY69n3pCHyfUAHCCf2t9Hcb0PhXUn15FIqjzEDVh83Gwn5aK0w28sCLaByaqikWHwgG6
         Ogy+ikd4Avjs6CMSGlYKBUpzEGvMjmLQVJU6yCM5NZac2KBmrWnShRVpYo4GAfe9XkmR
         1scWq8aM+241SZ0CPNxEWkiaHUSU/Sn3oVwMFZC33tXA8eosT+boqtlGMe9QjT0N8hX5
         vUD89hjtG1J4TT0dK1TUS4u5wr6Ogo0GQBLHHv1nEVOHgYIiH9HW2vXuWFegEh6DOVQL
         Dk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVdISYiS8HEy4aersiAqtxJUUdWsfYZxho+YIECAEc0=;
        b=NYeiGVN+fDqCAn6E+HjABJ+SkI0EdoOU8T8JcPYjraQyDYUcIXvW+Q1ryJQRVEbLXu
         XZSC3s7CRLdH/H+UyIhpuZ9VBBNe/wxWzJboEk8fa6IS/z2ZpFdIEkWsugHL9oGTb7st
         FmHiOD9BDnDQH6S/HvsxMmPNsxizSmp8JGVe3boO1lzM5gUfiS05WmM9+FrLHmyjzJnu
         ebxdZ4OtPNB62zfjLf7RT3oXkrG4aZZScn2+akWid1cSckYCsFj38eFqbnPbrbdmM2ea
         hhe6tcaCZEdHPrdT4pCKB83gKFMjYLRKCmEv/+aBcG4hRZySV2MlPyesVpoe/oM41KP4
         8SFg==
X-Gm-Message-State: AOAM531o68l6F0SY6zcpA5G1aCHLPv7bND5y1u6M5X/j8eWHShfayqSz
        YHaLpvNXSOsc+//IB85dPeVe5g==
X-Google-Smtp-Source: ABdhPJyeV0wB0fonR/LRwQmNyWEbnt40Y6ckiqhq2xVKDDt9GQw+UZwL96kZeAjpEwtq7O8vVIlSpw==
X-Received: by 2002:adf:f784:: with SMTP id q4mr11028896wrp.397.1594815815609;
        Wed, 15 Jul 2020 05:23:35 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id l67sm3753409wml.13.2020.07.15.05.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 05:23:35 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH 1/1] doc:it_IT: process: coding-style.rst: Correct __maybe_unused compiler label
Date:   Wed, 15 Jul 2020 13:23:28 +0100
Message-Id: <20200715122328.3882187-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Flag is __maybe_unused, not __maybe_used.

Cc: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: clang-built-linux@googlegroups.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/translations/it_IT/process/coding-style.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/it_IT/process/coding-style.rst b/Documentation/translations/it_IT/process/coding-style.rst
index 6f4f85832deea..a346f1f2ce21f 100644
--- a/Documentation/translations/it_IT/process/coding-style.rst
+++ b/Documentation/translations/it_IT/process/coding-style.rst
@@ -1097,7 +1097,7 @@ la direttiva condizionale su di esse.
 
 Se avete una variabile o funzione che potrebbe non essere usata in alcune
 configurazioni, e quindi il compilatore potrebbe avvisarvi circa la definizione
-inutilizzata, marcate questa definizione come __maybe_used piuttosto che
+inutilizzata, marcate questa definizione come __maybe_unused piuttosto che
 racchiuderla in una direttiva condizionale del preprocessore.  (Comunque,
 se una variabile o funzione è *sempre* inutilizzata, rimuovetela).
 
-- 
2.25.1

