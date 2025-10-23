Return-Path: <linux-doc+bounces-64286-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7198BBFFB4B
	for <lists+linux-doc@lfdr.de>; Thu, 23 Oct 2025 09:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B42CC3ADEA6
	for <lists+linux-doc@lfdr.de>; Thu, 23 Oct 2025 07:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FB42DE6F5;
	Thu, 23 Oct 2025 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="DdadXaCA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428FB2DCF55
	for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 07:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761205857; cv=none; b=MTn/c6953eNyzrpt5PxRcJryoCgCc9TEw3wobAQIpbJhjEiD06p3XRIbsG+sN1s4ezcDdR5KtcasB9Y+5uyImMs0qRI+8VJtwtBsfzHJ/0rl7NZGUfHs2QxPIrBCO31PmnvxXi/ceWe8E0KzdfCHMIHje7fDwUDTX7zk8KvGdg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761205857; c=relaxed/simple;
	bh=1hywAO6OmglGEJDv4dlqj7DVBEZf4btWfqp6klm/+u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jefVouPEbonqJ1ah0l4IrMFQlWqhDy4zlNP/yFEc37XPh3YGADQ6KurnkKV1LEhqq8+7Y22hTwy6c5PYe2SIeEDJeA5Du2wbh8/aWzJp7RSQUSKTri1i9qeXo6HJ05lW32B5WKuMGcdN5yQHdyXZSKVlQjbkwgkfejDL2n3aUq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=DdadXaCA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33d463e79ddso685706a91.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 00:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761205854; x=1761810654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ckf+WA/vGci5TKMGOHLvpH1kq+z/6nk6A9B9djwZ1Vk=;
        b=DdadXaCAsxeuRsSpN+Sdnn37yPc/OkFEl63jtTq/z8UFhC8nMrDu66q7IGiP/acqFV
         yANWLN1mFfSLl64lqnzKWdnVpSkTIcvKWSKhuiE2HIyaorhgIPuRz7Hjd+vzbjT9fqZM
         n15WKP7SOO/BoWlphq9F/IE/x+S1tZlnyQ3Zt1vtoBxo6nOfvoTs7k4dO7hrJeII6E9I
         6wzEFkoRCV0JA9LIfkLH5fyj4kOIBIgLQZXr12cOdRjIwJrUvyUpwHq86VJQE+czGytL
         TXY6aLh9GDUO9THRDwGPgcylt5FfsPu9apzDEhzanJS/goOHGiO8sBft1bwWUwOifoXX
         4O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761205854; x=1761810654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ckf+WA/vGci5TKMGOHLvpH1kq+z/6nk6A9B9djwZ1Vk=;
        b=YVEb5C4nwawGDEB4b22PGhIJBg5FBv2VMtOrlZj06qrCIu+1x8Dr9IMvUH0nnzbuf+
         KSyrcuEdnO88CYb9qAjDexj1Uw1KCY0w4Yu5muMZOueqiC8R2AKLuuqcsGs304PJi8qW
         Oos10BTBpkQ9sL2CxLVrYkXUR0YH1JqELBzSkx+ck01nEwndCWtw5NDoPeKstNSf6e/p
         FdLHPGP1k/nFZ07R05NAPKeR1/car7oshPhTDU0/DmOz2LclJT6e3ILOw7RPzYetRu+V
         8GzLCNKG7fSs/teQMMRAuLKNFozouWTcSBj2RhAG/EoN5lms30rued/8nKW5+PoVSF+1
         W2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMgYx3m3UfJsET9f8XNZESPu60Asm4JZGoKGlRkVLJMkzeX2NiddIWxdhwgA8gjb2UaYHJytfzGMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIc4lEnTEIO8avnrZaYo0OiasX89HUfnI3AW0XK5oC1xogTfNV
	qOb75O7vqTkLmM+NkGzI6ciDIYfgJfsI5Sv5ewcmzjTL3nTDambAfGCGVgk27rdiMMA=
X-Gm-Gg: ASbGncuuTZoKfR8e/bC34FJgWCQ8R/FeYZWciqcsl3PSGI4tXd/r17wxZ4Ccp/iFpPy
	sOtpW8csidcOblOEJaabvD+FAnpeXoTQ6eJdeh1UfiD4+rpzrjlLVFvr4v8G7NLktlqkLY3Szw9
	yZfBFiWC6TlfGgM9jDMGov1azjXSgAdem+8zm42oPqFGRnGy4RMgJk7sRCacV4WzdvOGCezLMY5
	rQH8pHnW0aL2+moe7P8Ao+KhWUkySuYjlkldw7RISNDjavHHno0nbkXbMTKmF8F7lk7/xEJHOyr
	P+swXPMvCPhU+2jlwtJTgK34D4+iD2u6btZzi+CoJVp/qOXcZaouDQU506vlHtfgqPinuIAsNm7
	pAQsZiRynBvTxy3ZpK4E6vBvNCadjTfBV9bCsG46xEa4tUv2SxKRiWO8GM50kIbgc+6ddJ6QzZO
	RbCteKbJkbQzsQCn4G7Q==
X-Google-Smtp-Source: AGHT+IGxBmhQYX3R+zPm2DZoyJZbHJDy6/9CVQ6y+y0VxQf1BMG2L8qFAVrrjtQYPgaGrb29h3irDw==
X-Received: by 2002:a17:90b:44:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-33bcf8fd82dmr28272717a91.27.1761205854513;
        Thu, 23 Oct 2025 00:50:54 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:2035:6c3d:cc34:bc90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dfb1dbddbsm3809280a91.0.2025.10.23.00.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:50:53 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	igor@reznichenko.net,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 1/5] drivers/hwmon: Add TSC1641 I2C power monitor driver
Date: Thu, 23 Oct 2025 00:50:50 -0700
Message-ID: <20251023075050.254998-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <be691214-bac6-43d4-be62-daa57c833fe7@roeck-us.net>
References: <be691214-bac6-43d4-be62-daa57c833fe7@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guenter,
Thanks for the detailed feedback. I will address it.

> Please send a register dump.

Here's register dump after init during run: 

tsc1641 1-0040: 0x00: 0x003f
tsc1641 1-0040: 0x01: 0x0253
tsc1641 1-0040: 0x02: 0x0dc0
tsc1641 1-0040: 0x03: 0x0053
tsc1641 1-0040: 0x04: 0x0250
tsc1641 1-0040: 0x05: 0x0033
tsc1641 1-0040: 0x06: 0x0000
tsc1641 1-0040: 0x07: 0x0000
tsc1641 1-0040: 0x08: 0x01f4
tsc1641 1-0040: 0x09: 0x0000
tsc1641 1-0040: 0x0a: 0x0000
tsc1641 1-0040: 0x0b: 0x0000
tsc1641 1-0040: 0x0c: 0x0000
tsc1641 1-0040: 0x0d: 0x0000
tsc1641 1-0040: 0x0e: 0x0000
tsc1641 1-0040: 0xfe: 0x0006
tsc1641 1-0040: 0xff: 0x1000

> > +
> > +	/*
> > +	 * Disable alert mask first, then write the value and enable alert mask
> Why ? 

The idea was to prevent potential previous alert from propagating when changing 
the value, plus to only enable alert when crit/lcrit value is non-zero. 
But given your response below this is not the right thing to do.

> Disabling alerts if the limit is 0 is wrong: The limit can be set
> to 0 on purpose. Only unmasking the limit if a limit is set is just as wrong.
> Either limits are enabled and reported, or they are disabled and the attributes
> must not be generated. Mis-using the ABI to declare "If the limit value is
> 0, mask the limit. Otherwise set the limit and unmask it" is unacceptable.

Thanks for clarification. So would you recommend then that all alerts should 
be always on/unmasked for this chip or to add custom sysfs attributes to control 
them, since it has this capability?

> Either report as standard voltage (in0_input) or drop entirely.
> The shunt voltage can be calculated from the shunt resisor value and
> the current. A non-standard attribute to report it does not add value.

I'll drop it since the shunt voltage resolution is 2.5uV and it won't give 
accurate information to report it in mV.

Thanks, Igor

