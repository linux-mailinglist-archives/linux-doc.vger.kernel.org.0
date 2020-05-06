Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0561C6D51
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2020 11:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729104AbgEFJlc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 May 2020 05:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729194AbgEFJlc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 May 2020 05:41:32 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7058DC0610D6
        for <linux-doc@vger.kernel.org>; Wed,  6 May 2020 02:41:31 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id u10so258404pls.8
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2020 02:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3DDovhauMkogXrTb9Ryx5FL/QviqwI6Y6CqY+5NUf+I=;
        b=Q9VGl04I1Ad+Dbvc+uiDufa8ZJ1I95O88iQvrExlbyd0dBjQfw7k1ZnpT9vokfRZoq
         3TyWH/918m4KX8t1xCfXFKZhmfyNjsvWrm4hN1PS957h64Fo803NipqyraoLiJPzOLsT
         fGZjISK1IEzk3gZ334PXrMiZaXvyvE9iIOjdlLa3Dc7thCpguXyF4xhp84OqPDmeG+Rm
         GJZCSpBtkmmshn52PgWyycZVyDwA7XGVv46WjoL2Hig6fWalWB23JkGiuIFST0LdR19S
         XCHEDIUW4ls5t3mV3MGvsvLym0ewqzWZxx+SOI2V5DCLETyfTm2TAUMHR68aVe3Ofkm4
         Ncfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3DDovhauMkogXrTb9Ryx5FL/QviqwI6Y6CqY+5NUf+I=;
        b=AwX2lcSt/anPDQEmda3Pm1X8EQ0Nkz/O9nN8FjmqhcinqbnjYlarHw3PWNS7fEYFCp
         rcMwlSsMwZBb+r8iVibYk+3V8wV8GB/u3v+2pmL8K/X14rxZt7W+Ej50r+HI/toUKaRg
         Yh2GRmx3F6s76yhnwYuvjVGpoy5e4KG0yuBKRvLm+WwNc/JCNaoWb/UaGe69swzswP79
         vFla6dCToe+6KkE8NtVuFV4a32/hLOXTpt++N7hghQXZhN1tr7wIEpVC4gbXCiciMiZH
         dEmdAHZ6UKt3TLBFELHq3Clqgtlkx6x7uSBSN+RWiqZw0A7igmCvqnUO0O+pdrazZeS6
         qFhw==
X-Gm-Message-State: AGi0PuYf6UbpdgIQvoh9XeX29Tm6CrRJdtLfu1DN4Drx3OTtrmoEJYaK
        9iEHqsi5Hjl/p/RMfwNh8ujw5g==
X-Google-Smtp-Source: APiQypJep+vzKwYkiq8tNVcoRKBQqvygmDMiU3wmwYTRCujJ4dpxH504cMcQBD+J7HVm3fH3jpT+vw==
X-Received: by 2002:a17:902:b187:: with SMTP id s7mr7558369plr.0.1588758090965;
        Wed, 06 May 2020 02:41:30 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.141])
        by smtp.gmail.com with ESMTPSA id a2sm1337360pfg.106.2020.05.06.02.41.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 02:41:30 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     jarkko.sakkinen@linux.intel.com, zohar@linux.ibm.com,
        jejb@linux.ibm.com
Cc:     dhowells@redhat.com, jens.wiklander@linaro.org, corbet@lwn.net,
        jmorris@namei.org, serge@hallyn.com, casey@schaufler-ca.com,
        janne.karhunen@gmail.com, daniel.thompson@linaro.org,
        Markus.Wamser@mixed-mode.de, keyrings@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org, tee-dev@lists.linaro.org,
        Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v4 4/4] MAINTAINERS: Add entry for TEE based Trusted Keys
Date:   Wed,  6 May 2020 15:10:17 +0530
Message-Id: <1588758017-30426-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588758017-30426-1-git-send-email-sumit.garg@linaro.org>
References: <1588758017-30426-1-git-send-email-sumit.garg@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add MAINTAINERS entry for TEE based Trusted Keys framework.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b816a45..fc8bf16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9403,6 +9403,14 @@ F:	include/keys/trusted-type.h
 F:	include/keys/trusted_tpm.h
 F:	security/keys/trusted-keys/
 
+KEYS-TRUSTED-TEE
+M:	Sumit Garg <sumit.garg@linaro.org>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	include/keys/trusted_tee.h
+F:	security/keys/trusted-keys/trusted_tee.c
+
 KEYS/KEYRINGS
 M:	David Howells <dhowells@redhat.com>
 M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
-- 
2.7.4

