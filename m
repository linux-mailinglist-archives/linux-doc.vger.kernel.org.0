Return-Path: <linux-doc+bounces-92894-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WsrKGzjzNGrMkwYAu9opvQ
	(envelope-from <linux-doc+bounces-92894-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 09:43:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F30166A4683
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 09:43:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JTzJfeNP;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92894-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92894-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6408A3018D67
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 07:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB836356749;
	Fri, 19 Jun 2026 07:43:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72155330B11
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 07:43:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855028; cv=none; b=MAE+i3TbK0pHSaiMO5iKoAN+YaRfrcg2ZncDWFeAn3EpXfgO4ZdMX+Hc9cDmehgrV/0d2weO/0UjsBYnTrMsyxUYOJjk/at4usizdU/Ar0crK1vVD3DM3y21sdolLonxkO178qAJ/Wx86r6a8S2TuOAruu32KzmCgEW//v50pBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855028; c=relaxed/simple;
	bh=JtwQD+WieKqcogcMHWpjbsbEMyUOZdEqFz8nYzUh7VM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jT3iLmiQVZ09qoB/fACtizotVyjFQAHuCIxjW4aWlxFXxDjq2OGbYKOEX3iTzg1Hb3TGJPzfJpEG18/vEGaemBFobQa0Pj2Ec/i5bHlPe65+bL15eEcmONM+ZSrq1U+F/8EHxiGtNcVF2TQMVtaR+nc+zvrf/rKJVQnO6H3D+j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTzJfeNP; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c40397e746so11775965ad.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 00:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855027; x=1782459827; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/CJyPY47191DNK2I5FV8tH3A2JiB8r3XI4Ww1d0nJQE=;
        b=JTzJfeNP86y6ShPISQBwgECqNb1la4It+H6oAl+3bd1wGP49meeHZ+TC6oxa5qm+X8
         V1aq/HwgTYREZSz1AOuIcytOOOy312PdW5/TqO5idUgQwS0pZS3tiBV1EOUebVzmRO2N
         seHwxCGj11oXzS9XRcYGO3O3NwTUbPqr3/g9j5Bugwzxd2lBPNpTBfrUHOKxrP4zU+wn
         0pK1hcawnEKUecYiQWN55hOun8u3/h4HgrMHJV6KhCojXOyRrFDif3zPG0D22RmWhRi0
         LP61/H8d1+3ueVlFGt/Z4lvmRC25UzhrutfOgmpOMSKZQSUM1SrSg86ayYKKvDdooE1P
         uLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855027; x=1782459827;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CJyPY47191DNK2I5FV8tH3A2JiB8r3XI4Ww1d0nJQE=;
        b=U0rgjiCmXkbxPvsWs2obTiC4kHOQ4q2zEuswcQHi3MzpV4uah8MsRPbwKCXNz9zKtL
         XXYKk/BQzTtUXdDh8bHG3KpvUvS86DUmqI47RJOeCYjLRuMmud3Nrk+e84oElzyYOmWP
         FbUA49pM1DLgPEQ/4VEV0df3yR7ukYs1JV2jNy25l2Wqr69+I1JwSRhk6M0fYcFn14HT
         0sFLBaaan/rTvkNRObcYVeOuDtJmR6NM1cEPUmCoNiS3kC190YAINcxX+QUXCRZmsjog
         SFv5wrI/O5cVtHdCWJDtXXY1iiaQm6Ei33QSUA6qBvunwbqVI1ueKmWdVeOzfcXxMCWg
         GitA==
X-Forwarded-Encrypted: i=1; AFNElJ+TJqWQwSMBS+vgF9pxkIGNUpcod97tNTL3FpSolnFQt2C9VXLwxAm0yIaWbJBUALbp9ENa29mSH/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YynLUGAAGykKpq97NgVkObGlIFHCfw6nAxYw6Pq9TKJly/Q6aeL
	CmXISFEsa38pP2EkIqpA6tdPbMwAPPWgGliB8StR6UPsHvExuLfk6rTx
X-Gm-Gg: AfdE7cm2QVfu1oXW1ACYve36ndMumnDQLZNBToGStd/dhAaoNz1soNAIytRrM/wQF55
	pUkd1k9eOyaUfQBQAy+a81ZbEVq8wq8ZotJ9cRP1/Um2ahTOmiTZWfoWwOO1nLr83vfFaE8fVG9
	CujEk9c3PIzFwtgiRf7FV2vmKknSC2MEz7ep9YlPs+MjhahLMyAvAGAAbYnRYG6wdNkiy0p+VSh
	sBrtNsnsP3AWetQVLxAHp/xWsKbbvfn1lBiVyIa+/cK4DcpbjnLaTnKSJQ0y2VGmKse2+hHwCCO
	2VU3QeyySk2qkAa3CWdqKiZjmAuJlhd8AP/hRJD2rdiBpZ/EasdX5Z2RwWha4St+c4lp+z5VNE3
	EgxqUHNN78FH/Q6o8ZdKR01C9qZmj3Vm8RaDODvn7Pn3lYRRJiUw7gopLPFBnkKixWTR0Lo6U/9
	uJj/D0cnlUDUVnq6dezTHnuVID2iHbfRsLsCL410LK/BCAlP/gjPEkqBCCCIF49+xFlA0+ChbiD
	KV2n1jlLnBXpFTWRcYodA+7BurK
X-Received: by 2002:a17:902:e5c3:b0:2c6:6926:8968 with SMTP id d9443c01a7336-2c718fc3191mr28913805ad.20.1781855026787;
        Fri, 19 Jun 2026 00:43:46 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c72089c1cdsm14474145ad.17.2026.06.19.00.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:43:46 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 19 Jun 2026 08:43:24 +0100
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>, 
	rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v6 06/16] iio: core: create local
 __iio_chan_prefix_emit() for reuse
Message-ID: <dlisetsssjoyodmv5ubl4rzhxtla3g46mrrzv2f65nqecel5fu@dqiqsayr4aip>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-6-79125ffbe430@analog.com>
 <ajQGTQ1_qcOwfzne@nsa>
 <x3aijvc4buo7aqbchikuoyyrgiq3afidtkla37h2rg4tvfdbc3@h42qp3estg2s>
 <ajQ1bZSNHQ96pyJx@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajQ1bZSNHQ96pyJx@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92894-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:455.rodrigo.alencar@gmail.com,m:noname.nuno@gmail.com,m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:455rodrigoalencar@gmail.com,m:nonamenuno@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[455rodrigoalencar@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[intel.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[455rodrigoalencar@gmail.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,analog.com,vger.kernel.org,metafoo.de,kernel.org,baylibre.com,pengutronix.de,lwn.net,linuxfoundation.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F30166A4683

On 18/06/26 21:14, Andy Shevchenko wrote:
> On Thu, Jun 18, 2026 at 05:14:19PM +0100, Rodrigo Alencar wrote:
> > On 18/06/26 16:06, Nuno Sá wrote:
> > > On Thu, Jun 18, 2026 at 02:27:22PM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> ...
> 
> > > > +	dev_attr->attr.name = kasprintf(GFP_KERNEL, "%s%s", prefix, postfix);
> > > > +	if (!dev_attr->attr.name)
> > > >  		return -ENOMEM;
> > > 
> > > I don't oppose the change. Looks like a nice cleanup.
> 
> May I oppose it? I found use scnprintf() is harder to follow in comparison to
> nice kasprintf() that takes care for the dynamically allocated buffer.

In the next patch the function is reused in a sysfs attribute read handler,
a context wich would not be nice to have dynamic allocation. vscnprintf() is
the main building block of sysfs_emit() which limits the buffer length to
a page size, so I used scnprintf() trying not to deviate much from that. 

kasprintf() it is still used in the caller, where the logic was a bit confusing
as it tried to avoid multiple allocations.
 
> Also there is a chance to get a name silently cut due to insufficient space.
> Besides that this function can't be used (again due to 'c') in kasprintf()-like
> wrapper. I do not consider this as a good approach. Have you looked at seq_buf
> instead?

NAME_MAX is not the maximum length a filename can have? I suppose there should be
enough space for the channel-prefix. Indeed, seq_buf can be used and it cleans up
things a bit as it tracks the the position in the buffer.

> 
> > > But bear in mind this very sensible as any subtle mistake means ABI breakage.
> 
> Which immediately raises a question of test coverage. Do we have one? If not,
> this code must be accompanied with one.

Agreed. Will see to have tests for v7.

> > Yes! I tried to be careful... this is dangerous stuff!

-- 
Kind regards,

Rodrigo Alencar

