Return-Path: <linux-doc+bounces-83378-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLAyBYZP3mndqAkAu9opvQ
	(envelope-from <linux-doc+bounces-83378-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 16:30:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1296F3FB3EB
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 16:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5B603023472
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 14:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E573E9281;
	Tue, 14 Apr 2026 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUKTBJHK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA7F3E8C69;
	Tue, 14 Apr 2026 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176960; cv=none; b=c/A03rU+dZ315l2cbnGJdoManBv2ELm1yXUzVysE4o4yWGze2Gv7Ft6oCPp6QLbnWeoCM/uCgbOi7pKqE1rW7qY48c4GPtRDxBZq4hlucgrra/rAiUCFdUMVcGq9s6+9Y9GdPikQhoKX49Bgn4wxU5qnSfj8MPfOi+fjKEJVitU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176960; c=relaxed/simple;
	bh=Z8dBubfNQTKwauxpT0B6VmQJ1X/r3l3qLS1pZ26urKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D68PJjAUypekoVt7y1Th5S3SaN7dD1iYFQssP7WhvaAQ6hTjX16rKwjuOVOWrj6vbEp6oFkR0cPXhdGAFPgrZ5u/Lbg0UIj7CHJiw0YcpO22NvNfp4DtkldsppL9wxjdCiH3GhchrGUQxOldhjBusa3K3g0xIwHPilheDbh/y0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUKTBJHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4F5C2BCF6;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176959;
	bh=Z8dBubfNQTKwauxpT0B6VmQJ1X/r3l3qLS1pZ26urKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KUKTBJHKkWW28+VWVgifj6x2B5B6vGxTjXLsTW/Kj56TWARFKsThWcBxF77C8KC1M
	 KyawJvB3faPLRYXbeaZC1747CBRk59rhhw2qsrHLD4rks028s89k2AYBUkCTZ3gjzN
	 hxudgGXsgjVLtmboXSHY8e4kn27bW5RKvUK2nO4QsZPP3swfV1fxcdHAceKrsgrvl9
	 NdjCM1A0eNiq6hVGsGjsoAadnSuGFAgBnJO8HTwlteMm/krqtScHgj+XrlY66nw9ip
	 GhIG5a5mXOaNY4Jowa1ss3YHJwogrB4UTYsJMdb3GFUimRD6B0Tzesfisdu7We7TEj
	 FSZeHjqINHZtg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCelS-00000007oQG-0mGQ;
	Tue, 14 Apr 2026 16:29:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Dan Williams <djbw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH RFC 4/4] docs: auto-generate maintainer entry profile links
Date: Tue, 14 Apr 2026 16:29:07 +0200
Message-ID: <9228f77b0339b8e5dea4a201ab6d4feb30cef5c2.1776176108.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83378-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1296F3FB3EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of manually creating a TOC tree for them, use the new
tag to auto-generate its TOC.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../maintainer/maintainer-entry-profile.rst     | 17 ++---------------
 Documentation/process/maintainer-handbooks.rst  | 10 +---------
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index 6020d188e13d..48ecabd4ce13 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -98,18 +98,5 @@ Existing profiles
 For now, existing maintainer profiles are listed here; we will likely want
 to do something different in the near future.
 
-.. toctree::
-   :maxdepth: 1
-
-   ../doc-guide/maintainer-profile
-   ../nvdimm/maintainer-entry-profile
-   ../arch/riscv/patch-acceptance
-   ../process/maintainer-soc
-   ../process/maintainer-soc-clean-dts
-   ../driver-api/media/maintainer-entry-profile
-   ../process/maintainer-netdev
-   ../driver-api/vfio-pci-device-specific-driver-acceptance
-   ../nvme/feature-and-quirk-policy
-   ../filesystems/nfs/nfsd-maintainer-entry-profile
-   ../filesystems/xfs/xfs-maintainer-entry-profile
-   ../mm/damon/maintainer-profile
+See Documentation/process/maintainer-handbooks.rst for subsystem-specific
+profiles.
diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 3d72ad25fc6a..d3d74c719018 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -9,12 +9,4 @@ which is supplementary to the general development process handbook
 
 Contents:
 
-.. toctree::
-   :numbered:
-   :maxdepth: 2
-
-   maintainer-netdev
-   maintainer-soc
-   maintainer-soc-clean-dts
-   maintainer-tip
-   maintainer-kvm-x86
+.. maintainers-profile-toc::
-- 
2.52.0


