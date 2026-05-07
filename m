Return-Path: <linux-doc+bounces-86158-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA+OF7xV/GlOOAAAu9opvQ
	(envelope-from <linux-doc+bounces-86158-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 11:05:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F225D4E57E5
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 11:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BB9A307E308
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2026 08:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199833A3E87;
	Thu,  7 May 2026 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EL/OySse"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3E839D6CC
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143893; cv=none; b=FvNGNG8H5w90XyYGMFh04xiwM3JVkE1Oh5cE8Kgqk+LjJ5bInzIbNzFchABX+arAszEcr3pyrBiTKqVRwPlPZf0TkiueRTToXagzSWKQMmp8br3osPqsW98q44DC0OUmyYXoY/f/7wbfd61hlvKqlnbBG5TpkBhiWwPmokXAETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143893; c=relaxed/simple;
	bh=VX3jn8byCgO0ZAJp6dhWZejX5JlmyqMoj5sZHahesx8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lYYsxHU15wUEp4rakaQHUzO7fA3v+KGjHIHSpKH9ogY6YUmzXG7J1wAoEtcKWF5+4NKiNfjEMgsDWbvU1rWMeJuNA16R633xPpQzl/LJ9rAew4hvyxk0XAEdBc2y9n/IiUtnmlsO/mpBo7oX3HYqd9rVMkSSTgIoVQxryJ7RqQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EL/OySse; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so3634825e9.1
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 01:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143882; x=1778748682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9FEgjgSXbJMk9lcA99TUtEICHtp0LNQxToJb92NNSs=;
        b=EL/OySseyWN85BxkOMhB+UD/sNBitGtHvpqoqP5x6PAQtVACudDjOCjBNSWCl6/H24
         C8TFl2ysMrpi9FgHV26JFVKnoeQe+ufKvbNOh+3JH/e6hNNbQw7R1CzPpmFiQV54nBby
         /tgHuf0CJ4r5Fpaw3kDXWqCJGyxuxkwbucrEuYSVk/GbkUtMhMKRlE74od2Srvljh3YG
         xacQls46cmhZqblO9I5pikkI0oQU5O0m/U5+1b7DgARkNHKIqlqlxZvm6MSvq/8SWuyW
         Bl99upnUX+zPU4Vm20yT+RzP9qSxzOCt2FkOTVTANyMgODzYHYPuSbp7VHvjFXE8Rr3Y
         1eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143882; x=1778748682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/9FEgjgSXbJMk9lcA99TUtEICHtp0LNQxToJb92NNSs=;
        b=e5dhWg+q5a089xjDZ+msKi07hPqo7p1Gcuq3sn2so7secfAQYh3KKmNESHH1AUmk5j
         nOW51kwDvMxHCWeML4reI/2nTR7uIEViR+HRZe+epFNlX+h1P74iAUc8JUJdP1io9TEo
         fWOiEd1Lv1AFiT6TOJZ+qlJfgn1fpsMUh1xQjswnL2zv7sqavo1qdvT9cWfEFUj/E1dP
         hSLenQk4ByPAsk1qTUOTdcF0WfRyubC3v0wB5cTN54pjcm7+v0PzXmzkSu7i0WSODx4C
         073AfT1DB6umSLJFhKCfb4/asme0/b+aPx5RV04EBV99hi9McOCdJjVUmSbwmE7wywbK
         CjPg==
X-Forwarded-Encrypted: i=1; AFNElJ+kGZHfPsv7pfRvguckMlJ1qOEpvbTRsjdgPlZ7aNXyhYos0KMnRoneLGo2TQjGUJGI/ZFA/bZdtXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr5XjRFM0RMjqDp/EahCqv9PuEKiuNEsikKf/zTN3xrstHJhCd
	jOt7WVXL+H/uBwm8hX6xXREeXEZ1OfTMn/THxrLFiVeeDxwNBt0GSVwB
X-Gm-Gg: AeBDieu2yaqbIsFk/+jMHbO/a1J+Dmes0AGhvaJqBhhlQvFBq+arZRE2a3H8jXawWKb
	z864anVupYLvzz5bZNvCtKRfVROwXjplzNeuvTceQL+jfh/vrY0qqZrMZQm9+Gsm/PAvo7hm6W0
	RVpLRd2RSjGgSdYvbgTTOhf/SuBIxGDttnDwEGEblPPzM6ot7T426znHVd6k+pU8TUThcbkuuOz
	qnW8sTOT1PPEc9fp1/Szz3ByZGQAU8dmV3+rVRAzMW0O8FQ6OcjStjjE/zR4IGIweFnw2R+/PwC
	qQMF6NAFjFX0Kd9zC4MO7U7op9LnrD9Jlh55uL5CvCl4Gi6dQIFOVC1Iw1jonQUNWgzArTYum4b
	GUWySwwdHZd5Ydjsz/vK1HtAvU4+5YfxEzSGqXwYUZoZ3FGotj03xrV5lAtX5jaJ+Nfrd1vvfIq
	V+Gk4IoqFzp0D9f95moi7wzySL+CUFpPY=
X-Received: by 2002:a05:600c:3e86:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48e5dffabcamr31079945e9.9.1778143881872;
        Thu, 07 May 2026 01:51:21 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312dbf8sm33675725e9.23.2026.05.07.01.51.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 07 May 2026 01:51:20 -0700 (PDT)
Date: Thu, 7 May 2026 10:51:16 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jihong Min <hurryman2212@icloud.com>
Cc: Jihong Min <hurryman2212@gmail.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add initial support for AMD PROM21 xHCI
 temperature sensor
Message-ID: <20260507105116.2c1607d7.michal.pecio@gmail.com>
In-Reply-To: <c7d0e6c4-1c6c-432e-90ed-f0604401d691@icloud.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
	<cover.1778099627.git.hurryman2212@gmail.com>
	<2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
	<20260506233332.664f220c.michal.pecio@gmail.com>
	<c7d0e6c4-1c6c-432e-90ed-f0604401d691@icloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F225D4E57E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86158-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,linuxfoundation.org,intel.com,roeck-us.net,lwn.net,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[icloud.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 7 May 2026 07:41:28 +0900, Jihong Min wrote:
> > I think this commit message and certainly the Kconfig help text
> > should include full name of the chip and perhaps its official
> > marketing names too, so that people better understand what hardware
> > is supported.
> >
> > So: "AMD Promontory 21 chipset" and "AM5 6xx/8xx series chipsets",
> > or whatever they are called by AMD and motherboard vendors.  
> 
> Addressed locally for v3. I changed the commit message, Kconfig
> prompt/help text, and hwmon documentation to use the full name, "AMD
> Promontory 21 (PROM21)".
> 
> I avoided putting chipset marketing names directly into the Kconfig
> text and commit subject because some AMD 6xx/8xx series chipsets can
> be built from more than one PROM21 IP in a daisy-chained
> configuration, including more than one PROM21 xHCI controller.

Not sure how is this a problem?
The driver is still applicable to those daisy-chained chipsets.

Configuring the kernel is tedious enough already, the help text should
ideally tell me whether I need this driver or not without searching
for obscure code names.

I would even go as far as to mention that it's for AM5 chipsets,
because AMD recycles chipset numbers every few generations.

>  > Is there any documentation of the index/data registers themselves?
> 
> I am not aware of public AMD documentation for the PROM21 vendor
> index/data registers or the temperature selector.
> 
> For my initial validation on an X870E system with two decade or
> so.PROM21 xHCI controllers, I passed one PROM21 xHCI controller
> through to a Windows VM, left USB traffic idle, and let a Windows
> monitoring utility poll the controller temperature. From the Linux
> host I monitored that controller's PCI MMIO BAR with read-only
> accesses.
>
> The vendor index register repeatedly held the same selector value,
> and the adjacent data register exposed a stable low 8-bit value.
> [...]
>
> After identifying the register pair, I used the same validation setup
> to derive the conversion formula by comparing the observed raw MMIO
> register value against HWiNFO64's reported PROM21 xHCI temperature on
> Windows.

Looks good, unless there are gotchas like the actual formula being
dependent on other factors you haven't noticed HWiNFO reading.

It would be good idea to record this methodology in the commit message
or docs so that others can repeat your experiment in case of issues.

Regards,
Michal

