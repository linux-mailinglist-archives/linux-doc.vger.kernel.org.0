Return-Path: <linux-doc+bounces-16810-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C748CD3DF
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 15:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5986B22A0C
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 13:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4291E504;
	Thu, 23 May 2024 13:19:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5590E14AD1A
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716470361; cv=none; b=VNhppCNlN38rck2K+9FoIv33XzTyeebuomMw9phtkL0IAsMLo0UM9jkfjYcrz0LUpg7AbCqDFjrAAEzi94r2xUMOj8e6ayzGENtdZnVTHTMnGiXKAs7aS1B/rdDCo0vRYvQXu/VUSFLLsIlgi8frokuUmu3BRBmiEuHWioZjKj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716470361; c=relaxed/simple;
	bh=BCNVEcgkU7+tO0w4DqWtv5Adc7V8KuJiUTOcc0wVbu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DyqtRA2SERjtDKNmg+5L+dLfLspX3F4PV9jyVsr2yoYCU+7M5ZwIRTqXQtLFv+5x/vfErY27zZ3yrKZF5slKpdn83d0m2YyHJe9EqEiBJJ8K3E36fB85LH+aPQoW5u4+l8r0htHL8ux10oDVUokmbXkR5bHk5W3pWsK12nvTvOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1sA8LW-0002sd-B1; Thu, 23 May 2024 15:19:02 +0200
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1sA8LR-002fRe-S9; Thu, 23 May 2024 15:18:57 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1sA8LR-005g9l-2d;
	Thu, 23 May 2024 15:18:57 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 23 May 2024 15:18:29 +0200
Subject: [PATCH] docs: crypto: async-tx-api: fix broken code example
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240523-async-dma-docs-v1-1-b900e0804e11@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIACRCT2YC/x3MMQqAMAxA0atIZgNprSBeRRxqGzWDVRoQRby7x
 fEN/z+gnIUV+uqBzKeo7KnA1BWE1aeFUWIxWLKOWtug1zsFjJvHuAdFIp5M5x2TCVCiI/Ms1z8
 cxvf9AHQBbaBgAAAA
To: Dan Williams <dan.j.williams@intel.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>, 
 Maciej Sosnowski <maciej.sosnowski@intel.com>, 
 Andre Noll <maan@systemlinux.org>
Cc: linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

The code example fails to compile:

  1) ddr_conv is defined twice, once as a VLA, which have been phased out

  2) submit is not a pointer, but is still dereferenced with ->

Fix these issues and while at it, make the functions static as users
are unlikely to export them.

Fixes: 04ce9ab385dc ("async_xor: permit callers to pass in a 'dma/page scribble' region")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/crypto/async-tx-api.rst | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/crypto/async-tx-api.rst b/Documentation/crypto/async-tx-api.rst
index 27c146b54d71..2fa260f2a222 100644
--- a/Documentation/crypto/async-tx-api.rst
+++ b/Documentation/crypto/async-tx-api.rst
@@ -150,38 +150,38 @@ of an operation.
 Perform a xor->copy->xor operation where each operation depends on the
 result from the previous operation::
 
-    void callback(void *param)
+    static void callback(void *param)
     {
 	    struct completion *cmp = param;
 
 	    complete(cmp);
     }
 
-    void run_xor_copy_xor(struct page **xor_srcs,
-			int xor_src_cnt,
-			struct page *xor_dest,
-			size_t xor_len,
-			struct page *copy_src,
-			struct page *copy_dest,
-			size_t copy_len)
+    #define NDISKS  2
+
+    static void run_xor_copy_xor(struct page **xor_srcs,
+				 struct page *xor_dest,
+				 size_t xor_len,
+				 struct page *copy_src,
+				 struct page *copy_dest,
+				 size_t copy_len)
     {
 	    struct dma_async_tx_descriptor *tx;
-	    addr_conv_t addr_conv[xor_src_cnt];
 	    struct async_submit_ctl submit;
 	    addr_conv_t addr_conv[NDISKS];
 	    struct completion cmp;
 
 	    init_async_submit(&submit, ASYNC_TX_XOR_DROP_DST, NULL, NULL, NULL,
 			    addr_conv);
-	    tx = async_xor(xor_dest, xor_srcs, 0, xor_src_cnt, xor_len, &submit)
+	    tx = async_xor(xor_dest, xor_srcs, 0, NDISKS, xor_len, &submit);
 
-	    submit->depend_tx = tx;
+	    submit.depend_tx = tx;
 	    tx = async_memcpy(copy_dest, copy_src, 0, 0, copy_len, &submit);
 
 	    init_completion(&cmp);
 	    init_async_submit(&submit, ASYNC_TX_XOR_DROP_DST | ASYNC_TX_ACK, tx,
 			    callback, &cmp, addr_conv);
-	    tx = async_xor(xor_dest, xor_srcs, 0, xor_src_cnt, xor_len, &submit);
+	    tx = async_xor(xor_dest, xor_srcs, 0, NDISKS, xor_len, &submit);
 
 	    async_tx_issue_pending_all();
 

---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240523-async-dma-docs-00eb18a4e01c

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


