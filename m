Return-Path: <linux-doc+bounces-84247-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE2AEVg56WnFWAIAu9opvQ
	(envelope-from <linux-doc+bounces-84247-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 23:10:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E18F44ACDC
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 23:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68AC23009E09
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 21:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47824364053;
	Wed, 22 Apr 2026 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="UKmJgASW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UzyNDugL"
X-Original-To: linux-doc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644552C15A9;
	Wed, 22 Apr 2026 21:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776892243; cv=none; b=eXXUWSiO6gywqH04X5E6JJvk5/7yeVBpfGWDnjUHcGDkiXHlNbHOqdjPIIEbnCjo/92zsr0k/kQV4QHv1hvdSfFbVvs+xHAKUK3XKDTBjvseoboWLym//+eKdpUBlsc9/QHmL+BtDsJDj82YdWawsYf6PTY3XHGrwkIqsrYtHnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776892243; c=relaxed/simple;
	bh=OSqg33zu69B18EgZ4Qom6kiYvb5WvGdOXyD/733bQeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iWJGEbo7aimxfhD4XCKtD23jlAJHPI20Oq2FP2mYHdhWNKJwH8rvvbwYhPdX+asS+Nko+hM9cvznLn32UV/qjJi16rV5gdBREiG+BpMgf07m8NwwjOSSxuUkEJAP5t/4HqQyqCDm3akIUOWq+FKyQdi7jM+VunDg7Uj3qBeNrRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=UKmJgASW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UzyNDugL; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id BF17A1D0028C;
	Wed, 22 Apr 2026 17:10:40 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-04.internal (MEProxy); Wed, 22 Apr 2026 17:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1776892240; x=1776978640; bh=ho5guMm1HwTA2x/cC0OWy
	tNH8h1h5PyjKMZ+eQuo8aA=; b=UKmJgASW6Cpz5I5/zud553i+UN1yxbX59Y841
	kwkOh3C+zCgdU0RZTESrnTL/4/CGWhswYpIZkmoOT1X/l9EOVRxigGq3JILdzuZ6
	m5OGLf00tfZgUc/2mz9jEnryV5rKhfGSen8CjABIpq9KY0qvFqvAiy3PgWY25We8
	1RH5Nnno0l8VQ7L31BfjbEuFTB3XblRhaC+Ksg9GMb6qhDjq0XNw4D1V9zYd7hPS
	Ic8rkCjQ8xAqXp51EYlfkVDi1ucIjHmwZBHHxtckdOjfN8bzv4D+jjynV2W8EVSq
	Th1VnhOHHFdhfTXSi74iYpm/fKfR02pN03FbaFbdRtqexOyQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776892240; x=1776978640; bh=ho5guMm1HwTA2x/cC0OWytNH8h1h5PyjKMZ
	+eQuo8aA=; b=UzyNDugLo7xOV3mHUOdO+pc78XlzW+KuMh17boQ6ocE0uQOKQ8g
	m8SuU9hf5QPOzQAbW8G4lJ9wCMRDyvKp3behrjD5q5/odwFO6UIhaZhjLzwFAxz4
	weDz+KqxX7mqWNyTevW35oXNHvxCYTGWi7qzB8qk7iN8HgvwhW7Jslmq7Qj/UNrj
	GtbDau2b+4v2BR4BJLkgNaIO234VD55ztVym1I5BYrKlBmScAcBTfMEcM79JCeD3
	DYLptEvmLYdWo7+Jkb84Ke2iYz2fctQKMZVk5p493Nu90+kpRCUjQDrU/HRdVoQJ
	f8lamgox64LWkigzAG3japc4wPHDWfl55iw==
X-ME-Sender: <xms:UDnpaYElzECl6OZOVJpQLbIklhOp0GkNoxZ-X9k1M5LZmmscygSIHg>
    <xme:UDnpaZFhVFri6Q3R201UmDZXPi6ari8F-W8C-qF4Qa77j6krCvID61TIKhT896kq0
    rD9awuYoC9iLXZ8i7UhbsQEiDP96EpZqd0oCoPmpHAgaFcjBo96>
X-ME-Received: <xmr:UDnpaVNMo1_2Z9rNEk7_ZAKyLDBtuuPKZUlh6ZRg1UsQ6YUM4AuAb0D_GGr_9R7ZyjwixzRvjjXf3OKk1dp9ILiV-6ka454J7KIRFl6C>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiheefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefpihgtohhlrghsucfr
    ihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvghtqeenucggtffrrghtthgvrhhnpe
    ehhfefteeuieetiefgffeileevtefhudelgeehleetheduteeuvdejffffvdfhveenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihgtohesfh
    hluhignhhitgdrnhgvthdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtoheplhhinhhugi
    dqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:UDnpaYGSL9B2IgDJ7PbBb8RP6zDIuO-uDGKyqNVAWtg1pG__ebjZXQ>
    <xmx:UDnpacNQoLzXrLl-4k3RjwkCStBk0vdDVAkmlPFBP7qSAJCQbXUpKg>
    <xmx:UDnpaZ9VxEmnI0u8coqonA2PPBAjMmP4KWDPqeFtAjtXSOipSf4Lyw>
    <xmx:UDnpaYRcAwwhRwwuDQU4teVZ-pIblbiUkxoRA9_A29hAqfBtoZ9JJA>
    <xmx:UDnpaY3-IHRtJny-9Pg2s6-R7K_mhjPOPh6C4iFnUyew7t0vcjqtniFG>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Apr 2026 17:10:40 -0400 (EDT)
Received: from xanadu.lan (_gateway [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 8DF0B15FA094;
	Wed, 22 Apr 2026 17:10:39 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Documentation: filesystems: cramfs: correct stale hard-link and endianness claims
Date: Wed, 22 Apr 2026 17:10:38 -0400
Message-ID: <20260422211039.270552-1-nico@fluxnic.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[fluxnic.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fluxnic.net:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fluxnic.net:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-84247-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nico@fluxnic.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E18F44ACDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Two paragraphs in cramfs.rst have been misleading for a long time:

 - "Hard links are supported, but hard linked files will still have
   a link count of 1": mkcramfs does not preserve hard links; it
   deduplicates by content (eliminate_doubles()).  Two names for
   the same on-disk inode in the source tree become two separate
   (content-shared) entries in the image, and cramfs always reports
   a link count of 1.

 - "Currently, cramfs must be written and read with architectures of
   the same endianness ... PAGE_SIZE == 4096 ... is a bug, but it
   hasn't been decided what the best fix is": the endianness
   situation has been settled for years -- the kernel checks for
   CRAMFS_MAGIC_WEND in cramfs_fill_super() and refuses the mount,
   and mkcramfs has gained -B / -L for producing images of the
   opposite endianness from the build host (useful for cross-builds,
   but the reader still needs to match).  Restate this accurately.

Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
---
 Documentation/filesystems/cramfs.rst | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/cramfs.rst b/Documentation/filesystems/cramfs.rst
index afbdbde98bd2..221c0bf91b9c 100644
--- a/Documentation/filesystems/cramfs.rst
+++ b/Documentation/filesystems/cramfs.rst
@@ -28,8 +28,10 @@ Only the low 8 bits of gid are stored.  The current version of
 mkcramfs simply truncates to 8 bits, which is a potential security
 issue.
 
-Hard links are supported, but hard linked files
-will still have a link count of 1 in the cramfs image.
+Hard links are not preserved.  mkcramfs deduplicates files with
+identical content, but two names for the same on-disk inode in the
+source tree become two separate (content-shared) entries in the
+image, and cramfs always reports a link count of 1.
 
 Cramfs directories have no ``.`` or ``..`` entries.  Directories (like
 every other file on cramfs) always have a link count of 1.  (There's
@@ -40,12 +42,16 @@ No timestamps are stored in a cramfs, so these default to the epoch
 the update lasts only as long as the inode is cached in memory, after
 which the timestamp reverts to 1970, i.e. moves backwards in time.
 
-Currently, cramfs must be written and read with architectures of the
-same endianness, and can be read only by kernels with PAGE_SIZE
-== 4096.  At least the latter of these is a bug, but it hasn't been
-decided what the best fix is.  For the moment if you have larger pages
-you can just change the #define in mkcramfs.c, so long as you don't
-mind the filesystem becoming unreadable to future kernels.
+The on-disk layout is host-endian: the kernel does not swab, and
+refuses to mount an image whose endianness does not match the CPU.
+For cross-builds, mkcramfs -B / -L forces the output endianness so
+that a host of one endianness can produce an image for a target of
+the other.
+
+The on-disk block size is fixed at 4096 bytes.  On systems with a
+larger PAGE_SIZE you can change the #define in mkcramfs.c, with the
+caveat that the resulting image will only be readable on kernels
+configured for the same PAGE_SIZE.
 
 
 Memory Mapped cramfs image
-- 
2.53.0


