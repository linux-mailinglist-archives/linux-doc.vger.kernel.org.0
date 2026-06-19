Return-Path: <linux-doc+bounces-92940-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NbG/CVxQNWo4sgYAu9opvQ
	(envelope-from <linux-doc+bounces-92940-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 16:21:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADFF6A6602
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 16:21:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="s033ai/8";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92940-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92940-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D8553023E06
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 14:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2B02D9EFF;
	Fri, 19 Jun 2026 14:20:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554BF19C556
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 14:20:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878849; cv=none; b=bph9TdZF66VyvEFaePa5BDk8sGUmeK4EkaN8dBb1Yq5fgLiNp8OvqIdgYUK1lC01XQYoVMaQjwdHDKZ1mEr+qSR1JdwZL9pHRt04ZybV05NXU5cnM3eZJHWnMEkdgjKmNbFX06Vw4Z3JACps/xsdYLWeSV8Iy3N8gRy00uPIxUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878849; c=relaxed/simple;
	bh=2FQMD8bu684nEsU/UXL7vfxW6vXPsGHz9C/bJbOPhZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMkGlaqb6/zwfAYyZk4cBPbfasWQMcwjdyQ3+rqNbC7H1nj4V1Xm9vASM22UJQB8fVIhpqkOKtdjyVWJQScx6kbxGMiZI9jeDTUpqL/qTRxmY064CFkoIuiU9xdBkvy0b0Cis3rIgQWdylAPF1dUYACFATV2pfEhZKbmo/3Owcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s033ai/8; arc=none smtp.client-ip=209.85.217.47
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-725f7cba0bdso756257137.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781878847; x=1782483647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oTK64FZoF89IvutywaKW9AaCpbwlqYnBXZ0qeFcwR1o=;
        b=s033ai/8du0j6leIbHuLlxOJYI5xeNG9hgYq8qaqXALedHj9kq+2u84lFNV81s2FLb
         JGk4wDATGcvd2XJ8469i5AwpgkVWmTBplg8AeidwO9d6huH7E90+kVmMOTawpBItmApb
         ubiAMSET6AadVvA8COufajVZcqVJoVp4EdSpwHIWp0hkyE5ak//9sA7XrVD6STFMOmh3
         IRFXIdecBegaManci/OK/RDYHlQc4WKZDYo77oO9gQ9mJA8QUJnvVBR/GdEFA04p83ht
         qQtkkyFkvJU6oXHei2lkHzj+l+9Rfk5Bek6cheHLBxLpvzV4DxBe1ipn9184lDYAH1+M
         8VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781878847; x=1782483647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTK64FZoF89IvutywaKW9AaCpbwlqYnBXZ0qeFcwR1o=;
        b=SGPw8NVN9oZLwUav/xKdyMwfUGsIA9KXBt4BuNeeIrjeFd9KgTw235etChtv9meL17
         E+kY/rbuy4E60yqI70/S8GQH9UnbYAYouBTk9cgpHh7Rat9iw5rPnQmKysknOncLqFVu
         k30iU99CkYcJdfh7wtpnoQz9X6i1pvX/9km0V4mleSNfO+UjslMxD951zZqYK06Ks8yA
         /siWs5ekME3MoFbJ86R22d3hF/okYK85xWPvdSdds71ivwTPIdb5BoY+cQcp3iC5xqZ1
         oTbYKXv2yp6Q3eqD7dmAVscBD5R62wV/r8i1taIlN55y9w0wRx8tAlS9Vi5MKfC5wj6u
         B3dA==
X-Forwarded-Encrypted: i=1; AFNElJ+hoKHmHnyJVWKS/Snk69JaFJAV3O5sdTxh8btl5poPbhYuyvsPtGI7ufq4YJO+GHGM9qQ70/huyHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm4Rlxf4ePI0pHSUEsB2Z6XQzKrhKCZDGfXuhuxCG91Cpjd5fQ
	3DQUsObs1Rn6VBl6E0YGEV7EtnTyHrnx+v2J4UkzwJx2Hr9wHFogo5jz
X-Gm-Gg: AfdE7cmxJJSEhvn4chv0hgGqB2B//qP0fOT+N2dRiSyKPBKeG8AMz8ArVIWd0rKGI0y
	DTCHV2JzCRn53vGLpZyxa4LXAktNxQ1s0BWxsxiwHolCuT7TgWNFwUYEO7etEHjttFAttZ9tlBq
	iOWRTtF8FrTIs08Y7VWCzguEjYFkGiU4xxOMEtjbmqrn6uwjdDFpb9cDqGkP7iZ5atHH63nuBoL
	C/XQ9dCF60blgjUNDKDmRwpEnKmm2ltJUqHT8jKu0TGEXw778GBQbjId1gjBvohgcCIBTtY9NZT
	h4xDvTxh2TxwPYqDQEhUimcg0O9TU1Vq1Zb0DADtW/QsqRnZ8hVZ1uFPDWZdxBv0cEwTBJU5eCZ
	4H2OvxYDntND+P/xynosD45yG+F1fSuQV9vdEHeO899XF92TihOXdt4oIysTa9MJ7gBc90bsSOf
	8y9ek=
X-Received: by 2002:a05:6102:5491:b0:720:81d5:92dd with SMTP id ada2fe7eead31-72a78a86867mr1255462137.22.1781878847023;
        Fri, 19 Jun 2026 07:20:47 -0700 (PDT)
Received: from houminxi ([101.90.5.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72a34712e0fsm1689034137.4.2026.06.19.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:20:46 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: linux-nfs@vger.kernel.org
Cc: trondmy@kernel.org,
	anna@kernel.org,
	cel@kernel.org,
	jlayton@kernel.org,
	linux-doc@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH] NFS: pnfs: fix stale references in pnfs.rst
Date: Fri, 19 Jun 2026 22:20:40 +0800
Message-ID: <20260619142040.3970345-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92940-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-nfs@vger.kernel.org,m:trondmy@kernel.org,m:anna@kernel.org,m:cel@kernel.org,m:jlayton@kernel.org,m:linux-doc@vger.kernel.org,m:houminxi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[houminxi@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[houminxi@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8ADFF6A6602

The layout header list was moved from struct nfs_client (cl_layouts) to
struct nfs_server (layouts) in commit 6382a44138e7 ("NFS: move pnfs
layouts to nfs_server structure"), but the documentation was not updated.

Also update the layout driver description to reflect that the objects
layout driver was removed in commit 6d22323b2e9f ("nfs: remove the
objlayout driver"), leaving 3 layout types implemented in the kernel
client: files, blocks, and flexfiles.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 Documentation/filesystems/nfs/pnfs.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/nfs/pnfs.rst b/Documentation/filesystems/nfs/pnfs.rst
index 7c470ecdc3a9..ea3d15cc4549 100644
--- a/Documentation/filesystems/nfs/pnfs.rst
+++ b/Documentation/filesystems/nfs/pnfs.rst
@@ -22,7 +22,7 @@ outstanding RPC call that references it (LAYOUTGET, LAYOUTRETURN,
 LAYOUTCOMMIT), and for each lseg held within.
 
 Each header is also (when non-empty) put on a list associated with
-struct nfs_client (cl_layouts).  Being put on this list does not bump
+struct nfs_server (layouts).  Being put on this list does not bump
 the reference count, as the layout is kept around by the lseg that
 keeps it in the list.
 
@@ -62,8 +62,8 @@ bit is set, preventing any new lsegs from being added.
 layout drivers
 ==============
 
-PNFS utilizes what is called layout drivers. The STD defines 4 basic
-layout types: "files", "objects", "blocks", and "flexfiles". For each
+PNFS utilizes what is called layout drivers. The Linux NFS client
+implements 3 layout types: "files", "blocks", and "flexfiles". For each
 of these types there is a layout-driver with a common function-vectors
 table which are called by the nfs-client pnfs-core to implement the
 different layout types.
-- 
2.54.0


