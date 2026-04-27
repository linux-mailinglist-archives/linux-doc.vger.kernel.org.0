Return-Path: <linux-doc+bounces-84739-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFmFBOpd72k+AwEAu9opvQ
	(envelope-from <linux-doc+bounces-84739-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:00:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB5347308F
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6F773003737
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F993BF677;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSTNgTZX"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98323BED2B;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294817; cv=none; b=quGXts+lfP7qWsRdK0eOPsRygv/TjmA42yKurbHHcADx6o/7kcta0Hih8idXlw2PD6ipo2ZYa8ZQE3lwviTJYvwgTDv6VaK5PK9hXNPUK+6VJHmLKgWKg/p1q8xlpFgwsEQEoxmrCJ/nDAO/pb4CCoTkWF49fPnftZlA+1s/GbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294817; c=relaxed/simple;
	bh=k5dWurVipop77C9Fwrcn3SH5CnWId05jQgVrC5N7Hi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbV1fTbPwokRrnePZRyKJglz2J+XxdGKYRwTDtjqXxMU1/hSpm8pwkwrm+gyy21RQeu2ZAdNuG6FSRmSOMEtEIDulVibk6MMoraFf4oC2V3IU8rRVPwXI/0wegx6AvQsnxW3j25V/Za3AhhzAfWxnkT4ZjSWMuP0rFnBLLoZ4Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSTNgTZX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F244C2BCB5;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294817;
	bh=k5dWurVipop77C9Fwrcn3SH5CnWId05jQgVrC5N7Hi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iSTNgTZXGI+uUUNL91x9OsOC8O60kF6yTDlOyEuGD3GJzqmMDwxc3+URWujmAnAUo
	 dN+ZFD4HUOPEkunQpNILPwNjWa/oalHijUfxkev0LT4tZ+iH64ovHu7oSxvWCHOW92
	 srzUsly1Q+N0tziUJH2kWJmk4xsoS8wVcJITH68exfKp4w6saCov7zSOi69Bd1TVms
	 /5KwBnH4X2TkvZrioN/n6lfYlc3GaCBSQKYjKWilxsggJr1guRhpD7ucAOGK+9jQS7
	 3dkIpBtc8S/jlZFLvur4dFhiKgybTWg9Kf8X5Omgn41CgoVAVK846rHnOudnj0bIns
	 ZBe1hlcSvenvg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZP-0000000Bx2P-2ec6;
	Mon, 27 Apr 2026 15:00:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 01/12] MAINTAINERS: add an entry for media maintainers profile
Date: Mon, 27 Apr 2026 15:00:01 +0200
Message-ID: <34aaa9258c783a05528fbad2beba69e070c3caad.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: EDB5347308F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84739-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:email]

The media subsystem has a maintainers entry profile, but its entry
is missing at MAINTAINERS.

Add it.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..f52ec50f6d10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16223,6 +16223,7 @@ P:	Documentation/driver-api/media/maintainer-entry-profile.rst
 W:	https://linuxtv.org
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/media.git
+P:	Documentation/driver-api/media/maintainer-entry-profile.rst
 F:	Documentation/admin-guide/media/
 F:	Documentation/devicetree/bindings/media/
 F:	Documentation/driver-api/media/
-- 
2.53.0


