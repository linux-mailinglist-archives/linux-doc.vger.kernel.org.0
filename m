Return-Path: <linux-doc+bounces-94689-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sEB8MM+5RmpLcQsAu9opvQ
	(envelope-from <linux-doc+bounces-94689-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 21:19:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2263E6FC7D6
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 21:19:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jmaMtqSf;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94689-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94689-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4D1F30A69FC
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 19:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE2A3803F1;
	Thu,  2 Jul 2026 19:11:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E664358369;
	Thu,  2 Jul 2026 19:11:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019509; cv=none; b=T6EjDTtgsD5rL2XPby6J5LBkRKHzhybPFUjBImKpOteo+BeF+6Hclpdr+7eLCA5J+fFP8cHEbNPaJvqetb0bz96rEoPlAwReIjN5HzYU97IBQlKV09y+1mgRansQgzoz6Z66/L1aNY+wPtxUXU7XjE95AQtA4DkOfw11lMfQf3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019509; c=relaxed/simple;
	bh=lF6hsHsdZLJFUh4gzWm0UDUwtgEvWvTUL8mdZqxtKqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H9NDOlcYpytkwJgqkC4K8741sAwU43vQFMEaU9BnFPCyvkHC1Z7dkK15wVQSVLLz9PQHW/77rhhxf+PIbddrYV+sFm/CCxJPEug8QsWOEQVdkStdYtfuv6ulxDUMemUo6g4c7Av3cswOkKn3VWLjlWoM5tOZAagykOzWVSzCDxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmaMtqSf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5071F000E9;
	Thu,  2 Jul 2026 19:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783019508;
	bh=SsY32QyOGbTjFQiZF5JH17S7U0TTGSYArv0aeQ4n90M=;
	h=From:Subject:Date:To:Cc;
	b=jmaMtqSfcdAzXZrAq5JOAVkhfRSDbQfdLC9EhS8LUHTO3TQt348e/VPcDCoBGoHdF
	 4OVWYf2XOO2MdjQ04qtkCOIMHZMvR9jzRybZYoAJLnOP5bq1WwB/pI3Z7icfV1YGK4
	 DzpiFPBX60tW6AfcbePrhuu5G/AVPDUYrOgCieIgAAFon3YS5IGEzCy+1fEM8NfSF+
	 31v+5KdGO4CdJorJZoSsW7G8ESBEQh1SIT0lIld+6sIhNxEXP2jd/5b5Pv0miB3veX
	 vo1xD+JNZ1z7qz4MQ34ZPOL7huwohlW4rLjraP79e6yp1/6cQ0mus73IZpch6AR6YD
	 eHgOg8zeBxhfA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/4] arm64: Fixes and cleanups for
 cpu-feature-registers.rst
Date: Thu, 02 Jul 2026 20:11:15 +0100
Message-Id: <20260702-arm64-cpu-ftr-regs-v2-0-fe0b78f1bd93@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANO3RmoC/22Nyw6CMBBFf4XM2jFtKRBd+R+GBS1TqA8gU2g0h
 H8XMO5cnuTec2YIxJ4CnJMZmKIPvu9WUIcEbFt1DaGvVwYlVC4yJbHiZ67RDhO6kZGpCWgsGVW
 nOi1yB+txYHL+tUuv5ZfDZG5kx820LVofxp7fezXKbfcLqH+BKFGgPBVFZrRwlROXO3FHj2PPD
 ZTLsnwAddhhhccAAAA=
X-Change-ID: 20260521-arm64-cpu-ftr-regs-bceb2d34376f
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lF6hsHsdZLJFUh4gzWm0UDUwtgEvWvTUL8mdZqxtKqs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqRrftUY3Hzfq43AU3DHhX+bnsN1Dw8Xi96Cxa8
 7CNJ6bIDY2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaka37QAKCRAk1otyXVSH
 0D9AB/424BJSo6GXj6RfyUt2owJmusYLvYu7S7tjMHtzR5/cwVYQEJcBSyHBAVNDzyPec1wZaZ5
 BKoFavROtFoQc8JQzf0SSPdQDE+sL+iH5UlW5OtJc28dMgu9hKE+MpnskQ+CcY6hONxSSandrCl
 qqZGvHniGelt3+e0/JWjOrMDt58flB7oQYtTNngntSCP3R0PMpoUnfmXFtnxG08u2DyC3MJdh2D
 XahdUCSdiOqwl0m17bHXX3wBeWLrbF2m7W0z/WpGadVto4jJW5Xz0avY1sgACkBBjkz9FnOkeKM
 z+wuUM5Pr9/yCTz0Jmsld/qk+mScNZ/0mE350B/fw9Rzf8Lq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94689-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peter.maydell@linaro.org,m:joey.gouly@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:broonie@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2263E6FC7D6

Peter Maydell noticed some missing updates to cpu-feature-registers.rst,
while looking at these a number of other other omissions and some
maintainability problems were observed.  Several registers and many
bitfields have not been added.  

Following discussion with Catalin we remove the numbering of the
registers in the first patch so that when we add the registers we can
add them in a roughly sorted order, then fix up the missing
documentation before sorting the existing entries in the file.

This whole area should have much better tooling, rather than having to
update multiple places and manually cross check several different places
including rarely used documentation we should be marking up the sysreg
descriptions and then either generating the data or validating against
manually updated copies.  Manually updated copies seem like a good idea
for the ABI documentation since while it's more work that would force
review.  I did start on some sketches, it seemed like it might make
sense to tackle along with using the MRS but the libraries for that
seem not to be progressing at any great rate, I'll dig the sketches out.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Remove documentation for hidden registers.
- Fix typos.
- Link to v1: https://patch.msgid.link/20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org

---
Mark Brown (4):
      arm64: Don't number registers in cpu-feature-registers.rst
      arm64: Document missing bitfields in cpu-feature-registers.rst
      arm64: Sort registers in cpu-feature-registers.rst
      arm64: Remove hidden bitfields from cpu-feature-registers.rst

 Documentation/arch/arm64/cpu-feature-registers.rst | 593 +++++++++++++--------
 1 file changed, 364 insertions(+), 229 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260521-arm64-cpu-ftr-regs-bceb2d34376f

Best regards,
--  
Mark Brown <broonie@kernel.org>


