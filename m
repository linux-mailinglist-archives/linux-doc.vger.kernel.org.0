Return-Path: <linux-doc+bounces-75614-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPcCMcG3h2k6cQQAu9opvQ
	(envelope-from <linux-doc+bounces-75614-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 07 Feb 2026 23:08:01 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE6A1074B3
	for <lists+linux-doc@lfdr.de>; Sat, 07 Feb 2026 23:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87E843013686
	for <lists+linux-doc@lfdr.de>; Sat,  7 Feb 2026 22:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BBF34EF17;
	Sat,  7 Feb 2026 22:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=berkeantar.com header.i=@berkeantar.com header.b="tGBVcmu2"
X-Original-To: linux-doc@vger.kernel.org
Received: from gy.d.sender-sib.com (gy.d.sender-sib.com [77.32.148.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38232C178D
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 22:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770502077; cv=none; b=cSPrWFrTxSpBjq/jgpsvUvZT1xn2gkO+XlLQ3ReZO/usxsMvLZa4vFsrK5WRgi02WHGJIMbWU/RMbRgQIUT8lkY0v+hTGLimSGe/K2VGHLHIKYLwN2wq7+Bex+VoEQIZauNVqAZYf15GxxPkzUEpp8j0jrWdjEKXMvKYJ5Folrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770502077; c=relaxed/simple;
	bh=5gjNn7cEe5+5rQxcTsQTYKSN1WhdO0gM082RGDs6e1s=;
	h=Message-Id:From:To:Date:Subject:Cc:Mime-Version; b=GslF8yArYAC5hd/kZzWWpODU5ESAuMyhoAzGwlYH1zOi3vmS0UAyLsNja/vjhNIYMFE0y19aPme4d1kan1Lp4d7QBC2IHbgjZEtiBhnP411ORikWw4F8vrh5t024kz48VF/0+ZEW345u5Wc8ZW7eNWE+ggS+6y4XFbLkbWBzdbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=berkeantar.com; spf=pass smtp.mailfrom=gy.d.sender-sib.com; dkim=pass (2048-bit key) header.d=berkeantar.com header.i=@berkeantar.com header.b=tGBVcmu2; arc=none smtp.client-ip=77.32.148.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=berkeantar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gy.d.sender-sib.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berkeantar.com;
 q=dns/txt; s=brevo1; bh=HGH+S3CWnVi76bJDgHDhYJNR01YRs+jsuk901jQ6U0I=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=tGBVcmu2jHdmw9hOa4AbO245ns8Rnp5AYd/iX2r7S4WF1sRmg6x3sInbaXbS8TxG9RI0ovkSCb8k
        ehD33Ih2Q7+gz7K9EFfN49RNc86e0590pGFoIXYZOvLlGf0gWlWHM17ByqF+0AN6FPP4XjAjYH85
        YBlTFEywpA92g4r4i2BAlS2GbZc/IJvWPfLtsyMCBQGsh8NA11LXMnYeYsw0qXEYQ+5gOdzUZMqA
        17M6vWEv6Xll2tiFZgUR/3GC1OQUKL05RL4aEfnVgleqV5X3mqL1i7XiWL0V5+xNEBghgzXoArP/
        HpgCp7Zdocdk3sfFXqHwRtGb4FPR+piPvn8Hfg==
X-sib-id: N6lVVHtIG7fchy-W2KuqEvaJTRdi5358C77OoNlwYWc3wjy0oF_iyESjuyoaMcMtZYEzWFEYI3CUbIW0rW2hGp2NqYKFxXbA3Y7F1evGCuJQNUpcALUAKS77uiW9Hw2-sXsdP4COOPu2TGRSFnJgNRDtr8465-Zrl1Oubdp8apqJXm7fq4SXyQ
Message-Id: <31757a23-dd41-4133-9068-77f9279a845e@smtp-relay.sendinblue.com>
Feedback-ID: 77.32.148.25:10478588_-1:10478588:Sendinblue
Origin-messageId: <20260207220643.67535-1-b@berkeantar.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: <b@berkeantar.com>
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDQzODQzMjQyfmxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmd%2BPDIwMjYwMjA3MjIwNjQzLjY3NTM1LTEtYkBiZXJrZWFudGFyLmNvbT5%2BZ3kuZC5zZW5kZXItc2liLmNvbQ%3D%3D
To: <corbet@lwn.net>
Date: Sat,  7 Feb 2026 23:06:43 +0100
Subject: [PATCH] docs: toshiba_haps: fix grammar error in SSD warning
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Berke Antar" <b@berkeantar.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[berkeantar.com:s=brevo1];
	MV_CASE(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[berkeantar.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75614-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[berkeantar.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b@berkeantar.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,berkeantar.com:email,smtp-relay.sendinblue.com:mid]
X-Rspamd-Queue-Id: 1FE6A1074B3
X-Rspamd-Action: no action


From: Berke Antar <b@berkeantar.com>

Replace "make this driver to fail" with "cause this driver to fail"
to correct the grammar.

Signed-off-by: Berke Antar <b@berkeantar.com>
---
 Documentation/admin-guide/laptops/toshiba_haps.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/laptops/toshiba_haps.rst b/Documenta=
tion/admin-guide/laptops/toshiba_haps.rst
index d28b6c3f2849..0226225b82e1 100644
--- a/Documentation/admin-guide/laptops/toshiba_haps.rst
+++ b/Documentation/admin-guide/laptops/toshiba_haps.rst
@@ -43,7 +43,7 @@ RSSS    Shuts down the HDD protection interface for a few=
 seconds,
 =3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Note:
-  The presence of Solid State Drives (SSD) can make this driver to fail lo=
ading,
+  The presence of Solid State Drives (SSD) can cause this driver to fail l=
oading,
   given the fact that such drives have no movable parts, and thus, not req=
uiring
   any "protection" as well as failing during the evaluation of the _STA me=
thod
   found under this device.
--=20
2.52.0




