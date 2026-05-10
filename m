Return-Path: <linux-doc+bounces-86673-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN9LGhJHAGrvFgEAu9opvQ
	(envelope-from <linux-doc+bounces-86673-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 10:51:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589450336E
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 10:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0D1B301727A
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 08:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55DE36CDE9;
	Sun, 10 May 2026 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu+7o7u8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C6A36A02C
	for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778403063; cv=none; b=BW+/Nmg6MrI84AsRbaHUVtA1hkm/ObPCXIyrwJikit7JMexaVxDnyXKingUlw89cHI8Fe0VCvfnfBbfdCGmtl9TceJ0a5nKSmzzW8QjS9Z37mVf7UmAut6WeQiCZT/NGluK0ISuYxXP2hX/1oF/g3aBBovKV/yVpbx4nApzl3eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778403063; c=relaxed/simple;
	bh=APsPwM7MyHrwDPyETr8QDqu7q2GGK+1JiXh2BcinVqw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3cM7MV363KzMRiql3s2slnPHP0lzmFLUeeAWf8DdEum9Mspq7gH6S+LuOFP2RiP8YhCLSP/8oAdm8BZbDo1OgfQ8ioeqlgP0KEPIl9R70B2XergAUgQs/l0pl+r5Ac2KOO7YVmzVErteJCz3R7v7Ib3HvdtEa9xKL9MaA0q6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu+7o7u8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso30593845e9.3
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778403060; x=1779007860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZNF7ruP6zfWaL34BGu38nOIYnKqmgSGr7rjszlXHJE=;
        b=Cu+7o7u8Z+dirRbcCaIHmbZUXXphw11ubrL6mx3C+z0YABYUvz+5LJDUgB3Eamd33M
         3ZEIQwXuj0yXdUWut7gc9fbhVglih7Tykz2KeuODi12lnakyULynCh+ClJ8rmdKGSIp+
         bQPnw5SIyTvloLcK9YaOGROWCdi7dLisTxAeAiAsi2JPIG+b0b8oSbf8oyVGkHtYFr5i
         Xk9iWs5xyCUxsnE58Mp48g56Q86p5Qdjjq/4ZHsti3/v3Rrf6eQ/8zxf+v1+uw+wuzyI
         6gEChU/uxKNsn/tfKlAv1EQv2B4wN4DRhcrJ1l0Xt2MSe9aGPnHD89Wn0n3kfskIm9Bw
         60LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778403060; x=1779007860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZNF7ruP6zfWaL34BGu38nOIYnKqmgSGr7rjszlXHJE=;
        b=A1Uzl673Y7n4fxcPfiMuEFJ60lruJ1J89Av/l3L3y0ucuYnFQ5EJCpNLkyKJHrp+dT
         YGIplTSuo43ISE2vj+mNiuqYp6i1d/Ieapm9LI7klt7U9dQnbCJ+GRU2nVVynZvIP/9W
         J1g57h98wuGLUHyPqgJS28TE3mH0Hw6qr5x+aAvDLsk72GwvFulzBeA0tqYaQt4u+d0h
         hhC0qcF9d2aZOrMHGQjq2WMZBfv1vcCdDlCfo7fVDcjRjQUvfLfizdgjLRzytHG6PDwi
         lTa0qgZSqjPYbSdeyzkmr+81/VkubT16LaBc81rtEp+W5dbjRJUvpKdYYqpB+bQAzdmN
         ZsxQ==
X-Forwarded-Encrypted: i=1; AFNElJ83SanYqd86+W0M8ghp6Bx40ZQ9FdiG5NYo5Il7bvSI2fHB9eRjNMSZZc3b84bvtDSMuh9ALN2VboQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMV6vnmsLPzVQsJoIi1oYyRkEHVDMED8/GY0A4PJ1ca+EJUvyI
	aUCN9oVFmLI1hM8Nn9juH2FQO0h6SrG1MvqtY/k+NJdgGLrFpTCTnAg0
X-Gm-Gg: Acq92OFxGnFEOhjAUXi8I++nbmZgmHXrHfUUhygKQKFSEVQcW2oPeMVAGvm68unrob0
	vOfr/6Qy9PXKTUUNMzzA+AJrqie0fDLgKv+4fifYTDcusE7YtCp0s3QURoaxT9hStM7UYw1aKri
	5PVjIRlLsrEyqe/+cwrTDsMq6NXuFgq+GDoeEnhToqoGwTxHLV4gKyLzkTwOq94DogqPr9Q2uBU
	x1gvaVLfSYzsAFddeqyzzJly9khB3U8iYcgpHwNC2UOD7bMWZtdLc1Dvp8TKCDCIKVc1zX0KdgY
	QCylHwBw+MagxW7JmD/g6d80oIZ/wFqahCk+5/zza11gFF5rQvFzaCPS4qku9IbmhwD3XkznRia
	Me8pHxECcCLe/RZz0XSC8zZ/+MAGJJmSHhQb9x5Fj+GDEVDs9Pyq/pq0giyCNRppVrTHlIBgbNP
	dy9LpIW/gLCnnmd7SWnlwZbK9HY78f2pqU69+/2u4JWHT+qvQaVV3Rj1jX8LWKC9EU6wMB/SCOQ
	l0kmVkikliiBGmErA3NdyG+A64uLr1lkg57zKxVaewhJrlasA==
X-Received: by 2002:a05:600c:8b8b:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-48e51f3fd03mr321073295e9.23.1778403060285;
        Sun, 10 May 2026 01:51:00 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d89af2esm39629535e9.0.2026.05.10.01.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:50:58 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 10 May 2026 09:50:51 +0100
To: David Lechner <dlechner@baylibre.com>, rodrigo.alencar@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v4 00/10] AD9910 Direct Digital Synthesizer
Message-ID: <jqsr6q32kqnehzyc25vo2owv7b4xvoppnlbhrjrevahptm6pbg@pvghdgt2w4wf>
References: <20260508-ad9910-iio-driver-v4-0-d26bfd20ee3d@analog.com>
 <f3bb9f64-a0ef-4862-afdd-74ee39d7bfc1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3bb9f64-a0ef-4862-afdd-74ee39d7bfc1@baylibre.com>
X-Rspamd-Queue-Id: 0589450336E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86673-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[455rodrigoalencar@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 26/05/09 05:31PM, David Lechner wrote:
> On 5/8/26 12:00 PM, Rodrigo Alencar via B4 Relay wrote:
> > This patch series adds support for the Analog Devices AD9910 DDS.
> > This is a RFC so that we can agree/discuss on the design that follows:
> > 
> > This is a follow-up of the V3 discussion. For V1, we reached into
> > this channel composition agreement where physical channels may have
> > sub-channels. That adds the flexibility necessary for this design.
> > During V2, some feedback indicated that the ABI is too device-specific,
> > so DRG/RAM destination and operating modes are configured through
> > alternate paths and profile channels are created. In V3, there was
> > further discussion on the ABI and on mode priority debug.
> > 
> What happened with the idea of adding a new attribute to show the
> relationship of the sub-channels to the actual physical output
> channels?

That's still to be done in iio core. I was still to think on how to do that,
and I am trying to get a mature ABI first.

I am not sure about the use case where a sub-channel is shared between
multiple channels, but I thought of a iio_chan_spec pointer to a parent
iio_chan_spec in the same struct. Similar to a device-tree, we have the
primary tree structure and then phandles can be used separately to create
more complex dependencies between channels. So a "channel ref" attribute
could be separate concept.

Then iio core would create the read-only attribute "subcomponent_of" or
"parent" when that is not NULL. The read function would just output the parent
channel label. Then labels would be important to create this logical dependency
between channels, and maybe that is bad, but in this context, I suppose labels
are going to be needed anyways.

-- 
Kind regards,

Rodrigo Alencar

