Return-Path: <linux-doc+bounces-92874-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XxQiDlDANGq2gAYAu9opvQ
	(envelope-from <linux-doc+bounces-92874-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 06:06:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 342DA6A3BA1
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 06:06:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="Bg/sWZah";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92874-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-92874-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B1703022E33
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 04:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD3832B9A8;
	Fri, 19 Jun 2026 04:06:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562C32B117
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 04:06:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781841985; cv=none; b=U+oCRpeDrWbzTFTzVSWZgTubVV9O0uCCyVLgps/Jufp83BN+2PzKsjd6Qmv2A9behXy5D1IsA2e+gsqvRCUBYtHpK0a1JzdrMfuzBzxkrkreypHcNZmvp3VO2JRqP3G9Z2dvQXTrQoAvkB6tFomV6wiC9hF/WshIbD3gRTc0/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781841985; c=relaxed/simple;
	bh=sVTqAK4Wzh2wMiFpGJDdy/dhah6Alzdol6TjbFPzzzs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hr/S6tyZkmrBfB76ywQMseNiZAsKW38K241KhIGzjTTf2TEKgtP4y5tCO3JMFwz0TEsXS1yDZbjOd783Hl4Ef+GrGGdObeA8aKJvsX1t1Go4NnM/hXH79z7kZN577EZO/U6JqxznWWuOLvHf4Fr0GMHZDzDt06NCBighBGIdsO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bg/sWZah; arc=none smtp.client-ip=209.85.167.201
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-486e64c8edeso2251970b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 21:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781841983; x=1782446783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B986OHYKnyFOmWr4Pq/xx21N23f5ntjT3AU9YAu1Fcg=;
        b=Bg/sWZahSV+hn35IJOuhumE0/Q6X8moo3ojMwy25cumlZEhIfoI4TapSOAy6yFYIkm
         WV1ldgvL9lumDybfgWK9JmA7xfgSMFoff7JplT/Ahpmmd8eIPQ0VE2f702L0Fyhn9NL3
         WS/CqXN+W0PmnvrwSVo1taRfMt0V1redxpxyEDkSLmoA71yjRhK70qlakLN9lhOpaL68
         stWNLvEaI/Ou3/LsQDWL5DAu4efrd2EHLyxysd20nUQ1cR7sCOcKJOT8KrSfxE6cRjPa
         qljPJrFNszOVDRzoahlsUduGBQRCeBvvWLhvaIinaBbDwlZJlavSWUalySNKNEbXuxvn
         OOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781841983; x=1782446783;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B986OHYKnyFOmWr4Pq/xx21N23f5ntjT3AU9YAu1Fcg=;
        b=ARo0MCrYn6yUflZwJznVD7ogWxkM57gpzX8RlsDsrKzV6XqiMv+osZRYFh6rtcFv7k
         CZ2PhvBfS3AeFh/1+xSN4NKPORTke91WROWuDT34L+PXHNrgr27VUvN6JjbT4GXnVEXg
         J/QiMzwVi9hO3iSACNMJzBeUNZQVCt2zZxzzu5UbJVbmbBJhUiAv7lZ+cd4QNRU5B0dX
         pQzxvDevs3IImE+QqbwuAF2b86TkOCeV2rfi05FzYFd/xP0Ccff0Qv1eQEtjRWiaSFKT
         VsDoj5iTzHnAE6W8ShmmpCqEnEsxeNb3WoqIe40RcHryGVfQ01/GVLvsnwBeHMwkGCWu
         WWcw==
X-Forwarded-Encrypted: i=1; AFNElJ+xr4zMTfyNROdrkD3OcV2OwZQKQAI4WvZFB8lDIDuNHb0WwB8arq5zp8sfX4dsQeGDdUsiEJ/Hg+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRLMhUvhYzq7+KYECe4mbkzyLjxRvx+E9RDuTYoVR0I68aa6HU
	BcFPm3jsXzlOrVkP00Z0Q1HeX9CDYwkjO+tkGO9ymZKjzao5q/2qfZAbFpAWsh92mHTqUVIYNOP
	XSpPKnMyJJg==
X-Received: from ioai14.prod.google.com ([2002:a05:6602:72ce:b0:96a:6b68:25a8])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:15a5:b0:489:6ad8:404d
 with SMTP id 5614622812f47-489b18d4466mr701378b6e.41.1781841983112; Thu, 18
 Jun 2026 21:06:23 -0700 (PDT)
Date: Fri, 19 Jun 2026 04:06:04 +0000
In-Reply-To: <20260619040609.4010746-1-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260619040609.4010746-1-nkapron@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619040609.4010746-3-nkapron@google.com>
Subject: [PATCH v2 2/4] usb: gadget: f_fs: Tie read_buffer lifetime to ffs_epfile
From: Neill Kapron <nkapron@google.com>
To: gregkh@linuxfoundation.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	Felipe Balbi <felipe.balbi@linux.intel.com>, Michal Nazarewicz <mina86@mina86.com>
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Neill Kapron <nkapron@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92874-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[nkapron@google.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:felipe.balbi@linux.intel.com,m:mina86@mina86.com,m:linux-usb@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-team@android.com,m:nkapron@google.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nkapron@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 342DA6A3BA1

Currently, ffs_epfile_release unconditionally frees the endpoint's
read_buffer when a file descriptor is closed. If userspace explicitly
opens the endpoint multiple times and closes one, the read_buffer is
destroyed. This can lead to silent data loss if other file descriptors
are still actively reading from the endpoint.

By tying the lifetime of the read_buffer to the ffs_epfile structure itself
(which is destroyed when the functionfs instance is torn down in
ffs_epfiles_destroy), we eliminate the brittle dependency on open/release
calls while correctly matching the conceptual lifetime of unread data on
the hardware endpoint.

Fixes: 9353afbbfa7b ("usb: gadget: f_fs: buffer data from =E2=80=98oversize=
d=E2=80=99 OUT requests")
Cc: stable@vger.kernel.org
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Neill Kapron <nkapron@google.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/functi=
on/f_fs.c
index 38e36faefe92..374ab36eaaa3 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1374,7 +1374,6 @@ ffs_epfile_release(struct inode *inode, struct file *=
file)
=20
 	mutex_unlock(&epfile->dmabufs_mutex);
=20
-	__ffs_epfile_read_buffer_free(epfile);
 	ffs_data_closed(epfile->ffs);
=20
 	return 0;
@@ -2390,6 +2389,7 @@ static void ffs_epfiles_destroy(struct super_block *s=
b,
=20
 	for (; count; --count, ++epfile) {
 		BUG_ON(mutex_is_locked(&epfile->mutex));
+		__ffs_epfile_read_buffer_free(epfile);
 		simple_remove_by_name(root, epfile->name, clear_one);
 	}
=20
--=20
2.54.0.1136.gdb2ca164c4-goog


