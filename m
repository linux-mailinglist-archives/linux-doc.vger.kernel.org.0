Return-Path: <linux-doc+bounces-82393-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJTVGyDrz2lF1wYAu9opvQ
	(envelope-from <linux-doc+bounces-82393-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 18:30:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F2E396682
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 18:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FCF231798B4
	for <lists+linux-doc@lfdr.de>; Fri,  3 Apr 2026 16:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D1D3D88F6;
	Fri,  3 Apr 2026 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0JRh3nd7"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483013D904B
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232629; cv=none; b=FfEjuFwoMHJaUb4H1EAldb8A/Zu9Mddeu9rgs8MQZFDXE0RCbrY1lDMd+IOaknNiJhxkQIynPQyWxKOwo2FW6ESAJak8MFuFs9JmF+qZiIQs93HGri0L4l6joKLWRzNDvdMwPDgh3i2oeyUtTgtUnSrtKd7Eaj0PrprktKsOlPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232629; c=relaxed/simple;
	bh=gnzj7GWcp98ZnLLkgndMyN+X9yfr8XWTdmY+32KVcqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M0Ix+Hvr0+xkJV2biyl9rD9Q3cgf1ecFQLGN5yBnb9Agzyvvk5rx7rew92SDn09K6Pd43fghkBdcXCqOkYmg3VZea+cPhBVZWZ7I3zyOhH/vPhvKlBW7AjGMUIRCU0jQjwzXnh05c/FejETzNjxiB8RpXYiHGu5/m5xW0v47bFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0JRh3nd7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 107BB4E428D7;
	Fri,  3 Apr 2026 16:10:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DAF21603C1;
	Fri,  3 Apr 2026 16:10:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FA44104500F6;
	Fri,  3 Apr 2026 18:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232626; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3IYxtkzdeu6bnBo9MR5hdgZZXX41AGqFyUgLNr5QV1k=;
	b=0JRh3nd7uPxKBQjr0gpuMTv+uGoVpzl/OUHmv+NgwRBOaQgZ5jaETyEddbJfKTMamPPG8g
	kTEWoBYiMLLrxigSWWfHxTLD/V6IDDf0isVqztHjtkuDNIZ/cafXTLkevGhK+LVhkB9tQY
	kQd/dv88B34HM+du4N8Geh+3zS6OhEaoj7mibc1Kkq1r8aadPavB5LQ/nqiWjBJdai761H
	6bCwHr7gCJq7ROek8qettAe3OPt1zqzOPqVtzyrhQIH68yDeIzyHjFxayEYkwZiRrZ+pSJ
	tSLbsLFNjBp+lWz80aqj6pbOjsllVmF21R1LJL5nXer/SSE7TtulLj1Z19ChIA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:39 +0200
Subject: [PATCH v4 21/27] mtd: spi-nor: Add steps for testing locking with
 CMP
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-21-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82393-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: E8F2E396682
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the test coverage by giving guidelines to verify the CMP bit acts
according to our expectations.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
The instructions listed in this file target people adding support for
new chips, however here are below extra steps that I also ran with the
same W25H512NWxxAM chip. They are here to prove core correctness.

    $ flash_lock -u /dev/mtd0
    $ flash_lock -l /dev/mtd0 0 1008
    $ show_sectors
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16
    $ flash_lock -l /dev/mtd0 0 1009
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16
    $ flash_lock -l /dev/mtd0 0 1015
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16
    $ flash_lock -l /dev/mtd0 0 1016
    $ show_sectors # should cover more
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03f7ffff |   locked | 1016
     03f80000-03ffffff | unlocked | 8
    $ flash_lock -u /dev/mtd0 $((1015 * $bs)) 1
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03f7ffff |   locked | 1016
     03f80000-03ffffff | unlocked | 8
    $ flash_lock -u /dev/mtd0 $((1009 * $bs)) 7
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03f7ffff |   locked | 1016
     03f80000-03ffffff | unlocked | 8
    $ flash_lock -u /dev/mtd0 $((1008 * $bs)) 8
    $ show_sectors # range should reduce down to initial value
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-03efffff |   locked | 1008
     03f00000-03ffffff | unlocked | 16

    [Similar situations, on the other side of the device]

    $ flash_lock -u /dev/mtd0
    $ flash_lock -l /dev/mtd0 $((16 * $bs)) 1008
    $ show_sectors
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
    $ flash_lock -l /dev/mtd0 $((15 * $bs)) 1009
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
    $ flash_lock -l /dev/mtd0 $((9 * $bs)) 1015
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
    $ flash_lock -l /dev/mtd0 $((8 * $bs)) 1016
    $ show_sectors # should cover more
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-0007ffff | unlocked | 8
     00080000-03ffffff |   locked | 1016
    $ flash_lock -u /dev/mtd0 $((8 * $bs)) 1
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-0007ffff | unlocked | 8
     00080000-03ffffff |   locked | 1016
    $ flash_lock -u /dev/mtd0 $((8 * $bs)) 7
    $ show_sectors # should not change
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-0007ffff | unlocked | 8
     00080000-03ffffff |   locked | 1016
    $ flash_lock -u /dev/mtd0 $((8 * $bs)) 8
    $ show_sectors # range should reduce down to initial value
    software locked sectors
     region (in hex)   | status   | #blocks
     ------------------+----------+--------
     00000000-000fffff | unlocked | 16
     00100000-03ffffff |   locked | 1008
---
 Documentation/driver-api/mtd/spi-nor.rst | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 4755eb75fe5e..ec46bba8297a 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -331,3 +331,39 @@ section, after the ``---`` marker.
      ------------------+----------+--------
      00000000-0000ffff |   locked | 1
      00010000-03ffffff | unlocked | 1023
+
+   If the flash features a Complement (CMP) bit, we can protect with
+   more granularity above half of the capacity. Let's lock all but one
+   block, then unlock one more block::
+
+    root@1:~# all_but_one=$((($size / $bs) - 1))
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-0000ffff | unlocked | 1
+     00010000-03ffffff |   locked | 1023
+    root@1:~# flash_lock -u /dev/mtd0 $bs 1 # all but the two first
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-0001ffff | unlocked | 2
+     00020000-03ffffff |   locked | 1022
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-03feffff |   locked | 1023
+     03ff0000-03ffffff | unlocked | 1
+    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-03fdffff |   locked | 1022
+     03fe0000-03ffffff | unlocked | 2

-- 
2.53.0


