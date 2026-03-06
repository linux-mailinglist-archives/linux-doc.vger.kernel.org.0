Return-Path: <linux-doc+bounces-78200-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNkJB8H2qmlxZAEAu9opvQ
	(envelope-from <linux-doc+bounces-78200-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 16:46:09 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6118B224210
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 16:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF3A430142BE
	for <lists+linux-doc@lfdr.de>; Fri,  6 Mar 2026 15:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665823EBF1E;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="thgle8ID"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D022436C9CF;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811958; cv=none; b=sPBIdRx0FD6j1k+wTLvx2AiA/bNHRdJm0BKwXs0aPk8o3cVwfPdYznoDglmEOxPLw9Kp0Iu3gmpxLRjMwwn30UQHTVJtN1tqGBjDN0bXJI08/r/IZSIh2osllfgESJ41SmloWuU6OBcHUrUMmUBdISmUkB9+auQpy7ODyplQ19s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811958; c=relaxed/simple;
	bh=GGvISdxmwoIbUjL//ZMtEtb0uZ7eg3KSR627MLJtNjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pb6SG9jVnz6lPjaP9yL0Du4+1Di3xRi2jLm9g2mE0QCzS8pJ21Ev+EsZul3ohP2nsHP59GPSotNU8J3UxoG3hb/dgMe+uHS1WsGwS8lPlX1hJHSAEk6uxWhB046z5XIz7U+Xh5AQNwkkm3pXp/tnGzalgrr6VNj70yBzxBzn8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=thgle8ID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884B3C2BC9E;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811958;
	bh=GGvISdxmwoIbUjL//ZMtEtb0uZ7eg3KSR627MLJtNjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=thgle8IDs8eLTweVjd/CHfBo48sdr0+OVMkeAf3oejNXr1Nlj0EXvJPdDOXKvGjUZ
	 /tpcuFQrE+YVIDnfDdvC2FgiAK6QLxnb71w11gkXZCF4+SayDTFHT5IucgYvq4OlHe
	 6Jh2N2Po5d1YgV/LI85O5kjyjzoRtGmfrZMBMUi1mXKA68m0c2ez1hCqWKDsUuuTul
	 qHGoGcbX0l1px04MfsjtI16tEf0r8fnE4d+CoPSy83js/tX2je7oGlNEnGwONt7ALu
	 npERXFSQCc4M6q9Apo4Xhca9l7ON9xmLuuLNPOXwDSsvCjWAww104rjVdaTI69BVPq
	 cXOO67POWS03Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNE-00000007Ea6-3C5Y;
	Fri, 06 Mar 2026 16:45:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] docs: kdoc_output: remove extra attribute on man .TH headers
Date: Fri,  6 Mar 2026 16:45:42 +0100
Message-ID: <f5e480af877903b0596b6a56ef7a152eb8a10dbf.1772810752.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810752.git.mchehab+huawei@kernel.org>
References: <cover.1772810752.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 6118B224210
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78200-lists,linux-doc=lfdr.de,huawei];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.956];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

According with modern documents, groff .TH supports up to 5
arguments, but the logic passes 6. Drop the lastest one
("LINUX").

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index fb6b90c54c8a..d0b237c09391 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -618,7 +618,7 @@ class ManFormat(OutputFormat):
             modulename = self.modulename
 
         self.data += f'.TH "{modulename}" {self.section} "{name}" '
-        self.data += f'"{self.date}" "{manual}" LINUX\n'
+        self.data += f'"{self.date}" "{manual}"\n'
 
     def __init__(self, modulename, section="9", manual="API Manual"):
         """
-- 
2.52.0


