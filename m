Return-Path: <linux-doc+bounces-90622-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KYfqCayWH2oIngAAu9opvQ
	(envelope-from <linux-doc+bounces-90622-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 04:51:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5A633B75
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 04:51:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=soleen.com header.s=google header.b=BekMhPG4;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90622-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-90622-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=soleen.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF4BF301ABB4
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 02:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5763DC4C2;
	Wed,  3 Jun 2026 02:50:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106D7191F98
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 02:50:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780455056; cv=none; b=be4lyXoFAVC+srpxz0vW6ExkaAtrMZA97epW7p/m/i8EoxiGJpNvxvOSbsuHeGIeG7zD0/MEIZC9tYXFZRYDqa81QggKUCZZ1L1GaZ/VFMPJLrwTvGLOYJcN3tHbbWzSjbxYehxwlO+LDCXrHigwK22xw/vWZfcugZidJdrfRww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780455056; c=relaxed/simple;
	bh=/lKDtjkKjBs6HqkS7udgXk7D2PKTG1I+ML9mw9quBvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thPOcMLpJk0gd0D9wP4cgHjVY9FUqE/Q25sVxdVjzDfGpkyNEkmKqz5Rbvmorr63RNhxtIfibs5HuyCQ33XghRHrmw7mc+1RIU7pcXTeunKGW762LyxHqzV9Rusx8Hnsu0odzhkVyVZS0ZQlttUF4pWdSJ+jmuakNo9uXHwBLpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=BekMhPG4; arc=none smtp.client-ip=209.85.222.176
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9155183b42cso30689785a.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 19:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780455054; x=1781059854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IZPLWBHqvJvl4gIvSvnZxXOnDR854hRgX/CoDKx5XU=;
        b=BekMhPG47KLgwngYDfFuHmwGHjiW3rWcjKhcQe9daFipH3F2vqXL0Fxb4UMAhr9PmD
         tEVfzWwxchtYRUY9bO0VIS/sDYJoZWYduygZTyy0q4OFyIV7hChd1eUvo8C/d3PTfklN
         sNqFjj/fWvFHiLS8Ct6O7lmBk0tZr+/Q2b04FP5CbuGbkVmjgPmvgGdcmrFHKnqisnd8
         NfE+PWOzNbrOS7R65ybi4QAjwWPgOysBoN/G85+x+dXqgYcrzZ1GbqzcbdwIOcsmWbI6
         ftnRkoDJnI78yjKmO1aJVSo9qZZkIM8yNihFpShce6+6/hFLVahJIeSB2xrrD92c79TN
         zj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455054; x=1781059854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IZPLWBHqvJvl4gIvSvnZxXOnDR854hRgX/CoDKx5XU=;
        b=G8aPqEA0Tiz3ThwQUFdskB9vjZTpRVbVq0maI7REWIzcXgOECuayHqmRBJCk2XM9Ro
         XHwQkC0k07u7ms3ivH9Q7sxuyV8CFTZ369xrx2qDMRXSPn0iMY2iLal0fMxam4f5l43u
         1UqocvFk0I4+3bTntpO6GezN6+DPnHVT1I3x0orhNQhTX+e5jZqQ7BBhmzOlAyMXOsmv
         8/HZJfFiuIFWPmtIBNHLRwJMx5hVgwl3XCrGO/PYuUExK5lVZj5iNty6VveGXejB4iHo
         YL4EQuTJsRxrA04Uc+zKlsRe7oqAO0cmN5sI0B2UZhQHih3zWXYnA0cA6CFR/P8bjbwM
         tzfA==
X-Forwarded-Encrypted: i=1; AFNElJ86NAiLIWFjrCoEUpozAJ7/HRUKVX6OzZAAOG5pat4ADD71aRhsEXE5ZA3wezmGPpBPsP3Iq4gqDro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya+Yv1iSemmJM5yL0XPJ9EYGlaSMiVQPAnQQKXGoDDHjwFnm/P
	myMb3OJrNmnOgy9WVwoYMwGthL/qAh0abH69rnBkHwWJWibI6rWKPauhkaUEMi6FwiI=
X-Gm-Gg: Acq92OGGgOAa4+OPjUm0QbMjphWoVEchO84fgepcGOVPcGFI2vOdFTy5SKBrszMUP/6
	9NW2bX2w2K0zAUt9mqwXlUSIGnSR04PuCacBC526dKFTUmuxGHwqaC+TyCpap/tKjiNXaNALSe3
	3vILgVWqBAss67uO/sWLwEs04vlFQeiijTKES3Cv95j8EHjdNv6ZtmIQx119aDqqvHVV8u2AcUg
	AJ/oZo0qAcf6KGJnVSNyJlv1iqUZx4nsQ5zGENu9kEut1X7kUuiE9gNnq4tmul2F1Yqsd2HzPq3
	DRi2MSTiZl6BqdV9doa97v/P/EcieJFU9TPtzzG/BgYvwfMZZlUOXaqjcKYLdDz5HvRE2ovjHt5
	AK/0MaXZ1ApLjix99x8WQwctn3EAuHRUrZj0PEbuxqiF4iUf1fSIXB6ryBicq4vwhvJkqjgNL2W
	NsFZ/A9Z8f5X7evmyw8WY8fSXXq6Zppbl/JKdZwTelEYcuXmDgGfqn0LpBhHgnlA==
X-Received: by 2002:a05:620a:a2c5:20b0:915:8f64:6056 with SMTP id af79cd13be357-9158f646703mr47560885a.16.1780455054088;
        Tue, 02 Jun 2026 19:50:54 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fc7dsm8925566d6.5.2026.06.02.19.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:50:53 -0700 (PDT)
Date: Wed, 3 Jun 2026 02:50:52 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 08/13] liveupdate: defer session block allocation and
 PA setting
Message-ID: <ah-Vp6xKSPWkuCyR@plex>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-9-pasha.tatashin@soleen.com>
 <178038801492.119771.3419366349068848854.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178038801492.119771.3419366349068848854.b4-review@b4>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[soleen.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[soleen.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90622-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:linux-kselftest@vger.kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:dmatlack@google.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:skhawaja@google.com,m:graf@amazon.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[soleen.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,plex:mid,soleen.com:dkim,soleen.com:from_mime,soleen.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CC5A633B75

On 06-02 11:13, Mike Rapoport wrote:
> On Sat, 30 May 2026 22:19:33 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > Currently, luo_session_setup_outgoing() allocates the session block and
> 
> "liveupdate: defer session block allocation and PA setting"
> 
> PA as "Public Assistance"? ;-)
> 
> Let's spell it out.

Done

> 
> -- 
> Sincerely yours,
> Mike.
> 

