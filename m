Return-Path: <linux-doc+bounces-78866-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APz/Db6IsWnkDAAAu9opvQ
	(envelope-from <linux-doc+bounces-78866-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 16:22:38 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43726661E
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 16:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1998E3120C4D
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 15:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4A13DF01E;
	Wed, 11 Mar 2026 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMs8WdrF"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90453E022C;
	Wed, 11 Mar 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242444; cv=none; b=ob1XNyq2zhQoFMnDSeDp2mlmS8VlmdLEyNBYHN9pmzMrI++/xXVfsba5OygPcybCm/FwB7LTNx1xMGXEb0n3ji6d90RwZ9HAjgGcCxtQsAyXM+DNIbpuBqmxqo66+I4xWqCXr2vSfLUS3S75AIp7TI9jQumk7A5Y2PQvYtAGMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242444; c=relaxed/simple;
	bh=FnYIJorzH/gwO4Kzae+KJBouHZLAYJSRiiIs50hB7z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJUfWKzWUqQAqX1unpEmRIuwBybU0qRrDTyTmCi8bJwerm2esgo4FaXazujUkzVaUiU4EJ4oMc/S8NYpasuj2ltM7VnvC4WdypD3HEhrV6kZla2mO/uACf00Xi89S817azP4W6uyvy9mUviPrVfbTB/FhPL0x2CCYkTwvn+0cCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMs8WdrF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B8AC19421;
	Wed, 11 Mar 2026 15:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773242442;
	bh=FnYIJorzH/gwO4Kzae+KJBouHZLAYJSRiiIs50hB7z0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YMs8WdrF+A/7MdZqNdWgDa3oz/dIhTzKq0zJsd1zdy22KzCFd7jKHplaAXPMux1FA
	 h0et+gKLE8I/agwNAP1z+81/pPx2AVOdBRa+/nbbCCAY6/bm4vgISsUsfRlJFsSBOy
	 5XtsgiTiKYWUboUsl3p04kiOLOxI913zhI8TbeaRcbZ8tMUKuQSiT4wF6QTqIRnrKW
	 T2FNgUfibXOevyMyeS5ONYTE+SYr26HA7HeminRVLty/lChaE/rRoqXqPgndoxwT6Z
	 2hwwgQpwXsiRNLvbVLT4kQdeIrruNOySrgLlAe42LDW8Gh5Kpsoelf4w+chQcR04sc
	 eg26MJm+GzKCw==
From: Sasha Levin <sashal@kernel.org>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] checkpatch: add support for Assisted-by tag
Date: Wed, 11 Mar 2026 11:20:39 -0400
Message-ID: <20260311152039.254244-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2c7e0149-c178-41b8-ac5e-270bfea8b1f8@acm.org>
References: <2c7e0149-c178-41b8-ac5e-270bfea8b1f8@acm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,acm.org,lwn.net,vger.kernel.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78866-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url,acm.org:email]
X-Rspamd-Queue-Id: 8E43726661E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Assisted-by tag was introduced in Documentation/process/coding-assistants.rst
for attributing AI tool contributions to kernel patches. However, checkpatch.pl
did not recognize this tag, causing two issues:

  WARNING: Non-standard signature: Assisted-by:
  ERROR: Unrecognized email address: 'AGENT_NAME:MODEL_VERSION'

Fix this by:
1. Adding Assisted-by to the recognized $signature_tags list
2. Skipping email validation for Assisted-by lines since they use the
   AGENT_NAME:MODEL_VERSION format instead of an email address
3. Warning when the Assisted-by value doesn't match the expected format

Reported-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/checkpatch.pl | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e56374662ff79..70ea466390771 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -641,6 +641,7 @@ our $signature_tags = qr{(?xi:
 	Reviewed-by:|
 	Reported-by:|
 	Suggested-by:|
+	Assisted-by:|
 	To:|
 	Cc:
 )};
@@ -3105,6 +3106,13 @@ sub process {
 				}
 			}
 
+			# Assisted-by uses AGENT_NAME:MODEL_VERSION format, not email
+			if ($sign_off =~ /^Assisted-by:/i) {
+				if ($email !~ /^\S+:\S+/) {
+					WARN("BAD_SIGN_OFF",
+					     "Assisted-by: expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format\n" . $herecurr);
+				}
+			} else {
 			my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
 			my $suggested_email = format_email(($email_name, $name_comment, $email_address, $comment));
 			if ($suggested_email eq "") {
@@ -3189,6 +3197,7 @@ sub process {
 					}
 				}
 			}
+			}
 
 # Check for duplicate signatures
 			my $sig_nospace = $line;
-- 
2.51.0


