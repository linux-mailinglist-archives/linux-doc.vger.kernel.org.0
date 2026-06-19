Return-Path: <linux-doc+bounces-92873-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mSLSAmTANGq+gAYAu9opvQ
	(envelope-from <linux-doc+bounces-92873-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 06:07:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D566A3BB1
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 06:06:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=PuggBTIf;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92873-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92873-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BE1C3050442
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 04:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DEE32B981;
	Fri, 19 Jun 2026 04:06:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7873C32E68D
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 04:06:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781841982; cv=none; b=EjMVbL9oXaoON4DAjjV8T/3f/h/VPvhgGXa6qk/y7L/RQW3rD8/5P025u43RIZiGO3fJN7L7s2BHosR1quDYEo1M9ZeVUbw+eivGxDIYYsqk39Ld541xH0gJgkGk61ghZy4jfQaKjfNwwq1LjpugrjjUliwSIS8Mgyqo3BgsELo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781841982; c=relaxed/simple;
	bh=nftBYdP67zsArySbYAbmzoYET7x7VfM2LBmwgUSzhEs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gc/erRMlF3u7kAARXdV0bp0uuatWaWPHWiHxILnoPXxjI/AbbJEYQ0uBR9/kg61rB32pwDPNR8iJddoqaOQA3HhXSFOCaoc9Xqmg5KTkJspsc++yMVxbDBYjXdQE55SQAHukQoEF66lp9EndGCJOfdjNyN4a/fTRxEG9PmgTwBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PuggBTIf; arc=none smtp.client-ip=209.85.167.201
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-486a2a910efso3398053b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 21:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781841980; x=1782446780; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NWgKW4ndueXEPoNUBny6URTgdeHcCM4KkKjb7H+dGhg=;
        b=PuggBTIf9f+y7VfZ/TApnSEnPPHjc6OH+Y0QlvGZrmHtIXiqgd9EijylwatNJlBbGs
         iQYK87QVXkdnqN6QHyposboBFj+gr3OrI4cTa4FZoWwp609CtdoIVQYwcXlxMrZDGIJy
         tndXCCI5d/+SePeAdJZ8T8MjcjKSzaAfnKAGnBd/Lxi4YVHOqARZj2Be3ctBqTYhT53P
         k7O96OZh9wxPMpCHs0Sz7AsNafCJzyGXreLx/R03ZCjQrjR+wj6ysyPc+RzuOzhn74yr
         ngZdGVqHWtapcUwVxMUBPk27jxPwCKZ3iL+IgIhKfqhfZeqbFb9rVLaB3q/l/PyYoNhJ
         vMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781841980; x=1782446780;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NWgKW4ndueXEPoNUBny6URTgdeHcCM4KkKjb7H+dGhg=;
        b=M+Y9l0nxa0aqDog0q4VyQBZ/83Q40OBNlaFTC8VqQxKYEF7vkZtUXNSYxWqIrHRnPX
         +Asa1erHSUpdqtfCnnsB39M9oKZKLWv8vOSrBjfSnq71gFY7U+jgpPxj9304Bdut0EEx
         eZn9OP+0iwJOxj9uAhN6R8FcgcRZPTjLRui7jpbSm5g8AhyImqJjW7CCwqQZe52zOUL3
         dQzV42X2pIl1JX0zE+EtaGSJHWK3lvPcVmGpqR36kaLwthXFDnfli1BgLTiiQQkTS4Dy
         xXOHae7uPXoKFdA9RCdFIgGB5R8X+ZzSV2up0Qv/yLlhHg38UzLejd8dr3fmwXeDq14B
         kQHg==
X-Forwarded-Encrypted: i=1; AFNElJ8jMlIQNM7K2yqAxxoVQDNRKFYnVOkMXvJk7SGKV4K+WEq2euqEySHXdyIj+2fDx3NA/uI3hCH3H+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8xlEu6yhrkFBoabLHLVy26LGnqFd6+FKeqAXqoEYbtCOA38I8
	wLfV7qYPOIVVi3rmpnL3xXs+5QO9aB/zGK3iH0oj8D20lLfy+DNJXYtfhqjfx6tvq0dsUYWqIXr
	jjctCkDTWiQ==
X-Received: from iobp21-n2.prod.google.com ([2002:a05:6602:8695:20b0:998:4431:ccf1])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4c86:b0:489:79d8:135b
 with SMTP id 5614622812f47-48979d81734mr1189800b6e.25.1781841980164; Thu, 18
 Jun 2026 21:06:20 -0700 (PDT)
Date: Fri, 19 Jun 2026 04:06:03 +0000
In-Reply-To: <20260619040609.4010746-1-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260619040609.4010746-1-nkapron@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619040609.4010746-2-nkapron@google.com>
Subject: [PATCH v2 1/4] usb: gadget: f_fs: Initialize epfile->in early to fix
 endpoint direction checks
From: Neill Kapron <nkapron@google.com>
To: gregkh@linuxfoundation.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	Paul Cercueil <paul@crapouillou.net>, Simona Vetter <simona.vetter@ffwll.ch>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Neill Kapron <nkapron@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:paul@crapouillou.net,m:simona.vetter@ffwll.ch,m:christian.koenig@amd.com,m:linux-usb@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-team@android.com,m:nkapron@google.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nkapron@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92873-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nkapron@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51D566A3BB1

When parsing endpoint descriptors, ffs_data_got_descs() generates the
eps_addrmap which contains the endpoint direction. However, epfile->in
was previously only populated in ffs_func_eps_enable() which executes
upon USB host connection. As a result, early userspace ioctls like
FUNCTIONFS_DMABUF_ATTACH that run before the host connects would see
epfile->in as 0, leading to incorrect DMA directions.

By moving the initialization to ffs_epfiles_create(), epfile->in is
accurate before userspace opens the endpoint files.

Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
Cc: stable@vger.kernel.org
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Neill Kapron <nkapron@google.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 75912ce6ab55..38e36faefe92 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2364,6 +2364,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
 		else
 			sprintf(epfile->name, "ep%u", i);
+		epfile->in = (ffs->eps_addrmap[i] & USB_ENDPOINT_DIR_MASK) ? 1 : 0;
 		err = ffs_sb_create_file(ffs->sb, epfile->name,
 					 epfile, &ffs_epfile_operations);
 		if (err) {
@@ -2453,7 +2454,6 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 		ret = usb_ep_enable(ep->ep);
 		if (!ret) {
 			epfile->ep = ep;
-			epfile->in = usb_endpoint_dir_in(ep->ep->desc);
 			epfile->isoc = usb_endpoint_xfer_isoc(ep->ep->desc);
 		} else {
 			break;
-- 
2.54.0.1136.gdb2ca164c4-goog


