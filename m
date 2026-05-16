Return-Path: <linux-doc+bounces-87877-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E0VDXqqCGrP0AMAu9opvQ
	(envelope-from <linux-doc+bounces-87877-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 19:33:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B9C55CF16
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 19:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55F48301326B
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 17:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7263EEAC4;
	Sat, 16 May 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdMTCKet"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611E3EE1F6;
	Sat, 16 May 2026 17:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778952821; cv=none; b=OvhUmp05xI28AJ0u5z4a4FTO4eRyEosr5EeG6Kgy9oE8D8OjpmOO+mQ2/JpLR8e74O+8geXRC9ragxaSKlS505YJV55rfNSIJ3uGQg3FPQVtzxVBKomaYNpH2RY6OFPaZIPmEKP2XFHAlvSKbJ5urYRcJd/Y+ewunqbioAjYTNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778952821; c=relaxed/simple;
	bh=RqF8lXLW3qIqOOwQ5mhjlAJCyWcGCos7S1rvuZE5Qx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q3UnFb8KbO8pya/OFfENxF8y+t4Pz49Vo1NRaCotpHv92ay7kUFGuw3+l4w8Uqr22ZatBOZG4+ZDNqUgEYdKJnGe+wI4uVt2OV5B+0a7kLZOgCY/UCOnjZdSyV1EUt4xYD2U3VRYO9Rsv8i11NMNtNsM4eJu3rSwLzdZxHnDHLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdMTCKet; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F31CC2BCB8;
	Sat, 16 May 2026 17:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778952820;
	bh=RqF8lXLW3qIqOOwQ5mhjlAJCyWcGCos7S1rvuZE5Qx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OdMTCKetUoYGWESw99fXwdwKCnMNWahUvP2rkL4mMXBU7CrC0VvMOnO/4vuaSUVV6
	 RwH5gzlh8cCg2Qsh9gkA6gOY4UyqdUNH3kNfL1nM79UoMPm6kRSkUDzcClrv3tcgR3
	 oxskviFPI5MYdrTsDScOWf/gzLtZnMxH+CbymUDzaOBRF0oD/QN1xYcBjJP7Nw3Quk
	 d0X8nNL//m/G0psBva1/MsqI9qUtx1TKsGnU/D7Gm8WWDQVlWfF29ztus5Xa3sPK4D
	 thVIpAEg4V565LOCqYBO/KYAvFvC3dumU7xDFTTmTjWoZYk3q8FMKsSJZ6/GV8fGxH
	 kmghfGZrWBfhw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wOItO-00000003IgH-2IBJ;
	Sat, 16 May 2026 19:33:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 2/2] docs: maintainers_include: keep the last entry at the end
Date: Sat, 16 May 2026 19:33:34 +0200
Message-ID: <b4f45565eff4ba6f01e84a6877813038a23ba83b.1778952682.git.mchehab+huawei@kernel.org>
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
X-Rspamd-Queue-Id: C9B9C55CF16
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
	TAGGED_FROM(0.00)[bounces-87877-lists,linux-doc=lfdr.de,huawei];
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

The last maintainer's entry ("THE REST") is meant to be at the
end. Ensure that.

While here, use a case-insensitive sort to avoid placing "iSCSI"
near the end.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index b8b7282ebe38..dc9f9e188ffa 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -284,7 +284,12 @@ class MaintainersInclude(Include):
 
         self.state.document['maintainers_included'] = True
 
-        for name, fields in sorted(maint_parser.maint_entries.items()):
+        # Keep the last entry ("THE REST") in the end
+        entries = list(maint_parser.maint_entries.keys())
+        entries = sorted(entries[:-1], key=str.casefold) + [entries[-1]]
+
+        for name in entries:
+            fields = maint_parser.maint_entries[name]
             output += f"  * - {name}\n"
             tag = "-"
             for field, lines in fields.items():
-- 
2.54.0


