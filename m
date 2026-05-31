Return-Path: <linux-doc+bounces-90189-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNAeOgB3HGqPOAkAu9opvQ
	(envelope-from <linux-doc+bounces-90189-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 19:59:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A177617646
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 19:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB35A3018C07
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 17:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D268735C180;
	Sun, 31 May 2026 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QyQCjjc/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VtUPxekb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71BBBA3D;
	Sun, 31 May 2026 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780250363; cv=none; b=BkeqWlw2hLdozOUXdmdBmyrqN/yJXmn8p9sOZDqyXi0/T1V28C5Btxvnhm1DLsHaJPYeOy7v5K4A78hWyZX1xQbG66gS1bZViYHxPryWVR63AGu0+6Ri5lR2YY8uaeIBxkMUikL1mTRAzNxZaYOTbP5EtKNPMU4WO1CboS/gnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780250363; c=relaxed/simple;
	bh=6j55yuq3haW58mABu5fGuPM2I8vX4fLaAq1ZXQ7u+tI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=GasEcntUqpH6bpPrCuauwfG3MzeeiyhPyLfjSy2hsbQaDKPIgq6Kdvij/yPkXGzTTMUlYVf0ru5QNLMlJL0xorEhEJSmF9I7hTIE/WgpIY0NrmrL3+bbU2vG/2LdKCn9/0Gj2RyH0o06haG8RTnI9sh5h859QiR/vq1M+m9sJTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QyQCjjc/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VtUPxekb; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gT4bj3v8Lz9tDy;
	Sun, 31 May 2026 19:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780250353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=57br2g9fUlfUtP0mB56ZX/QUS1QSPk6nRh2NT0X1H0c=;
	b=QyQCjjc/mgJPQ+Xysh/CJR9gCUZ4w9mCJiUGOG3ClIjgoD0axk7Dbhfr9I8V5yNk9yBt8v
	+xK7k1cciC+fHmR/wdCVNDlfTaosfwuisGF0O0Dk/f8ldwqajilYe9z6188cx0uuiBv9Ws
	cJpyp59mFoDdZSJQUj/C67YbICDf55gK2Q0kdKAVEpJZ/XAMolP9vvE46DPD1aHvcrJTVv
	NZFfyts9yAreA0FcqzBhixX3n3Dd3aNR+CCcHr2TchBFZiS6luNrtKn/HYdY4ONmU6v7ua
	Jwk44rphqEI9A+uxiu2airN57TGhyb2Bys/Ba1hT4gEKwAom4e0MUlJuIJbu+w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=VtUPxekb;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780250351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=57br2g9fUlfUtP0mB56ZX/QUS1QSPk6nRh2NT0X1H0c=;
	b=VtUPxekb4ykd7UCXk/hIf/auad7jUbChXdIDKIpMWAm2JyrDYx+iUdrvw7dzJyM7N8qTrD
	29o/hDM7YC9OGcRcz/+pnm5f8CgCYUEHr5YEOj9kwikrGGfvDxYo7PZcDXGvnH8IbFFsUI
	3Lnp8rITGmYh5exhA0/VqQmQkbGBqbO1BusqdvltKixihLHV7kF0h1iCGAZMnfuEWs0kyO
	9q45OJk7rmJDJogvYzeOOax0/E15HHHtCv+oWx4RKKPzIsDhPKziRQULFor21o//y+pk1v
	ai9ApbHsRZiC6eE9/X+oD1Bg2bU9E42QtxkT40DwpsPtJzced/cqzHYyOBTMsA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Manuel Ebner <manuelebner@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: locking.rst: update deprecated function
Date: Sun, 31 May 2026 19:54:53 +0200
Message-ID: <20260531175452.272136-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 062210b7197cab47db8
X-MBO-RS-META: k8jjtk9x1ay9u131ydq4cuqbq45gfnao
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90189-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6A177617646
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

replace strcpy() with strscpy() as suggested in deprecated.rst

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/kernel-hacking/locking.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index dff0646a717b..d625b522265a 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -471,7 +471,7 @@ to protect the cache and all the objects within it. Here's the code::
             obj = __cache_find(id);
             if (obj) {
                     ret = 0;
-                    strcpy(name, obj->name);
+                    strscpy(name, obj->name);
             }
             mutex_unlock(&cache_lock);
             return ret;
@@ -553,7 +553,7 @@ which are taken away, and the ``+`` are lines which are added.
              obj = __cache_find(id);
              if (obj) {
                      ret = 0;
-                     strcpy(name, obj->name);
+                     strscpy(name, obj->name);
              }
     -        mutex_unlock(&cache_lock);
     +        spin_unlock_irqrestore(&cache_lock, flags);
@@ -676,7 +676,7 @@ Here is the code::
              obj = __cache_find(id);
     -        if (obj) {
     -                ret = 0;
-    -                strcpy(name, obj->name);
+    -                strscpy(name, obj->name);
     -        }
     +        if (obj)
     +                __object_get(obj);
-- 
2.54.0


