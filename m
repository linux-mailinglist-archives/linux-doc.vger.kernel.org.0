Return-Path: <linux-doc+bounces-93498-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id du4dKtv0PGrmuwgAu9opvQ
	(envelope-from <linux-doc+bounces-93498-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 11:28:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 241FC6C438C
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 11:28:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iyxSD9Gc;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93498-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93498-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 312983014C65
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 09:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF2E383333;
	Thu, 25 Jun 2026 09:28:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE0F37CD52
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 09:28:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379737; cv=none; b=FXOqOKlGvj9GCFcOQUt2XZwwCN6LwtrhGGhZQwHYdWBoh6ANTESTpnGNxORH8bMbLebZifcdpLNVmvlV5Q8n1+Pz/6RVrIJ/MFUqfgVdPtt/sqqlcuIQYgt1aOg+xzOAx80pysiL+935zjaDFNEhxc8wNZeRtCE/7XMP4EqOvWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379737; c=relaxed/simple;
	bh=kh82R1MsTSPBcl6pG1Mmww4wNBsB15g85rJvFvbgMTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=erPrauMfRInghUNLbjPJD2PJvCDdpqfo+jfJ+iemhQ3eY+T2omghP0Jada+tmnjb51oX0V42uzlwMkSPYtmbho4Z+YeONmADq4FJl+r1Kei9OvwBviMB61YcN7peJimGzUIEWMCrCOeF5QlDGJdwRukZOV7IC91TxTQ8UbnmLXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyxSD9Gc; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-492438c79cdso2264595e9.2
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782379734; x=1782984534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=My51FwaQUcZD/Nr0U6Se3oJ/GMpbaYr9QAz0ZUgNMk4=;
        b=iyxSD9GcEoHRcJOrKzk162NE7QufPAb1Cu5JJIxRTIcdg1tH8w7fF7T7AVvkAbVU7n
         L6v5A6rzDEPUtFLlKSy0v8sJd3HYFHI3E2DKbcC2fpCDwlgUWCwJREaUx0eWhJt7/bWp
         UGaU36jRpEW6Q756j+AioLrajCoZC68KAXWFeFjVEoD/fNy2yCIm/bSmbI+sO8J0IT4g
         OdiTaWD0xuaW6XUydagG8PWUDfIF9iD1mCjxwW/1BIQQYxAg74KUie2DtE6XzqbeNt6h
         EvevZWvWuZpzurDXDLVfOjfYXKe1aqHKXKNfx1sBrVJtxhRYeIFe5BnjnAMoppTunvrM
         3NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379734; x=1782984534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=My51FwaQUcZD/Nr0U6Se3oJ/GMpbaYr9QAz0ZUgNMk4=;
        b=OOsdN0olZo1fu2CC5VdXAno/MQVuQ+/vvX5RujbAO6wbHKuma5k8qKMLD/OtYXJHIc
         4P++tdd8dFb9kdu+7tug/8GTYUBGh3SCS34hB28OAugh+Uom0BtpxR+zbRmh/lmXouft
         pzA8kgjKRkhqAf5oLMCjCKer8Hezq6jonwq+u78DmuYEeu6Hbdkdss8zHxKCPZ81UOn0
         pdNlDYmtXHkE7O/dlv1OdlmYan+ivnC+0TCBwS5MYCdl2L0sNPUbGtSjFe8gWclEHi/i
         v6HzlzHZzmYbkDVjzC2irBmQiFzLJ4NDqcAmi9JP7qujq85jwC9x0mo8yGrNzdFysKSW
         w1Jw==
X-Forwarded-Encrypted: i=1; AFNElJ9IPNTB+Pek+pqSWNGM+Sp2Im2HiyxcQRay7MZwERgJDEALbtq0bcOEs7NfIOU7sO4vFiwVi9EIcSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLCGhQF6ihvOk9DA5pODEDPqqlzybz9kj8wq7/FS5KWU/3s3TY
	BWWJzwmRNfHpjUfvzu3cq2Q7V9Yav6fB1Vi/sgOIjkSoSNdZ60lRWZfv
X-Gm-Gg: AfdE7clB4AMBXN8EKML+Wj0zZL+7lDoZAoS9G6RsK9pjLjyfVwW/qk3xZbcsq7fe2Cc
	66BpdSkCyJudP9TlDp6IA4rLXSUsCRjjnGINJ/35BpqKrY/mpvPQSPTpo62KPN3hZyr/BzbYlfG
	c0HZOpvtYB9R5Jg1Lx4J4ORRQ5a0Pq7EjfwvAUpE+V1YDe9BDcCcaiPkyUUgcrRtOk65txzpSRt
	wtEhHYdgp7zsDG7B/awiIWHTYlgGojUowh7GdUdgNPDKXRVXKVemNtdeV0SxXB7zJPz2TYshn1U
	juB+/KcgGp2poQZKeiua0X5xjHOussTw1bTO8JR6UaQTyhi4/QItd+DVAJyShhi18nxMvrDe5lw
	bzIgc0nZUHkL15+u+4ZpE84eeGBttNrvaikDxa2WN2gs4mqSVU5TSEEJUUnePW7WzGChChs3I2z
	sIB+NAfAgt5obOTZqJbs2KIcSwCy6J1i1yk6EzoTmmUL47SJrjTvj35IPhFKZO0m48732oHMpWf
	Oe5yvci2YyzFxJK
X-Received: by 2002:a05:600c:3485:b0:485:c456:5e4f with SMTP id 5b1f17b1804b1-492667ca9afmr12005785e9.0.1782379734260;
        Thu, 25 Jun 2026 02:28:54 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm14978527f8f.9.2026.06.25.02.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:28:53 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH] Documentation: landlock: Document fs.resolve_unix audit blocker
Date: Thu, 25 Jun 2026 09:28:19 +0000
Message-ID: <20260625092819.1870049-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,linutronix.de,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93498-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mic@digikod.net,m:gnoack@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bigeasy@linutronix.de,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:doehyunbaek@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[doehyunbaek@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doehyunbaek@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 241FC6C438C

The Landlock audit code can emit fs.resolve_unix as a filesystem blocker
for pathname UNIX socket resolution denials, but the admin guide's blockers
list did not mention it.

Add the missing blocker name and ABI version to keep the audit
documentation in sync with the emitted records.

Fixes: ae97330d1bd6 ("landlock: Control pathname UNIX domain socket resolution by path")
Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
---
 Documentation/admin-guide/LSM/landlock.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/LSM/landlock.rst b/Documentation/admin-guide/LSM/landlock.rst
index 314052bbeb0a..8eb85c9381ff 100644
--- a/Documentation/admin-guide/LSM/landlock.rst
+++ b/Documentation/admin-guide/LSM/landlock.rst
@@ -52,6 +52,7 @@ AUDIT_LANDLOCK_ACCESS
         - fs.refer (ABI 2+)
         - fs.truncate (ABI 3+)
         - fs.ioctl_dev (ABI 5+)
+        - fs.resolve_unix (ABI 9+)
 
     **net.*** - Network access rights (ABI 4+):
         - net.bind_tcp - TCP port binding was denied

base-commit: ab9de95c9cf952332ab79453b4b5d1bfca8e514f
-- 
2.43.0


