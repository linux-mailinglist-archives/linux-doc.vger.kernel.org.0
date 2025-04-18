Return-Path: <linux-doc+bounces-43581-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B718CA935D6
	for <lists+linux-doc@lfdr.de>; Fri, 18 Apr 2025 12:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AE428A2B0F
	for <lists+linux-doc@lfdr.de>; Fri, 18 Apr 2025 10:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E0A270EBC;
	Fri, 18 Apr 2025 10:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MHcTT8YH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD3E2566E3
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970921; cv=none; b=iL+1+fpTRjU+/vTO7G5KKp9/EZ7sD63OZM5Wz31unbh+1FFcHxpuasXKgKjqyZT9KxkUnsQYjgmI0exZUovDXBdND1I8ECGYMQI/4TOBaodTbYqC/6K/DtSnp+tZIUstJg25ye5uvFDuzP/3X24YpEkKCIOCWCdgbqBZo7zhOoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970921; c=relaxed/simple;
	bh=+RdKaGSYUCfEJiJFPdvtZA8GDr+MXvsxZc3B1z2ldAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhQ6ihLqYlBb47r90yS5Hsa6DubsghiTJliy7qxkdypnHekHQKZpC1+WHAYuzmGgh+P6/H/rjP8x3ZIqfMFUE2iBFGxJGfktmTnlLrJLlilkvApNarZH96VecAuAz1P0Yxu0y9gS/pVvVmmI3JGNBdo90LadHYPtbQOHnEhZuaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MHcTT8YH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c266c1389so1193882f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 03:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744970917; x=1745575717; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/qSOlMwG1tBEqwfJZ1I0Em2NJMBVmrSeT8vIpdwl2s=;
        b=MHcTT8YHqz0sPIsVXD3PjHYlZOJYmOSryhjogdewJJh/JRO/PPQEfABxDHFbvXi2z/
         TxSJ2GVuBkflbuZF7FZDkphpx7k0tlWQrr34twF3Bzt9HG497z2zFqaf/eOZGo/m2tS0
         c0kj+c29EqVoTgAgOATw0xgb+uwucPZrO7NX7qmOq1CbsphQQvlu+UsV0RTWJjt4UHoR
         dVaB5GbGhPT8xIBh5fe6PCHMaLVPW9MR6+hL+kLLib5xzbJVi0mISRG1w+/U/iri6xGI
         sKM0NXpXqyIOmScvXHoeLpfYRwL11ocwK8AuYrp14HpLc3L2ek5zTly0vsym/qAQkYqi
         jwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744970917; x=1745575717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/qSOlMwG1tBEqwfJZ1I0Em2NJMBVmrSeT8vIpdwl2s=;
        b=LxFOTYQKEtrhvgjajJ3V3iNWOx31KKUfE64RpsikCIECPE98VZvT5ZD2hOXTQJOB6Y
         eQBSb6y8Eer32tDikrH6nlgCzjp64c9IXFXrZ0faB3XKRNXX37ozhNNs3AYr5Bw1g0xa
         HVB4r/m9ZFb/RfFrcMjrwyS0OvBGtZc5uyy4wdQiQB19bt/clOchd3MyBnBQoBInT7r6
         cznCCrQciqw4HJkrb7qJkOfC7R3psKcmab0JFi9Hhn0bZkkiyTWCE5G1cxRza9Sh3dfj
         iB4zfgTkdhwMLRZXffsJA1jnUK6yIv1Zt//DAhKrxpYDvQl3OsYxGFTeLL/sOZp7BNfq
         npHg==
X-Forwarded-Encrypted: i=1; AJvYcCVvwpFBN6xiZBSLCnPEuI0kc/2omHVlf3WWsYqrictCyzkpGsbcdTSsiLJZLS+zvCKT7OkU4KpnzcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJYMPjzk6xSowCpl3NEnhsuWCBLsb0Bid/fNtz2NyZSsYPeYcn
	lb3QGC4iiCIvXfD54mDL7530rNorsq12QIC103JbeBlWk4oAKeeBZ4FSeVV+OHk=
X-Gm-Gg: ASbGncs5UYleR9zwrzGIWxDyXllVpjseuOZvb4rF7oDNfZL3QHCH0McLOlwHIjNboZn
	18gz3q0iqZQEKK4ljVn2dsOTgYwzv9aurpfVPZHH0xoX/kHtbSCk1weuldbEEW4JlT5j3vKd5+3
	yxh4VFPBLqL9377h5wM6LEtO3WaXE3nEEEDfKxVXRWUP2E8zcFyIzFYlgIZWbAgbW5gx5OxvYZi
	6WRZoY4v+XpOWgNJ0gsxPrWNKZig2vtxGqp7HKPt/TfZjDJNsyUF//YZJ0f356w6bNNMYofb3o6
	ImJuNUY87MkblcCKg+ukVK4AbPcqYBrEqVjubSij1xwJdFXdIsGO0hbD8K/drmxPiHfvfrMImwE
	aDz0=
X-Google-Smtp-Source: AGHT+IG1L3VfWz9J+obAaFerB2Z59MsSd2dFbffUprl7yAb1d+1L7oSTlRW/aqUm+C4DsUsSsv8Z1w==
X-Received: by 2002:a5d:6da1:0:b0:39e:e259:91fd with SMTP id ffacd0b85a97d-39efba3cbbbmr1721753f8f.17.1744970916627;
        Fri, 18 Apr 2025 03:08:36 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207fcsm2342052f8f.19.2025.04.18.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:08:36 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:08:34 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] vsprintf: remove redundant and unused %pCn format
 specifier
Message-ID: <aAIkouhM_ePdhgJY@mai.linaro.org>
References: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
 <20250311-vsprintf-pcn-v2-2-0af40fc7dee4@bootlin.com>
 <Z9BKW_06nLAOzYfY@pathway.suse.cz>
 <20250407184647.3b72de47@booty>
 <Z_TRZSxwzfAZ9u6I@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_TRZSxwzfAZ9u6I@pathway.suse.cz>

On Tue, Apr 08, 2025 at 09:33:57AM +0200, Petr Mladek wrote:
> On Mon 2025-04-07 18:46:47, Luca Ceresoli wrote:
> > Hello Petr, Daniel,
> > 
> > On Tue, 11 Mar 2025 15:36:11 +0100
> > Petr Mladek <pmladek@suse.com> wrote:
> > 
> > > On Tue 2025-03-11 10:21:23, Luca Ceresoli wrote:
> > > > %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> > > > add %pC{,n,r} format specifiers for clocks") introducing them does not
> > > > clarify any intended difference. It can be assumed %pC is a default for
> > > > %pCn as some other specifiers do, but not all are consistent with this
> > > > policy. Moreover there is now no other suffix other than 'n', which makes a
> > > > default not really useful.
> > > > 
> > > > All users in the kernel were using %pC except for one which has been
> > > > converted. So now remove %pCn and all the unnecessary extra code and
> > > > documentation.
> > > > 
> > > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> > > 
> > > Makes sense. Looks and works well, so:
> > > 
> > > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > > Tested-by: Petr Mladek <pmladek@suse.com>
> > > 
> > > Daniel, if I get it correctly, you have already taken the 1st patch.
> > > Would you mind to take also this patch using the same tree, please?
> > > Otherwise, we would need to coordinate pull requests in the upcoming
> > > merge window ;-)
> > 
> > I see none of these two patches in linux-next.
> 
> I see.
> 
> > Anything I should do? Resend? Or just wait a bit more?
> 
> Daniel,	Rafael, Zhang, Lukasz,
> 
> would you like to take both patches via the linux-pm.git thermal tree?
> Or should I take both patches via the printk tree?
> Both ways work for me.

I'll take care of them now

Thanks for the heads up

  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

