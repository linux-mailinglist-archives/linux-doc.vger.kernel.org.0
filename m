Return-Path: <linux-doc+bounces-78899-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLUsEp7VsWk2FgAAu9opvQ
	(envelope-from <linux-doc+bounces-78899-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 21:50:38 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224B26A28F
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 21:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5F713016B0F
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 20:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0752D2D949C;
	Wed, 11 Mar 2026 20:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="MlX8IrP8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8523631F9A8
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 20:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773262231; cv=none; b=VZSv7k4DlvUQ7M+W+cwiuZ4Sprv0jwUuiDwTbK/YoVrcDuNnB5VkZvPANw59KOiYhSVa9T0G5rQbVsb1RLumCBROsASjeqtBohZIZ1gdJSvjluwVPpjvL80sDjt24/ffcwS/ZTjObfS1rKMSKGmMixNFz4kOSG6/w7otmTdD4FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773262231; c=relaxed/simple;
	bh=WJcW1lA0tu2eb7j4StbFQ+rLT76qulDtOkzOw26lp6k=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=WsU2qf1ZuEIvr0ZO7ZH8qp0CjPg2bOiRcAp1xNmbWtGzOkbnEnq+vv4vJ8x9CPuqCenJWmMFOQQ8vd9ZBFZ3/0sxYgNukVrsMR/eVDPo6frmNG+qdLUnKpS4jVXx2kGJ4WIuPOkAAgQj5JfTzRZR017gzUT4XoiCyL5r46YBO40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=MlX8IrP8; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso399471eec.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 13:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1773262228; x=1773867028; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3A4B+f1c95c4egMkkRgtXn4omwf2yF6o5FnhdI1eZ4=;
        b=MlX8IrP8YU/vSbj898PpPVB6pNgYHBrbf5kdmQg1RC1IBmFFpPU1+e2Ktgwsxt5yH8
         nh/zYI8XRXokoSsJa0wyOljyuJYOQL4/3VJvoGONIb2hUPTHQgBNXx0eXTmItbneCySR
         kdd6FzYZmkpB3k2I+jT7Fpb0qU5uLM9GlEDq5lbtJiPrR+GJsYUTK4w+GEOdJ1l3oDHb
         hiYjM61Z26I1HI+BoATPQBlWGfm/TX2DjKGApyUpm4tamCFZu/XO4YDkTjI8oGS9Ksa3
         uNYfsHK3TDCBLInWoioSQ/N+BVAM7bVzIpmbilSAln5GMCxEqEuaukv7cp3gmxPfT8+Z
         sdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773262228; x=1773867028;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3A4B+f1c95c4egMkkRgtXn4omwf2yF6o5FnhdI1eZ4=;
        b=aot26F0Qm2DAJARdXlpVScjR0MOuPIyfN4tRberxp0umxL4nyt6l1YFfuJm1uElWe6
         xiIyviZAdvnyZTYpTQhlcN1eYqn2Tw5cJL3zugzwXMOFGoApOy91VwYf8vbe7/AfK3h8
         sAXrw2796TZYmifA8aKcaoDJpGoJCq+1OBiDuoUpYRmCH0DghUUMo0Pl1wHISZSkvroV
         xR4tu10JB8ggi146jzdvZif+U5Yrl1Z3SFiADNyj89/avt1bMvDBDxHq59UVKuY52SMU
         /0HEn3cFD3dHgbxY9ij+re3Nc7P1tXfrDkZKv6WW/MqLCTxjoHrTHQGvQukKqh3PZpCy
         RoRQ==
X-Gm-Message-State: AOJu0Yz8oUzVGBxmf2naeAKOG6NvoOU08I0kzFGr3JRwoss8yY/5u3VB
	JXQdShvi+Izu9hSBg10kTCfpsOglA99aCuLMq3YRa/X/gIiTlNwAsmVM30Tn/sMOEL4=
X-Gm-Gg: ATEYQzzumzee+Fg7yiBqTnYh0c5wYARcwuKExsmS8pdyUJZ+q6fi/IIYsfpq0TVY6Jc
	y7u1nsWDzBc6Y92X7V0njlVjLPsYK8ap1Q4ZR5jbY+XSGqTWdLMN7uX3M245SJWOhVuSjAqa8bY
	UlvdMG4kiN1WHogx2Ue3AzjBBzUL11hLiG/tVZnd7SZ6K74Z94Uc3ax/VFHktbED+X607SMT/Rg
	nSiytB1z/VOK30GgnLASMijkq32VuH3hRax72UujZr02fGeyvhmXISBjOGbBU0lGC0R/hL94/kD
	mwC8jLyfx4hB+gqBmXCr2yHqEMI9Si5lY2pLnbsO54eAUaIYIeCe541ctZgjtvmBYx4U0PcjXRy
	A2Fnh9wbtu8medgT8qShhqcoIi248WagFvZZSvqKc6IB3bdAbUrJiduQ1ZzRbVAVYzsZ+2LF6Sw
	AKj44K+XrTc1YEakzmDDX21mPAeC/8wqe1bEWmjxyXOLsR9BAZySDQqibIAoRusOE=
X-Received: by 2002:a05:7300:a146:b0:2be:7a4a:b3b5 with SMTP id 5a478bee46e88-2be8a275b7emr1704636eec.1.1773262228436;
        Wed, 11 Mar 2026 13:50:28 -0700 (PDT)
Received: from [192.168.1.100] ([2605:fb40:0:c09:323a:5679:3782:80b8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8a8550d5sm3905742eec.12.2026.03.11.13.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:50:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] docs: driver-api: usb: Document USBDEVFS_BULK return
 value and short reads
From: Brigham Campbell <me@brighamcampbell.com>
To: Malaya Kumar Rout <malayarout91@gmail.com>
Cc: linux-doc@vger.kernel.org, mrout@redhat.com, skhan@linuxfoundation.org, 
 me@brighamcampbell.com, Jonathan Corbet <corbet@lwn.net>, 
 Marneni PoornaChandu <poornachandumarneni@gmail.com>, 
 Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260305180753.114732-1-malayarout91@gmail.com>
References: <20260305180753.114732-1-malayarout91@gmail.com>
Date: Wed, 11 Mar 2026 14:50:21 -0600
Message-Id: <177326222145.334036.18303057781471564571.b4-review@brighamcampbell.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887;
 i=me@brighamcampbell.com; h=from:subject:message-id;
 bh=WJcW1lA0tu2eb7j4StbFQ+rLT76qulDtOkzOw26lp6k=;
 b=owGbwMvMwCUWLsWS0KCyxZPxtFoSQ+bGq5OfvOGdH++Xe8m2/4XkoVKXdxv3Jzyf3BW7Z+P1b
 UkvnhYYdZSyMIhxMciKKbKo3JqlfnGy9aODEfwTYOawMoEMYeDiFICJyL9mZLjrkviNmUUiRP8f
 c8hruSIDr4AGn55uGwmTyO7AOls2UUaG9b0/BMPd5yokLy17bX2HKY5J2nR9ur/j6w2LN7Yu2rK
 ODwA=
X-Developer-Key: i=me@brighamcampbell.com; a=openpgp;
 fpr=24DA9A27D1933BE2C1580F90571A04608024B449
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[brighamcampbell.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[brighamcampbell.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,linuxfoundation.org,brighamcampbell.com,lwn.net,gmail.com];
	TAGGED_FROM(0.00)[bounces-78899-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[brighamcampbell.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@brighamcampbell.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,brighamcampbell.com:dkim,brighamcampbell.com:email,brighamcampbell.com:mid]
X-Rspamd-Queue-Id: 7224B26A28F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 05 Mar 2026 23:37:50 +0530, Malaya Kumar Rout <malayarout91@gmail.com> wrote:
> Remove a longstanding FIXME comment in the USBDEVFS_BULK documentation
> by properly documenting the return value behavior. The ioctl returns the
> actual number of bytes transferred on success, which naturally handles
> short reads (where fewer bytes are read than requested) by returning a
> value less than the requested length.
> 
> This information was verified by examining the implementation in
> drivers/usb/core/devio.c:do_proc_bulk(), which returns the actual
> transfer length on success.

Good effort, Malaya! As far as I can tell, you've done a good job
formatting this patch and sending it out to the right people. You've
done a lot right with this patch. However, these changes aren't quite
suitable for inclusion upstream.

> ---
>  Documentation/driver-api/usb/usb.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
> index 7f2f41e80c1c..a01d72af479b 100644
> --- a/Documentation/driver-api/usb/usb.rst
> +++ b/Documentation/driver-api/usb/usb.rst
> @@ -539,6 +539,12 @@ USBDEVFS_BULK
>      kernels support requests up to about 128KBytes. *FIXME say how read
>      length is returned, and how short reads are handled.*.

You prepared this patch with intent to address this FIXME, but you
didn't remove the FIXME.

>  
> +    kernels support requests up to about 128KBytes. On success, the

This line directly duplicates information already in the previous
paragraph.

> +    ioctl returns the number of bytes actually transferred. Short reads
> +    are supported; if fewer bytes are received than requested, only the
> +    actual number of bytes received are copied to the buffer and that
> +    count is returned. On error, a negative error code is returned.

The FIXME says that documentation should "say how read length is
returned". Is it returned by overwriting the `len` member of the struct
that is passed in? Or is it returned via the integer return value of the
ioctl call itself? Your patch doesn't communicate _how_ read length is
returned.

> +
>  USBDEVFS_CLEAR_HALT
>      Clears endpoint halt (stall) and resets the endpoint toggle. This is
>      only meaningful for bulk or interrupt endpoints. The ioctl parameter

These small documentation fixes are a great way to get started with
kernel development, but they're also difficult to get right. This is
just a suggestion, but you may find more success checking out
`docs-next` and looking for documentation compilation warnings that need
to be addressed. Fix whatever issue is causing the warning and it will
go away. Those types of changes are easier for maintainers to verify for
correctness.

- Brigham

-- 
Brigham Campbell <me@brighamcampbell.com>

