Return-Path: <linux-doc+bounces-93381-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c4IaKjbjO2puewgAu9opvQ
	(envelope-from <linux-doc+bounces-93381-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 16:01:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2D76BEE7C
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 16:01:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rowland.harvard.edu header.s=google header.b=KstfDJkD;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93381-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93381-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rowland.harvard.edu;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B01E301586A
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 14:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9153B8BA1;
	Wed, 24 Jun 2026 14:01:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CFC2EC09F
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 14:01:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309673; cv=none; b=pfOMq3Sr0sLLOEWGZj45sGcKUZAZJHwra8jNkCaMt03dfNiP5Cts6fg+vhNp3nAGVymsF0+95z/8JD8B8FDLDN51G8ioSIAU9JP1ER+/8Ll5awbQtQYjgV4VDqLASVZlQxYGok8upiactgb5pjhd4iirmFK8eVBteiv/SKZ6M/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309673; c=relaxed/simple;
	bh=sqz/nCl4XMoZ5TKKVVNz5tAI/LScRoJeM9WbyPmJx3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBWX/PWsN5XK3JqiTh5ZIbWeBRhjES7ciRiD82fHCWV7QbD9+nGT8XFFErGJ2qlWxcor8fc3o1L3HliZoZU7dTj82QLnfvh+Uq2aFl2q8mJ23h8ZBXMyK7ECS+t+tXGcKGTh3B6V0Zz3eAP9+WLpSkNHYItEuVgf6yJDMSPSd2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KstfDJkD; arc=none smtp.client-ip=209.85.222.170
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-920f33347f5so81993085a.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782309671; x=1782914471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wsEoW4DBoKT0fUYLZPdL7MZJTkz7+GAlNaoQ4msQnkg=;
        b=KstfDJkDlEZuT1HYy2wLN0zzVO7os9Mav9CMPrsd7Kv98rDcLUS7Wg5ukVEMLr3LVG
         wrMAP69DjNNNzDVB2ZNOfiTOc1hFWk6LOgZdLKLlC+joHQiuqFZ40e7hNzcPh9oWhGY/
         2G/O2HjDTmBS9oRGG1S37xQaTYUM3wBJHlcPNdyjlvsE1IDgBr7ovk0ZlAyLMvD5K4F2
         s+LsOd3mFqtYmxhVb2PFHtvW7RF7jgiJBAVwWIQuzP65aYXobwjDznATwWFVkYABsJXZ
         LVH9wW2TsSZf+p2SWTS7/3e2nLXqldUfpW6QUJzVbbrD9x+kGVzbxfNNIV+4CBNNqAON
         puzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309671; x=1782914471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsEoW4DBoKT0fUYLZPdL7MZJTkz7+GAlNaoQ4msQnkg=;
        b=dL65NHWUfgyVsLdXpNKVkGMniwkGyzre65SG9gLFF4QTM5qqDmJKAvXE6YRUnP93BI
         CdH95NGikNhwZliAUGYPaeV5khq0ks+3BlP0MUWRzizmq9JowGEjd/UVeX9FZBMye2m8
         NhHYeskxkUqbDrRPhaVDMqcRqRr+ijZ1swKrwsGV6R3ye9HwC0OYEkJJAR63l5vpfhos
         qBWKZSss0QemMq2EzEhNdzICHELJDRy/ubvJ8TLS+qL0lh0Nj6TZlg9zH+Dsv4/mMhnY
         blk93yDjP3UmV7+QGdl8OgRsIBwwLIVk7qhoRxEMgNbFxrqEUvgraSD4E/SIKjOd+kyS
         BxFg==
X-Forwarded-Encrypted: i=1; AFNElJ+8cjeVryMJY32ca+nOr1BXnZSEmPzEI7z9yLC/8ILvgoDxfgzwpIioLf8ioxLW1Z4BeJ1SEF/eN3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFTHEkuFOJCJ3TvmBEqNv7L0egEB6uSuuZXIsxyiNYyvqaglAU
	m9ctQvCLRtUSDg5tIDeyw9VjaFDuqBthBCfGFrnOLGAvJHKKhNZLJsFf9rvOadk4wA==
X-Gm-Gg: AfdE7cmMCw3q7+29Dc0ozNv9tAbKzmxHNke14Fs3UEM5b1RFkM7xjXDQ1uHuXX1uRWv
	zjW1O3yK8EfRA7tpujTUwAZHhtsoWsUaNnTWuDV3lwR13g6rY/CxDa1j83C2/Bla0BkKBek0bCg
	gkHaJ8dRdCKOsaY3w3TvZUGWS+TqjAq2mkReyqPtwUiSZQY+PZOUaZYrNYRRu9SE4A0QplvNZO1
	Bpqb9wE3FXiZE6XL+VKzaMD5pywORJ8dk8TQICDLxuqtTwqznBfysHZT5JJcwd9TSSBuuSuPPXr
	pNLgHuVklAkT2B7Ddgc28pMO++mWFKir1xpm01/VJTHa43TpqpHv8NIgmLlKXt265cShzNP6Ibv
	SznTUM90nE1/Jxq0CJuqwxVG3xIb11bsl/Neht/CcBcLKSBx6wbEbE8eGLJO1iewI5OVbObkWfz
	MMYuonfRWuaS3me4+YaWOpxfYpTEKYg64Z
X-Received: by 2002:a05:620a:1a09:b0:915:cb5c:7f70 with SMTP id af79cd13be357-927800a2787mr561454085a.29.1782309641938;
        Wed, 24 Jun 2026 07:00:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92600c7bf55sm552191785a.46.2026.06.24.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:00:41 -0700 (PDT)
Date: Wed, 24 Jun 2026 10:00:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93381-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,gmail.com,lwn.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nikhilsolanke5@gmail.com,m:linux-usb@vger.kernel.org,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:michal.pecio@gmail.com,m:stable@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:michalpecio@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stern@rowland.harvard.edu,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	RSPAMD_EMAILBL_FAIL(0.00)[stern@rowland.harvard.edu:query timed out,linux-doc@vger.kernel.org:query timed out];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,rowland.harvard.edu:dkim,rowland.harvard.edu:mid,rowland.harvard.edu:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F2D76BEE7C

On Wed, Jun 24, 2026 at 01:36:28PM +0530, Nikhil Solanke wrote:
> > Actually, the best approach here would be to put this single change into
> > a separate patch that comes before the current one.  That removes issues
> > of making more than one functional change in one patch and improves
> > bisectability.
> 
> Before? Shouldn't it be after my changes? That would make it easier to
> justify the changes. And just to be sure, you did mention it does
> align with what the intention of USB_QUIRK_DELAY_INIT, but it does
> change its behavior when the quirk is not set. Atleast from what I
> understood from the documentation and an LLM's summary, the device
> needs time to prepare the full configuration set. So, does delaying
> before the first header read really work? I can't test this since I
> don't have a device that requires the quirk to be set.
> 
> I personally think adding a condition to check if the quirk is set and
> then delaying before sending the first request would be appropriate.
> What are your opinions on this.

Well, put it this way: If you change the existing behavior, that change 
belongs in a separate patch.  If you want to redo this patch so that it 
doesn't change anything when the quirk flag isn't set, that's fine.

> Also is it fine if the string lines exceed 100 columns?

In lines containing long strings, it's okay for the string to extend 
well beyond 80 columns.  But then you should break the line at some 
point closely following the end of the string.  I'm sure you can find 
examples of this if you look through some of the other source files.

> Also, is there a need to check for krealloc()'s return value? Since we
> are only shrinking the buffer, there won't be any moves or completely
> new blocks (at least as per my understanding). Do I still need to
> check its return value for completeness' sake?

It's a little tricky to track this down, but if you look in 
include/linux/slab.h you'll see that krealloc() is defined as 
krealloc_node(), which is defined as krealloc_node_align(), which is 
defined as krealloc_node_align_noprof(), which is declared with 
__must_check.  So yes, you need to check the return value from 
krealloc().

Of course, you could simply try not checking the return value and seeing 
if that provokes a warning or error from the compiler.

Alan Stern

