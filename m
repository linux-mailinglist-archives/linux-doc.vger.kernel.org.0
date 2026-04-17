Return-Path: <linux-doc+bounces-83689-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH8TDxzP4WnQyQAAu9opvQ
	(envelope-from <linux-doc+bounces-83689-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 08:11:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7673D41744D
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 08:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EA6B302BAF2
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 06:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B248372EFF;
	Fri, 17 Apr 2026 06:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fo6k3TJb"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB287370D47;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406287; cv=none; b=uY1JLGfKJmfbRMgcnHtB6e4Dtg1JQyZ2EVCek+Y13srNryM5GMPn7cOtfo4uTmFtBDx9QiI+S/F1Y+1C+8TkGLYk5fSL+EBaGCqmvzQBETYOVwabclPoEyyLSUyQsaFQjP0ZlUQSIhz/C/4tLdqP3KvoBmvQUWWQOUto2YWwDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406287; c=relaxed/simple;
	bh=4mjLTBn9APgLWMeXtSLp7kqR2oEmNfSkkkBNyyYhQPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJOrHrLpl3AhyT9RCLFrJb+U4uS/MG8czFhrOJ2pXr41MTZOpiDzgpA4Bl8aDhWvAkohy2dBadTmkrh0T8HvkBEnCkGQ59ANr0lK96bOg8ziUWBIZAR9WRc5fU1H6a6vu4emga3qbEhISkJUR7US+3soDWYsoJVX8Q+8MyzRAMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fo6k3TJb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6128BC2BCB8;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=4mjLTBn9APgLWMeXtSLp7kqR2oEmNfSkkkBNyyYhQPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fo6k3TJbUU+5mNCcxKlNYgAHgiU53txsGHEls1RF4Ecq9Ggl02mX+u76jwxWPhLpn
	 4xhDDBtNpgJghT4dXCt51ukY0y2Fv3J4KBJY5oNHOV5TD3DvQoHDAYWgcMCy2USHLv
	 1ck6+caGOf6UwYhXfbz2MwDz/T56woPJycUJast7tC2Ulegt5E8UFaL2kolwC4FHnc
	 4pachmzViHivji0z/wwFeIBPCzA5fd7D3aJdBB7NTegPLTgAKEh5soo8FrpQm6CeDF
	 GKlDxVEnqmiI1wnUG75GrSC518TQxKu0soMJjoTAxNfVlcrD7f9RHdErGeFklTjC4E
	 dlbiNTF9nX4Xw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8sp-2bSc;
	Fri, 17 Apr 2026 08:11:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 07/11] docs: maintainers_include: preserve names for files under process/
Date: Fri, 17 Apr 2026 08:11:17 +0200
Message-ID: <b697b4c57cdb0263cee2ae1b5868a52925e457f0.1776405189.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83689-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7673D41744D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a maintainer's profile is stored outside process, they're
already included on some other book and the name of the filesystem
may not be there. That's why the logic picks the name from the
subsystem's name.

However, files directly placed together with maintainers-handbooks.rst
(e.g. under Documentation/process/) is a different history: those
aren't placed anywhere, so we can keep using their own names,
letting Sphinx do his thing.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index f1b8d4b00c2a..948746b998a3 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -76,11 +76,13 @@ class MaintainersParser:
             match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
             if match:
                 fname = os.path.relpath(match.group(1), base_path)
-                if fname not in self.profiles:
+                if fname.startswith("../"):
                     if self.profiles.get(fname) is None:
                         self.profiles[fname] = subsystem_name
                     else:
                         self.profiles[fname] += f", {subsystem_name}"
+                else:
+                    self.profiles[fname] = None
 
             match = re.match(r"P:\s*(https?://.*)", line)
             if match:
-- 
2.53.0


