Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB8E3D4A51
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jul 2021 23:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhGXVJ2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 24 Jul 2021 17:09:28 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:58698
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230371AbhGXVJ0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jul 2021 17:09:26 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 5A06A3F352
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 21:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627163396;
        bh=YaYGR91qsiSocIs8IC8xy1Q/DfuvgUc0SvOHFTtp8Po=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=CVQrCj9gfFjwb5m0USKzpFyTpJ4IAk1rUJXxO8G/I+lQKAuZnV/kQYpbmIBUTxaZ5
         +ae+iluDBqG/xxRrmERCsfcMNXVczqKdqLGI/vFbqjpSPPeMQj9hoAb5gMyScXmrgb
         e7qtZ02aA0Wuf1KEDFWGmQrPL7iQqOQJsxNBgZunETffehoE5uT7GamJ5u+B8BnwtX
         tLRrawh2roDzenUoBGkwmLbIOLCK8hiCHsRDXeJM4Zy5OsOY/0b2VzThEGHtV9THht
         PBMTM7/ASqzaP/DpZ4aeVuVyitZsEOpvJQCbrqcmr+RJ/8hnOV3DWClJEVaCbOeHN3
         6D9SrQNOs1xUg==
Received: by mail-ej1-f70.google.com with SMTP id o17-20020a1709063591b02905127dfeb6c7so1037143ejb.16
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 14:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YaYGR91qsiSocIs8IC8xy1Q/DfuvgUc0SvOHFTtp8Po=;
        b=P3Q66NC47XcsnDfwBb7bUbnNpBD/tR1Ts+M17KiSVMOA7OOuMBN5yZb/CtY5nJhrPO
         T3AbprN5j2ZXzF5FM34zIboq1rlgtwZUAHwtAsk/zxrdbnHy3UquMqFxUG0HVeijMSIj
         KnRbZSt8ETcGh5Z4XQnL6voZA5Fr88npwB+UZpv3q7zoLVoKhXbHtLUStfY7bIGwiOIo
         7Ecn1i1nni8v3di5eazaPsGHY1ktPA219tenI0D28zy8OpUzcmrC+vaf6BLsPZtsQhpJ
         Lgl5eHs3up5nScFWcSQOYhjWm51tpNdJkb46va//IiNtMr1XH9p+OGYQdgCzAn9gwPP8
         Oe/Q==
X-Gm-Message-State: AOAM530fAvDjcJpzusBEK6OS9Am7PMRs0A5ds69z90jlIyzZwCzxz4hr
        Gdi+TS90agJ8sKdnq2smBJyd6tMHZsXML6dFNkd3mS141mOJPo51reAVCxSB6x0TXtV0hznTS6W
        x1ZAP9zVj2satAevl8kDtXtMIkaIQHK/y1g8v4Q==
X-Received: by 2002:a17:907:1def:: with SMTP id og47mr10501863ejc.51.1627163396095;
        Sat, 24 Jul 2021 14:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyptb2lC5eNQ/8Ds9TdTrfNbFenR2CMYkDrtf1zT+eHhzYKImpUkxn5Xw9eViwKIQfNH0c+9g==
X-Received: by 2002:a17:907:1def:: with SMTP id og47mr10501850ejc.51.1627163395950;
        Sat, 24 Jul 2021 14:49:55 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id s10sm12821908ejc.39.2021.07.24.14.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 14:49:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Charles Gorand <charles.gorand@effinnov.com>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Mark Greer <mgreer@animalcreek.com>,
        Bongsu Jeon <bongsu.jeon@samsung.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH 11/12] nfc: constify nfc_llc_ops
Date:   Sat, 24 Jul 2021 23:49:27 +0200
Message-Id: <20210724214928.122096-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
References: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Neither the core nor the drivers modify the passed pointer to struct
nfc_llc_ops, so make it a pointer to const for correctness and safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/driver-api/nfc/nfc-hci.rst | 2 +-
 net/nfc/hci/llc.c                        | 2 +-
 net/nfc/hci/llc.h                        | 6 +++---
 net/nfc/hci/llc_nop.c                    | 2 +-
 net/nfc/hci/llc_shdlc.c                  | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/nfc/nfc-hci.rst b/Documentation/driver-api/nfc/nfc-hci.rst
index eb8a1a14e919..f10fe53aa9fe 100644
--- a/Documentation/driver-api/nfc/nfc-hci.rst
+++ b/Documentation/driver-api/nfc/nfc-hci.rst
@@ -181,7 +181,7 @@ xmit_from_hci():
 The llc must be registered with nfc before it can be used. Do that by
 calling::
 
-	nfc_llc_register(const char *name, struct nfc_llc_ops *ops);
+	nfc_llc_register(const char *name, const struct nfc_llc_ops *ops);
 
 Again, note that the llc does not handle the physical link. It is thus very
 easy to mix any physical link with any llc for a given chip driver.
diff --git a/net/nfc/hci/llc.c b/net/nfc/hci/llc.c
index 6ab40ea17662..fc6b63de3462 100644
--- a/net/nfc/hci/llc.c
+++ b/net/nfc/hci/llc.c
@@ -41,7 +41,7 @@ void nfc_llc_exit(void)
 	}
 }
 
-int nfc_llc_register(const char *name, struct nfc_llc_ops *ops)
+int nfc_llc_register(const char *name, const struct nfc_llc_ops *ops)
 {
 	struct nfc_llc_engine *llc_engine;
 
diff --git a/net/nfc/hci/llc.h b/net/nfc/hci/llc.h
index 823ddb621e5d..d66271d211a5 100644
--- a/net/nfc/hci/llc.h
+++ b/net/nfc/hci/llc.h
@@ -26,20 +26,20 @@ struct nfc_llc_ops {
 
 struct nfc_llc_engine {
 	const char *name;
-	struct nfc_llc_ops *ops;
+	const struct nfc_llc_ops *ops;
 	struct list_head entry;
 };
 
 struct nfc_llc {
 	void *data;
-	struct nfc_llc_ops *ops;
+	const struct nfc_llc_ops *ops;
 	int rx_headroom;
 	int rx_tailroom;
 };
 
 void *nfc_llc_get_data(struct nfc_llc *llc);
 
-int nfc_llc_register(const char *name, struct nfc_llc_ops *ops);
+int nfc_llc_register(const char *name, const struct nfc_llc_ops *ops);
 void nfc_llc_unregister(const char *name);
 
 int nfc_llc_nop_register(void);
diff --git a/net/nfc/hci/llc_nop.c b/net/nfc/hci/llc_nop.c
index a42852f36f2e..a58716f16954 100644
--- a/net/nfc/hci/llc_nop.c
+++ b/net/nfc/hci/llc_nop.c
@@ -71,7 +71,7 @@ static int llc_nop_xmit_from_hci(struct nfc_llc *llc, struct sk_buff *skb)
 	return llc_nop->xmit_to_drv(llc_nop->hdev, skb);
 }
 
-static struct nfc_llc_ops llc_nop_ops = {
+static const struct nfc_llc_ops llc_nop_ops = {
 	.init = llc_nop_init,
 	.deinit = llc_nop_deinit,
 	.start = llc_nop_start,
diff --git a/net/nfc/hci/llc_shdlc.c b/net/nfc/hci/llc_shdlc.c
index 1e3a90049da9..6b747856d095 100644
--- a/net/nfc/hci/llc_shdlc.c
+++ b/net/nfc/hci/llc_shdlc.c
@@ -820,7 +820,7 @@ static int llc_shdlc_xmit_from_hci(struct nfc_llc *llc, struct sk_buff *skb)
 	return 0;
 }
 
-static struct nfc_llc_ops llc_shdlc_ops = {
+static const struct nfc_llc_ops llc_shdlc_ops = {
 	.init = llc_shdlc_init,
 	.deinit = llc_shdlc_deinit,
 	.start = llc_shdlc_start,
-- 
2.27.0

