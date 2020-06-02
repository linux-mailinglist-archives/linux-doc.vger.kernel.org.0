Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73FEE1EBDFE
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2020 16:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbgFBOTf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Jun 2020 10:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbgFBOTe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jun 2020 10:19:34 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D02C08C5C2
        for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2020 07:19:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id h95so1519213pje.4
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2020 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xCxdAYBVIrnVoprqZ3jc+GoVPrFZj6YiVt4v2J1Jy+c=;
        b=xY0giUdNw9UJ2TjpJyNqI4efCSRpXtJ7KKCsoCmsl7Kdk1y5wXcoLznAn3lxWsl7gE
         P0N0oaJKpEO4QHz3289dxJouCe3Ss924AcbddVxgz1ZBpwNu5NS4AF4iFgefY/XZ8haj
         l4e8qU+Gj+HDdPTtQ74oTHfApphH057dmr7/8WJkrtiz1zee+wHNNpWa6CQSTSsNJ0QW
         t8dbUyNW200HiMjzM+5w4tm+98SjEEiqF3pxh3PgDrsNWoEa4+EvBCH6vYkUhZ9gI0KK
         HfGbwzfPPfQI0pksrCWAmbeyOwCSGGdcTUuoPgkYbDKl6nKl1VzWOAuzCnv92EzERP3s
         xc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xCxdAYBVIrnVoprqZ3jc+GoVPrFZj6YiVt4v2J1Jy+c=;
        b=gwt7aMusWJVS2r9nyIFTl6LqM8/71fiO9JWCFZN1OBupbwoH0RUPY1VtRv9/H5USDt
         ZwErKWaG4/OGox28BUxAizYDcB60KtAK5vsSJMjkE3ejVxTARgeL4nL0hPHRKRjW2Ka+
         ad7VRkZGTsslVnHF7HoblJvgRCmzkb4ul+7gKGayowG7UIP9q5CYHWhJC+8dBCI8yKcH
         GoAiAB3vWep01sngjOqZFY+n6vEMi0vHIOpDdyymA6J2TkzZzy52ofYXMTl7AoCiYnpO
         0mPvSTRjxGQiuVROgu+4MpqPr3FSV2kqWoCkL2KZDDDpUyXhRI9jJj3kPTCPaL6Za4no
         WikQ==
X-Gm-Message-State: AOAM530iBxLLgyxNi33FXE0cJZsn2hOuObFcTJGv3HfKgYBoN7ffXVCZ
        ewaEiYuz1fTjpMtXOwvkQ7WdKw==
X-Google-Smtp-Source: ABdhPJxG830cH55AExGhe6B55/Arou3ybH7xW+GyhjWQJsAYEmUijypwo8iXX6XtFsQd8+bFbMS8dg==
X-Received: by 2002:a17:902:a9c1:: with SMTP id b1mr24928855plr.8.1591107571910;
        Tue, 02 Jun 2020 07:19:31 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
        by smtp.gmail.com with ESMTPSA id 141sm2529670pfz.171.2020.06.02.07.19.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:19:31 -0700 (PDT)
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
Subject: [PATCH v5 4/4] MAINTAINERS: Add entry for TEE based Trusted Keys
Date:   Tue,  2 Jun 2020 19:48:25 +0530
Message-Id: <1591107505-6030-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591107505-6030-1-git-send-email-sumit.garg@linaro.org>
References: <1591107505-6030-1-git-send-email-sumit.garg@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add MAINTAINERS entry for TEE based Trusted Keys framework.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b58ca2..50d0502 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9396,6 +9396,14 @@ F:	include/keys/trusted-type.h
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

