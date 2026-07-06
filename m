Return-Path: <linux-doc+bounces-95141-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gti6Dz27S2prZQEAu9opvQ
	(envelope-from <linux-doc+bounces-95141-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 16:27:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0D7711F45
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 16:27:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nXQOxf9g;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95141-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95141-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A153F300AD6F
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 13:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E9A29A32D;
	Mon,  6 Jul 2026 13:52:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A1B233955
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 13:52:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345937; cv=none; b=aWWOsQjKhoUmPf/RJj7/lyHt4VjBO6+Eg2rKA5LT71vvcK0ZuNqCRYA8p7593rJLj9gqUBnM/pE0QNtCkVTbzZxb5W/FX9bacRNV+LAweR82mHbn4QuFMl8pSmMbidECQl5msmH2fYcexk4OYej0MO9Z+bVmbZUrzQo8bpNMbq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345937; c=relaxed/simple;
	bh=LuVFvH30snQ5nukPCTSqXmOHD+U48U3n8WKf7I9zbD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5H//qR7zToJp7T8pZcOWd/0YezN3icWEPxQa0qr9JgHr8zO0cVg3qeqIHo/7xhY3qwfY/8QSR9+GTzw9RSLkZ2PE+X8IdkrLF5RuNTCxMGPF3dL1jTiYeIhls83kFfEbVhtFMUxORUYNYrk1naVQ2ttL7AlrGxS9Tre6rDZ3nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXQOxf9g; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caea3f742bso41124965ad.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783345935; x=1783950735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fodGbpSxRQEsm3dd0pVr1IQBHu2WY5ik1uhhAyC3m+E=;
        b=nXQOxf9gE7l4IEwUzc9Tx5cbCdrZqT78k/YT9VvMacwaDes20ip+P69XmKQ+qAS8RU
         g7iEP/lOKscfG7GG+97Wn0mc5T/TRKZCYnwyyTwuu1vxT2o+cQGQqDW4/oywERuFmeZn
         eSbAimKANmK26lwiehnSmClnPaRCr706Q8X+ujJEP39SYyHj+EJO3DMNGhKlqgFXcxqk
         u+Hgiw8rT3Hy5RU3TvHTDjE5yVPwqs7NdnmJp1O2w8xpPR2iVqh+xzEdSDP+amyiTMB/
         jg+4RLVG4M6fcW11Oap3YZL/pMjMP1df1k4WCpNinOlYisKSBm+cs0mCXOUYRcOTLF7J
         Q+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345935; x=1783950735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fodGbpSxRQEsm3dd0pVr1IQBHu2WY5ik1uhhAyC3m+E=;
        b=fwsOc2rJAgMZ4YpK/y9PpGvP7IyBeBIDw3iooWH4tYhTNyfNpOfSqQHRP1+MiDqfYv
         SItfRlZQ8m6cxt2HSlcaneqsSDZbs73gjhgSU2RnhyHGH2xDC9ASFx3k+zM1pESIsGoj
         ABKP6SNO+jMGfUcGJ6dYMLsBueewbTGyxlgQiZivAYKKSquCK1I3+pMr1mRet0thVcqr
         gluXIf1YHYvvj7V9h21p4djAqtUjXmEdTc1gWr3SgqLJN7pXB/Ho12F97FMNcAtCtfj/
         pv1tuf5Egj5UqJQa6j/VH2Ku4HYp3LDcgR5CYjKsPMgQwiBbbJbbDDTSnXoomOt7R2WB
         UnDg==
X-Forwarded-Encrypted: i=1; AHgh+RpMR0dtP5XozBYN662g65kme02HhfpQUclQG8Dxuz8aehbRJz7rq2sK3T1+QsApblOcWfUaDYw7tN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAsOjFVk0dM7nNf9Y0T+XTwmiu1KpSHJD6dMRbsNrg5a//19Tu
	IiAQGCm8DqAlSx4JEjkiwgkuEx+O3agvMt4Xw/vJuKKUz/V8JzkW7arN
X-Gm-Gg: AfdE7cnh0blUzIEEzwUuLten/rL5mZzZo9CQxoJZCBKgqHAyRetMVcmlN+k+1aDmcf9
	A1G2I8BgN03T+W1YuamtBGXFQaQjC20Hsf/pGXc43Y2acatW+xm4th874ctJzu+V6KuyM5PeSO3
	FmzAhWLv0/5olAMeumMdMYTS+uxannoV6nm5w4ljMD0uv3N8psfK2KK5bNGQ3WQNG6AcbA99CLj
	uKhjpCa5v07Ni+cbTxPK4+Sd6ZH1n0bh1qW+Mp1HoKg4o+i3PYBhb9gxBEbJ7E9XmIRBOEurYpO
	nQ6RGwycU8PKN8JnF+YC9bb7f73YCAr+TG1Z7SOgeq82u/3wdffGA/WBYEHOuCk5S86dxRYKYyX
	6vmBixeqzVEFh05TI2+9jVr/5of8qbYWIEJKgZsz2OYIPH/HFIe/YxcdsC/qdP/Ibfof8QmCn9/
	9pjtRXSZpJWbMfD+GhojDkKnjEOA==
X-Received: by 2002:a17:902:d548:b0:2ca:d658:d874 with SMTP id d9443c01a7336-2ccbf010aaemr5945915ad.23.1783345935549;
        Mon, 06 Jul 2026 06:52:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7765773sm52115055ad.40.2026.07.06.06.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:52:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Jul 2026 06:52:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Florian Schut <mail@florianschut.nl>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG Maximus Z790 Hero
Message-ID: <79669e80-d2bd-43d3-a119-1246aa946712@roeck-us.net>
References: <20260705113125.812045-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705113125.812045-1-eugene.shalygin@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95141-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:mail@florianschut.nl,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[roeck-us.net];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,florianschut.nl:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F0D7711F45

On Sun, Jul 05, 2026 at 01:31:15PM +0200, Eugene Shalygin wrote:
> From: Florian Schut <mail@florianschut.nl>
> 
> Add support for ROG Maximus Z790 Hero.
> 
> Signed-off-by: Florian Schut <mail@florianschut.nl>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
> ---

Applied.

Thanks,
Guenter

