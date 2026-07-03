Return-Path: <linux-doc+bounces-94885-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1rN5H/nwR2qghwAAu9opvQ
	(envelope-from <linux-doc+bounces-94885-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 19:27:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C79BB704A52
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 19:27:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=dqm9N3E4;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94885-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94885-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F0503007CAB
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 17:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007172EEE86;
	Fri,  3 Jul 2026 17:26:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63CF2BDC2F
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 17:26:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783099582; cv=none; b=l6eMJySTJKV6YK8WqZWdXIeiLrHDXrsSfJZUX/gcSXOPpaLP0ve5D/c/RHDV3lQsBb93ju64zefKQ++b9tZf05huCC+oT/Wamq1zzaZcPpiUGe2xFPAVAChF+z0C345Utwryoo4m6BtnU5FE4O4FTYE9Txp1mM2IKi5k5eUQBtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783099582; c=relaxed/simple;
	bh=kmlEfEMENf5B5OQEKeJVfJ9bqjpmPI836N1QuotGv50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxpYBc3uA31AM2pK/QjCgidn3seKetGSxmRLdRq9XSza9HNJ1N1oGfBAZ5RD9LBo/gCba7D8ZGgQnIwYrn85bGXxabm2frDnjhv3mWpvtSj7hQ/09F6jMzh+cd38HPPg6pE5HoQP/FRqNInjvORfrDMYf4ws3NtSAPn9bC+58ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dqm9N3E4; arc=none smtp.client-ip=209.85.160.173
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51bfad59921so5380981cf.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783099581; x=1783704381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zrRsjM5o4NMj7VanY+1CWD4IDpNUJIwLPKO0n4Piuc0=;
        b=dqm9N3E4DlwHUPJIvQZa6PcCZqi/kq0K+SjZLm1Bs7LU4fJLaNMIj4f6CMvIoJ3NK3
         JleBZMwifBL2UvwTrgAmKxYiV2nR2Ii07Fsuut/Way8fCAu4+QUsJH5I1vONBoqehMuo
         S7LoL8mjYEbvqtz/IrquqcPPYFdCkopHI/e5DTxQkUO6GwHcH7jBh2jQ095FfaDQQspA
         xpiWMwKJRgAHjxoxbPWCdR9WhdzNakiADBUDEE5qaUjII6lZcCKcVwhCrPNaezIy+3S5
         Mqq55qQ33GpzrvPRy5VCPTRZcLnJ6vzyj3E2QNnga8mxFajXSM2JwxBttQVyBY630JLF
         TZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783099581; x=1783704381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrRsjM5o4NMj7VanY+1CWD4IDpNUJIwLPKO0n4Piuc0=;
        b=e4ipbBNl/xcTj5Pc4arhscEBdhhsdEwglTR5yZ7h47cOnUOKKnqzZ/C1RSoblkFZyh
         rwf7JmTUTJMaR695XIbJNihWaazE4bRTI+4Ugoz8nvm3eqMYU8rs3o9IVQQ45rtdM6qn
         utzsVVHEFT1oM+Lcz1fBqvbPjF4zkU3j579JEtPKUoLaD5CEBG+G8Q/QSIajOMraibCr
         RfEOVs3X82pyyD+Ci8rKBtutLro2ecSpSsEM3A1D5iO5HsJ0lEGC1fOSX+vzpaWk1R+r
         KclVsWO4KQeJRKPjFZVTqGLT6eUGIJvhfLAKBTSdYDRzoQYeBWfsiw0eo94eaxSg19AW
         dXmw==
X-Forwarded-Encrypted: i=1; AFNElJ/BLK3/AFLcJN6Wcm2b+GaX61jM9ovbVxE0+MSdtnS+C0auRX90RNHqK83oqFErfdNkSWTW48Pz55E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDdGqJOOA7m+y1XfEuMy9M/Sdxw/SCj16QLNPm7zRyunYeSxTd
	WRtIVU1p+ojbpM4d3IFgL+pAotoJb5FpzRi3y0bE5rIOg1UniTQTFyH8A/CgSWV4DZY=
X-Gm-Gg: AfdE7ckK6zDhwDqh2iX2JpM7l0/tWg1/xa18jZUXEiGB++Ts4bmwIMmdTdsBTpP/EcP
	c56t8+m8kDNsmPXX116bvGIIwzILNmN7RvvCGB7dZwnwdsoPP99ZkfjIHS0fOOMgyQM1RhC/qN6
	nhZyU4Iu+a3/8WqE7ftOCGVVxPvTUkyg/DxK/cqMBcnIz0tKHJBuyjz3z+mHfo+PXWQYXlMvWWd
	oYKTC7xMcAjGDWbugua2s5wuoYb30nLy+v3ZHWGgvpBSy0rKNBS+EjWPEQhqwMiGj/0Mq/Cn0b8
	fDpUkkCjbn6BeJU256Ihf2unIqod9bPoOyEJ5VeaVUbKRnkaWb3Q65GaWTNvAJIbTq8RGnRxwFB
	ysuKohWGhDlVKZ2aMz6hueihes1milNvLu2aZmaBdwrK3Mq08sOb06DXtCBh2gJpsaA8kbEqw2e
	rOLfcEvw==
X-Received: by 2002:a05:622a:408d:b0:51a:8c9c:7f3b with SMTP id d75a77b69052e-51c4c32b7cdmr6511121cf.62.1783099580664;
        Fri, 03 Jul 2026 10:26:20 -0700 (PDT)
Received: from fedora ([2607:fb91:1408:4b9b:69b2:bc92:5299:1677])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2d688sm21828511cf.17.2026.07.03.10.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:26:20 -0700 (PDT)
Date: Fri, 3 Jul 2026 13:26:17 -0400
From: Gregory Price <gourry@gourry.net>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kernel-team@meta.com, corbet@lwn.net, skhan@linuxfoundation.org,
	peterz@infradead.org, luto@kernel.org, akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com, pmladek@suse.com, mhiramat@kernel.org,
	marc.herbert@linux.intel.com, joel.granados@kernel.org,
	lirongqing@baidu.com, kees@kernel.org, nathan@kernel.org,
	linusw@kernel.org, arnd@arndb.de, deller@gmx.de,
	jpoimboe@kernel.org, ruanjinjie@huawei.com,
	lukas.bulwahn@redhat.com, ryan.roberts@arm.com, ojeda@kernel.org
Subject: Re: [PATCH 2/2] kernel/entry: add kernel.syscall_user_dispatch sysctl
Message-ID: <akfwuanT7Ot3KD6R@fedora>
References: <20260627205551.769684-1-gourry@gourry.net>
 <20260627205551.769684-2-gourry@gourry.net>
 <877bncm5y7.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bncm5y7.ffs@fw13>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kernel-team@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:luto@kernel.org,m:akpm@linux-foundation.org,m:feng.tang@linux.alibaba.com,m:pmladek@suse.com,m:mhiramat@kernel.org,m:marc.herbert@linux.intel.com,m:joel.granados@kernel.org,m:lirongqing@baidu.com,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:arnd@arndb.de,m:deller@gmx.de,m:jpoimboe@kernel.org,m:ruanjinjie@huawei.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:ojeda@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[gourry.net];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-94885-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,meta.com,lwn.net,linuxfoundation.org,infradead.org,kernel.org,linux-foundation.org,linux.alibaba.com,suse.com,linux.intel.com,baidu.com,arndb.de,gmx.de,huawei.com,redhat.com,arm.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gourry.net:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gourry.net:from_mime,gourry.net:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C79BB704A52

> > +	/* Arming can be denied at runtime via sysctl, disarming is allowed */
> > +	if (mode != PR_SYS_DISPATCH_OFF && !syscall_user_dispatch_allowed)
> > +		return -EPERM;
> 
> That might be similar to other sysctls, but if an application had it
> enabled prior to the sysctl=off toggle, then that application will
> suddenly fail in operation if it requires to move the dispatch window.
>

If the admin is turning it off globally, is that not exactly what the
admin wants?  The alternative is a hard disable that will simply result
in undefined behavior (windows syscall ABI being interpreted at a linux
syscall) instead of failing gracefully on the re-arm.

This seemed like the better option.

~Gregory

