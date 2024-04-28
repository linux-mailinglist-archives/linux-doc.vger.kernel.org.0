Return-Path: <linux-doc+bounces-15315-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A848B4E68
	for <lists+linux-doc@lfdr.de>; Mon, 29 Apr 2024 00:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 624071C20A2B
	for <lists+linux-doc@lfdr.de>; Sun, 28 Apr 2024 22:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19243B66C;
	Sun, 28 Apr 2024 22:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="aa+Nj/J2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706143F8F0
	for <linux-doc@vger.kernel.org>; Sun, 28 Apr 2024 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714341646; cv=none; b=oT4FQyS0jHF9++MAsm3iFY6qWEoZYhkxe5QhHroMngN7xWlw2/p1yniumyZ2Qz+JSwivxHjCrqtXTv4EK6v6ja1RSTAW1WyYc1sjrhlBjJzBRP41r2Fsy1AFmVUX+7bvMgk+DW+NwHsDq3cZ+UrDzbR9QW+eW9abV3G3/So8mJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714341646; c=relaxed/simple;
	bh=VKa5DRK+rov4mOndYM37s5U81Iupu8JcxyUVcg4m+F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVcJOuC+sr/jNh7nE2yKOTSUVJ6vNnPAZhvak6BAgFpdQVp2tB2DZFGg1KrrSeFjOgsw5LbfuVZZ6a3PVwNQt6JMvanctMURimXi2ynUEyUJnhbawnSADl6UmT4xEvHYaDl1/8GPzocYb9gS3G4D4YGc+33tthPZWfVW+MI5Nj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se; spf=pass smtp.mailfrom=ferroamp.se; dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b=aa+Nj/J2; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferroamp.se
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5171a529224so4788324e87.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Apr 2024 15:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1714341642; x=1714946442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AWJwQ79KFPwoTQT9Ru/EFPzNPVyElzHVufYRANALvzk=;
        b=aa+Nj/J2tKWrJ7FIFcFte6Vv5kEx/q5fJg4Jv9CmKXn3aSn7maYnaF/1G0xUWylXEP
         UG4mSHUMzp8QDsA+EICzuN/mRBtXPT/0XO11p0jhaDmqTrjmfn1wICdOoRMlaSLmQ4S5
         z8z3qgOK4WnRisytaA7KwtN1Ig7ildDr7p2l9ZJArWBlrNcL+fRjjCWcyhclGomoEE6O
         FZusTxJFN6VbtqaVLFMBVlPZifDi/IGOEpuUPJUkLnqzVKfKF7uzJTmZofTm3VnStMn3
         UVeQG+tmqTh/VaZIqifel++RV0T3CADBwVk7UIl6gci0onmQifzouChIQuUuJlvG4s30
         l3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714341642; x=1714946442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWJwQ79KFPwoTQT9Ru/EFPzNPVyElzHVufYRANALvzk=;
        b=SpOlKZOUD7jwoiztKIcAgL1X277EUdoyhxXAgw3uJfKAylRsEycTtESR4u3G5o64cZ
         YGWFTWhb1Ii0qy3S2ybNVi6MPBUZSmtaF00aUycoCcXG/mSelZzXK3leRm+tZdHfzm1L
         wmjnLqpIdCZ9tAIMARLtqWpxjDBBdklNyAJxhPw+oP90te/D7EObsIzPcpZ6kEF+4iWL
         9vduUexKPBGZ79dyRk8OGkTVUfYWoGphKxNL9U+ZvT//QEu+MWbVTWyZx26f6gXIsrZS
         sktVMsbvUyv0TZxSYWqVhWhlDenzgrw6/Q/oki8x+JYnGOWvpTgkOTfeSwoc4EcJaFfM
         qkyg==
X-Forwarded-Encrypted: i=1; AJvYcCXQwj5Y99d0s5pUTSymmrp04SicEPgOUrRZU6AFyf/VBsyh1G3ASoEDttUcy2MHC1n17EPnebib5J/UuElP0AJ1NerTGBGRRbbY
X-Gm-Message-State: AOJu0YzQVbdz77n5Tx1D/sQjJs9UvWhogrCn/jinSpLiR6xSKAcWXnJ8
	cDXFGWgErA1jngfjNOVvNdeYqswDguaOqicY/XMW9gBxwUUn/IDEBkOuoLY51bg=
X-Google-Smtp-Source: AGHT+IH+pw1RUW60bhQZcyaY+b3pXcFRtK54hYisJiG7BkigT+/etaKESEap9CmgjFFnDFuPPpiVPQ==
X-Received: by 2002:a05:6512:ba2:b0:516:d448:b42a with SMTP id b34-20020a0565120ba200b00516d448b42amr6329943lfv.26.1714341642522;
        Sun, 28 Apr 2024 15:00:42 -0700 (PDT)
Received: from builder (c188-149-135-220.bredband.tele2.se. [188.149.135.220])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512399500b0051ab68bbb63sm3547485lfu.56.2024.04.28.15.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 15:00:42 -0700 (PDT)
Date: Mon, 29 Apr 2024 00:00:40 +0200
From: =?iso-8859-1?Q?Ram=F3n?= Nordin Rodriguez <ramon.nordin.rodriguez@ferroamp.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, saeedm@nvidia.com,
	anthony.l.nguyen@intel.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, horatiu.vultur@microchip.com,
	ruanjinjie@huawei.com, steen.hegelund@microchip.com,
	vladimir.oltean@nxp.com, UNGLinuxDriver@microchip.com,
	Thorsten.Kummermehr@microchip.com, Pier.Beruto@onsemi.com,
	Selvamani.Rajagopal@onsemi.com, Nicolas.Ferre@microchip.com,
	benjamin.bigler@bernformulastudent.ch
Subject: Re: [PATCH net-next v4 11/12] microchip: lan865x: add driver support
 for Microchip's LAN865X MAC-PHY
Message-ID: <Zi7HCBmpznyQbE_u@builder>
References: <20240418125648.372526-1-Parthiban.Veerasooran@microchip.com>
 <20240418125648.372526-12-Parthiban.Veerasooran@microchip.com>
 <Zi1Tang5RQMmEFdx@builder>
 <50b7cb69-61c0-45a2-9a48-4160b2d1e24c@lunn.ch>
 <Zi1uIjoIgzir1cwA@builder>
 <8e06c952-b5ab-4591-8ab0-7aebf612a67e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e06c952-b5ab-4591-8ab0-7aebf612a67e@lunn.ch>

On Sun, Apr 28, 2024 at 04:25:28PM +0200, Andrew Lunn wrote:
> > I agree with your assesment, the phy won't reset itself, but maybe we
> > could add some comment doc about not adding it for the lan8670,
> > so no one trips over that in the future.
> 
> In the PHY driver, you can provide your own .soft_reset handler. It
> could return -EOPNOTSUPP, or -EINVAL. Maybe check the data sheets for
> the standalone devices supported by the driver. Can you limit this to
> just the TC6 PHY?
> 

Gotcha, I think that should be pretty easy to handle then. The
microchip_t1s.c module handles two phy families 
* lan865x - baked in
* lan867x - standalone 

I need to do some thinking and get a bit more oriented. But pretty sure
there is a simple path for this.

R

