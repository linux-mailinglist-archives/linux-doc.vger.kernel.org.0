Return-Path: <linux-doc+bounces-87879-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGHSDHuqCGrP0AMAu9opvQ
	(envelope-from <linux-doc+bounces-87879-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 19:33:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E955CF1D
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 19:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B01193011F26
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 17:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C1E3ED126;
	Sat, 16 May 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QasRDeMe"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DFA3ED5C8;
	Sat, 16 May 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778952821; cv=none; b=WI/iHpU9UK1x1LDzC1ZSh8Q/PHnxoVD8odRTp2y5tDc8MfhiNdclCgzE72C0y/XRTCFwATqpiLrKlpIyJaL91efKgwpG4DqA4+nmCrAQy6LAtrDFu1ydE6cqyCq4ZWL1XzyLeQwbEyXk+HI6NLwdnhauGTzwVgot2TzIOpM+rc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778952821; c=relaxed/simple;
	bh=d130QB3UbRe/cU1WrBmF5Tfx5XZci02lTg7wSY1rRPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jC5eDOKLRRmWOL2b07PjSL3B6TS92K/bvywPihqEygZIqmQQqyBsWcfSv/K6SGZFrPGkL7qutSAeh84HlFMqMiTt1FxqACDk4ne4zfL1oBMFHdK0sCpaEOL8sp7Dan6uC/8VsXpkXNAjcxO4mnU9gh35P2oFnAfsIQ6Fgvb+2Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QasRDeMe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913EAC4AF09;
	Sat, 16 May 2026 17:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778952820;
	bh=d130QB3UbRe/cU1WrBmF5Tfx5XZci02lTg7wSY1rRPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QasRDeMeno73j3iE3QWXhQx+F1xsiNhGqAduxQcQBVMuuUzuql6tuPFlus8EV920l
	 LIo3Ws2eArUwTa7rzNejVsUQoaZehDF5e4xJbGfkYj/u/ZiPjCKlFmZDCRkP5oac9y
	 ru6pqbEvWG9HnRbibQJPV70pNZtO9bAYTP+V9wSSy4OnEdSzL+2SaGhhyjp0sRNVs/
	 i/J2t4ulY7DigK1T0mEYhCztizWYQvzj0b6QQui1jckHIzFeIQtUMedChAsJzAIQXo
	 0if6shu5hfjo0wL1/8JEHT9qZ92Y337EzwPnyp8GKsHYAl4fgz/9aie+gtCUBzeGAA
	 0uwrH40X2ZPsA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wOItO-00000003IgD-2BEK;
	Sat, 16 May 2026 19:33:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 1/2] docs: maintainers_include: restore compatibility with Python 3.6
Date: Sat, 16 May 2026 19:33:33 +0200
Message-ID: <930036c189414f3f7096c22269687489f8566dd9.1778952682.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778952682.git.mchehab+huawei@kernel.org>
References: <cover.1778952682.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: CB6E955CF1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87879-lists,linux-doc=lfdr.de,huawei];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

glob root_dir parameter requires Python 3.10, which is more than
our current Python minimal requirement.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index be8e566e0363..b8b7282ebe38 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -143,7 +143,7 @@ class MaintainersParser:
             if not m:
                 return None
 
-            doc_list = glob(m.group(1), root_dir=self.base_dir)
+            doc_list = glob(os.path.join(self.base_dir, m.group(1)))
         else:
             doc_list = [text]
 
-- 
2.54.0


