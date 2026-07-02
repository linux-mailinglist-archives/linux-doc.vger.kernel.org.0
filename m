Return-Path: <linux-doc+bounces-94668-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rxu5KImZRmr1ZgsAu9opvQ
	(envelope-from <linux-doc+bounces-94668-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 19:02:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3550F6FAE12
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 19:02:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fyt+5dP4;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94668-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94668-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CD33301CDA9
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 16:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4653939A058;
	Thu,  2 Jul 2026 16:49:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E40A39656D;
	Thu,  2 Jul 2026 16:49:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010950; cv=none; b=uquTxYFh4dzXHxNes7ORIX/3FiKxTelDzUqdPGg25FOb/BYtsNrkSQiwSPynz1Cc25V3JVpkIXhkIOfNLu/73Azp707gMvTBoUhFm3zRiydcYNuVowmx8ZYfQcRxPdQwA5HXdkAgw2ztBmY3bPmiVl/r9KatTDW7i/3R0k/+Zcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010950; c=relaxed/simple;
	bh=WsrvWMoPnHXJVwvilKdRIrku83diw1qEekYeKqp0MUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u/V1Mb7ZtVAXjgc2uButPJof6AWEncMjAARGRqN8x4G3biIwH197UPXn2smcX2N9UA2ebiX2Fu9OQx641GlsGoS9ELwF+2VAFu5Usc9Uq1NQRzT+NbRxBrdM18FUAwmZqXZjIHUiETe1dvDKLs+UapISVpCYRIfCPR7WMfQhOpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyt+5dP4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553961F00A3A;
	Thu,  2 Jul 2026 16:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783010948;
	bh=WsrvWMoPnHXJVwvilKdRIrku83diw1qEekYeKqp0MUs=;
	h=From:To:Cc:Subject:Date;
	b=fyt+5dP4wmRZ1ZJ8IO1zxfT3E68XhsuXG9CquNRXA3RiSLMatbxXj4HIVDkjh9DWb
	 4oVGdwznM5FUe3cmKPnRgHjdmJ1pUXSdOk92rqLQXwp/o8vn3J2P9MoFESDsKnTB6L
	 Derggxne6oTnY7ksYYfB6f7jEjNQD+TaKYvuP+QlboUDEdUSS+ZKTc2bYELIL9nzw5
	 2ctCoCaGtbQ3YZeXW1mV9u4Vb83JJ+5wS8wAIysXCLzi47Xqfo1jKwaXHMsT60yo8g
	 tymkzgzQNwsb4lFOdxzQmGdCFqbZOfOGQirj1n7GeEeeDhi38v4pw3sOI81/4M4E7D
	 h7C0gYcZTtjPw==
From: Lorenzo Stoakes <ljs@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Carlos Maiolino <cem@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>,
	Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] docs: link AI coding assistants and tool-generated content pages
Date: Thu,  2 Jul 2026 17:49:01 +0100
Message-ID: <20260702164901.121128-1-ljs@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94668-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:torvalds@linux-foundation.org,m:justinstitt@google.com,m:laurent.pinchart@ideasonboard.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:jlayton@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,google.com,ideasonboard.com,kernel.org,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3550F6FAE12

Both of these guidelines are complimentary to one another - one specifying
guidelines on AI coding assistants, and the other specifying those for
tool-generated content.

Since they are complimentary to one another, provide a link to each in the
other.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 Documentation/process/coding-assistants.rst | 4 ++++
 Documentation/process/generated-content.rst | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index 899f4459c52d..6125ee4914c5 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -15,6 +15,10 @@ kernel development process:
 * Documentation/process/coding-style.rst
 * Documentation/process/submitting-patches.rst

+For guidelines on content generated by AI coding assistants see:
+
+* Documentation/process/generated-content.rst
+
 Licensing and Legal Requirements
 ================================

diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
index 08621e50a462..aad2caad9f8b 100644
--- a/Documentation/process/generated-content.rst
+++ b/Documentation/process/generated-content.rst
@@ -107,3 +107,10 @@ the resulting changes.

 If you do so anyway, maintainers are entitled to reject your series
 without detailed review.
+
+References
+==========
+
+For specific guidelines on AI coding assistants, see:
+
+* Documentation/process/coding-assistants.rst
--
2.55.0

