Return-Path: <linux-doc+bounces-86921-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DrgKWM+AmrmpAEAu9opvQ
	(envelope-from <linux-doc+bounces-86921-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 22:38:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 587FA515F2C
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 22:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26F3D3073568
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 20:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B063C3A5459;
	Mon, 11 May 2026 20:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLcK/Or6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1A03A5428
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 20:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531702; cv=none; b=Hw6jNe9g9MtVrvBTFRa4UHE6sh72YMVLV40fHlhiIexLiOXiJMNpZ/0s7yTBl5h1LkqxeXHcN/Os6uTkpLD/v6CleBv0eBf020G4UVuV2MvwzdusQbDXL9b9viQy6tSzcNTBHSqs4uCoB/2TuZfIWnaQpB8hl2VPSYWX6LyrA0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531702; c=relaxed/simple;
	bh=tYRtTOy1sHxq4Rk5XvcIzIiOnuPKAFIZOrQMkYea6rw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLVm0Emfm4INQMVfy8wsZEncYyrUoiuX2b7+nXIjBbFTE5HUzN+VIqsICCvVsZNk+POESh0K0UGJ65LK6hQT0+S9sGaFZA1HhjHk2/lrVnz7tvU1M4Pu6cCoUqv6uenLRyA0tstQm5rbCWaemKM2Ftoyn78oNL7LXThhOgaCzzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLcK/Or6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso29046375e9.3
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778531698; x=1779136498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5xopMfEr6HUMHZClhAXHEE+h7URb7mb9soskalU1hg=;
        b=tLcK/Or6NZzRstHbLTu2se61PyVivEyWF9oYzxtyiDW9myOMgQ6YdfFN/3vNCFYCbb
         DW24naCKzLabB/Ng6jCZmSZ7Wb5DA1f532esE6hZr2wV6jmdLXw7VE3ARyR6cZYzeTR8
         hQSkr+m+hZ1V41OLQKRzBw3kpKdVxNiI7BzC7atUKswSEbWbd3cNhAXocmofsKw4gNtR
         zeW6MBGJIPvuyaW+gCaSEMpEQ8vny2MOfY+pL7rUYDLoYSeu7tN9XqaGiusyjN/+sumU
         R0IhdrMgju8QezpnwZzxkXodoHyqr291O1PriMemqMrJ1gHFwAcPE1IRYOANAh2455iY
         zCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531698; x=1779136498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5xopMfEr6HUMHZClhAXHEE+h7URb7mb9soskalU1hg=;
        b=BCe3AI3sSwPXY4X23cP5aT5nSmWcyXhLMklSMfLhGyhBsh91lCYNkQ8UY/kBR6CObi
         tBHPu9N4Hv5P0YEopWtqFCG4AkPLux3Xal/DcuemjElKx3jEapWe2kkvhUPoYrTuoE/M
         EH2t4JH6cBDK9hJ5bAPA0dcCZ8gRgEs83e+TJOl/xs+eBcntVQALf3uNHPP+WDYVl3SZ
         XXDBBvP3b66OWg9hUjQFLeuG9+3AqJa8UAFXHC4y40bFCnntMWFSWSEezMpgUuXLiNT0
         oVGqgPKExxrsxtuplhZGrd4pXIWHSqvuYq/aqkbRmjDddX8PFz8hGpoXlAlTNOWgSr+h
         EH0A==
X-Forwarded-Encrypted: i=1; AFNElJ8V4Mm49wmnGy6wo8WpoeNsxN7HdGCcos1xeupCMUIrFAm8Gzp6voPuucoDsy3xAIDLn5k/zHMnb20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuUNC0hH5qe+QC73X6K8GkohGeXbJ2dSePbbXwxr7dI/qYr0Rl
	c8FZ++hblIH5353cALo62+U4RVGuedkQ95k9pwAWXJAZq2nr11qLg7Gu
X-Gm-Gg: Acq92OGJMRT4Exf45cBVcs2w8K2alD3T5imqOggneWYjLEIjB1GBggN5jj5w2NQeKcu
	K7R8xRm8rFPP8NahzrlOAj/vBMF+8S/LZFZyJZkllxLxXKXGh85mpI/KZUO0T6cdvkKTkcq0PQp
	XjnTeUqO5hnvnf84NA+Roeq4Eh2YZzdG3FP3QrckbngY15Szkxd6fZ6NcqGGFRKwLLZz91lPBBx
	Oi5TTAV3NFN2V4+7FMM2CADB/z2tF3aRw9l7zy6R6pmNcIBIk9D6Z6OOCIF+6QhDGwihIt/Ab/X
	1N2zyt3etzQFd+JGv89o6NvbCKx2HGTHeSOswiMOy1YfIfQq6kaeGhmJZRxKrN8szgUMB0oZYc6
	LnSok9MpsaFgNviY+xqLpelsR7TdApEFDEYwyIH2SwXiStkdJ4saOFNgaoMhaPvxP4aBlQOLREg
	936CFSzpQmwJZPce5rgVhgEP0pTsnzjlsln/SmglP2r8KFOBoQhu6Q37fwrss6
X-Received: by 2002:a05:600c:8594:b0:48a:52ce:a4b1 with SMTP id 5b1f17b1804b1-48e676a4e1fmr185836335e9.15.1778531697513;
        Mon, 11 May 2026 13:34:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e62944bsm3582235e9.8.2026.05.11.13.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:34:56 -0700 (PDT)
Date: Mon, 11 May 2026 21:34:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Manuel Ebner
 <manuelebner@mailbox.org>, andy.shevchenko@gmail.com, apw@canonical.com,
 corbet@lwn.net, dwaipayanray1@gmail.com, joe@perches.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH 1/2] [PATCH 1/2] Doc: deprecated.rst: add strlcat()
Message-ID: <20260511213454.22f00bff@pumpkin>
In-Reply-To: <202605111206.ECA86141@keescook>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
	<20260510165159.57457-2-manuelebner@mailbox.org>
	<CAMuHMdWchXXcMyShiMZrhFTrHoB-TcKQEBcRoCTJFpwJsxxdhg@mail.gmail.com>
	<20260511142649.463c3ea5@pumpkin>
	<202605111206.ECA86141@keescook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 587FA515F2C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:query timed out,mailbox.org:query timed out,linux-m68k.org:query timed out];
	FREEMAIL_CC(0.00)[linux-m68k.org,mailbox.org,gmail.com,canonical.com,lwn.net,perches.com,vger.kernel.org,linuxfoundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86921-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[linux-m68k.org:query timed out,mailbox.org:query timed out];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[linux-m68k.org:query timed out,mailbox.org:query timed out];
	RSPAMD_EMAILBL_FAIL(0.00)[kees.kernel.org:query timed out,manuelebner.mailbox.org:query timed out,geert.linux-m68k.org:query timed out];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[mailbox.org:query timed out,linux-m68k.org:query timed out];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	RCVD_COUNT_FIVE(0.00)[5];
	MSBL_EBL_FAIL(0.00)[kees@kernel.org:query timed out,manuelebner@mailbox.org:query timed out,geert@linux-m68k.org:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_FAIL(0.00)[linux-m68k.org:query timed out,mailbox.org:query timed out,sea.lore.kernel.org:query timed out];
	DMARC_DNSFAIL(0.00)[gmail.com : query timed out];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_VIRUSFREE_UNKNOWN_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	BLOCKLISTDE_FAIL(0.00)[82.69.66.36:query timed out,209.85.128.41:query timed out,100.90.174.1:query timed out,2600:3c0a:e001:db::12fc:5321:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	SURBL_MULTI_FAIL(0.00)[linux-m68k.org:query timed out,mailbox.org:query timed out,sea.lore.kernel.org:query timed out]
X-Rspamd-Action: no action

On Mon, 11 May 2026 12:07:38 -0700
Kees Cook <kees@kernel.org> wrote:

> On Mon, May 11, 2026 at 02:26:49PM +0100, David Laight wrote:
> > On Mon, 11 May 2026 13:40:55 +0200
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >   
> > > Hi Manuel,
> > > 
> > > On Sun, 10 May 2026 at 18:52, Manuel Ebner <manuelebner@mailbox.org> wrote:  
> > > > add strlcat and alternatives    
> > > 
> > > Thanks for your patch!
> > >   
> > > > --- a/Documentation/process/deprecated.rst
> > > > +++ b/Documentation/process/deprecated.rst
> > > > @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
> > > >  though care must be given to any cases where the return value of strlcpy()
> > > >  is used, since strscpy() will return negative errno values when it truncates.
> > > >
> > > > +strlcat()
> > > > +---------
> > > > +strlcat() must re-scan the destination string from the beginning on each
> > > > +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
> > > > +snprintf() and scnprintf()    
> > > 
> > > The last two not only require the caller to keep track of the offset
> > > in the buffer, but also using "%s" when storing passed strings.  
> > 
> > Which also means they are significantly slower.
> > Mind you, some code has:
> > 	strlcat(buf, "\n", SIZE);
> > 	return strlen(buf);
> > which carefully scans the string twice.
> > Since the '\0' isn't always needed (eg 'show' functions), this can be:
> > 	len = strlen(buf);
> > 	buf[len] ='\n';
> > 	return len + 1;
> > Of course, the code could often easily get the length by other means.  
> 
> I think I'd prefer to only recommend using seq_buf API. Or for sysfs,
> sysfs_emit() as seq_buf hasn't been extended there yet.

True for the docs, but rather more work when you are just trying to
get rid of strcpy() and strcat() calls.
It can be hard working out whether you can use sysfs_emit() or not.
(And I recently failed to find where the PAGE_SIZE buffer is
actually allocated; I'm sure it should just be 4k.)

-- David

> 
> -Kees
> 


