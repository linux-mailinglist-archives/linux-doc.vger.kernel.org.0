Return-Path: <linux-doc+bounces-79961-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLpGH0q2umlWawIAu9opvQ
	(envelope-from <linux-doc+bounces-79961-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 15:27:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CC22BD19A
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 15:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B8AB3012BCF
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 14:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CAC3D9DBE;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kv6riwQS"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851363CF697;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843979; cv=none; b=UqgYwe4tQ1HfTZBd7PZyKwwNETkgGRASADAAokveyEpbG1KFiedfqwb/2FZqNWvWGKpFTAkKThBdoslOpd0wjllqcYTsjgDWmQIZ4dnGd7bc856A0HpeR7IiZFNn44lMg8kYW457jGmzUSUF32w1fhimUnpZZgHANNbApBQ+b3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843979; c=relaxed/simple;
	bh=J9mk5CgIixf/IVw/YsnhxrUuwYrtPC7QGEk3ABcDVNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a4q16dyEFSKvNceWS81uT10f5V1i/MkwpIyBTBUjN+OT4Cslu34ilQIqgJ9IcgfOHAgRthcD1EiYmbaZsKO5ginaQMHI9bd6JCbhOnWvW5by58TymA/FwcF2PuujHo8GaMNZ/pYBqY7ZCkDwyqiMcWWK+P/URqdqLYJV+goSk2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kv6riwQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A49C2BC87;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843979;
	bh=J9mk5CgIixf/IVw/YsnhxrUuwYrtPC7QGEk3ABcDVNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kv6riwQSEHWeHT8qvWQoAsAJThiVQKHjCxl/FQ6fVi2S70trKWdv74fMz4pNxc8f2
	 1EvHEAtopY9YZckEB0gwi7VzvwUEZosRWNPSrnmjqPea/N4Y3Nr1gcUUAMoL/sdkMD
	 tCvZfjHeeMCAdLDTPDyEVe/xdTgB2UGuef4kBfWqa1khK9U+utG2UZ6kdFlsLbDPA0
	 s1Yynlkz7w3GhsQi95r9IPvsB37PJMByP/8rXsthaoRZyiE3RhvE+RkUZRn1ICOT7D
	 gv28mEVQTWgGO8YoLyDkhnRTXFoeZ9zISfm0/pxo1fV35sh6tYNjfKpmc5EERfCh3X
	 +6L0/LV44oy0A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2rqj-00000004HZh-2lbS;
	Wed, 18 Mar 2026 15:26:17 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] MAINTAINERS: update documentation scripts to add unittests
Date: Wed, 18 Mar 2026 15:26:07 +0100
Message-ID: <34ebaf62cf147034064fb55e5869d4d2661284d1.1773841456.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773841456.git.mchehab+huawei@kernel.org>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79961-lists,linux-doc=lfdr.de,huawei];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vaga.pv.it:email]
X-Rspamd-Queue-Id: 25CC22BD19A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure that we'll receive e-mails for attempts to touch
tools/unittests.

While here, place entries alphabetically sorted.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c05a72245049..f0b106a4dd96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7679,8 +7679,9 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
 F:	Documentation/sphinx/
-F:	tools/lib/python/*
 F:	tools/docs/
+F:	tools/lib/python/*
+F:	tools/unittests/*
 
 DOCUMENTATION/ITALIAN
 M:	Federico Vaga <federico.vaga@vaga.pv.it>
-- 
2.52.0


