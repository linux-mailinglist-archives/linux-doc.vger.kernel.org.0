Return-Path: <linux-doc+bounces-49269-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F285ADB527
	for <lists+linux-doc@lfdr.de>; Mon, 16 Jun 2025 17:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF4AB18849C2
	for <lists+linux-doc@lfdr.de>; Mon, 16 Jun 2025 15:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69251FAC4B;
	Mon, 16 Jun 2025 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="yd9Tu8Hn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D71EA7E1
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087290; cv=none; b=RJV1K6svogEUra/EdYf9gZKrboKkdZ5YHDH6WJsz9TDXUG2zCyJU30Qnwtm/8oZ6cNGZ5mukIjUHYTyqoyErpbeTAl2lPQrOzL4Hz9g/EuwfZ9jNwBz6Zbsyxlvf9QNbREfv1Lqq/DSTfFXgXKjwD6o0F4VSIOgAHYdFx4L2Bz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087290; c=relaxed/simple;
	bh=lVOaOw4puZ+d2S69mpBnuCByxyPmH7NGfMU2TEKOLnc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G36T4amHQMEjdl1V6jMT1n5NOU80Y1Ggq7B8lYVbo4bzyyqHpMZC+Y9czT0WyxfT0MDQKJLFyEk+kMlAuw0aR3X0RPrK/nBjERr8oIZM+jtPWKReL5zqO0l9w+VZvDigO+a77dBQVp/DtqR0U0/TYcfB4C4hMWRjvAHcQrGedaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=yd9Tu8Hn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d54214adso36253645e9.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1750087287; x=1750692087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a+DIwXU2L+60g8uk6ftsIvso91a5Gq0Tzk23jdDrW4g=;
        b=yd9Tu8HndsGCaG3EaMcuwICN27D8NTKvK3xrPoY2u6kU7f7Zu7+F/vOI5W1Hw3yso3
         Fpy7XjstEeJ8V1UaagRWPYEFAHxe2iqYMc7wm3nmrTV9rwMlTLQxS8Y9aICLMkvxt4RM
         X5DBfffZrtvYOyTBHtSM61el59QdQeM7q4AFUc/WY6ShTRfgD0qwkDgn5iISazXzHBfx
         LUTE/GyJmnDerc9RA7M0oGqDtgmrT/8SNOafbiNy4lm+an053rhOHj3uaPCd55MyBbw9
         DZ9Kbh4TBporpCQJqsWu6tSO3d+U4t4k/7n4HEMcTpEgFPmmksxPBpsOFj2jJ7KBPNzC
         44EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087287; x=1750692087;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+DIwXU2L+60g8uk6ftsIvso91a5Gq0Tzk23jdDrW4g=;
        b=WR5QNchS7RADeo74R1572MtG/vNksvbJgN1zHOpmNpE4T4Pr/KqXARBUwH+THWmSmm
         XGIgWY1Jt5ZXNW6be1qOMPBRCewh4fs6irb//YzIfyFFlcR7Jp8Rsxb7yeqL4v3cMYkG
         xD6rZJgHjx4WfryvphRB9krr2pUr68Hy3QjtJB/qg93yRIo2Rpz0jv2lxX1Q+WIZ0gqY
         9p8bQXazZyrPQ7xD6Goh2ksN/NmXB0DV/B2eczJCQICzyRHpfAB+xMiu0KD3pLCAvDnM
         yu0K4PPOcn2RYsIhOw8xZe6o58ppWkWK2Ykl2/nf1v1Z2r5mq5fsAXP2pcORMw2y1F8+
         zGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMLlkfYWCVCt3fQwo9TUsPstsqo3gM4qdVOcv/GF1WvLcceTqh1Z9WqYZzs+LE+Qhup/vAmduqfAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJdOAMSJylRcz8Bpuj3/jn/UCnCZgu3fzJ4vAAHWFnyxDtF4R
	WhSknwntky0yxqkUC/UzdDKiEuipwuG/FxAy7PNLFjOykCKY86OjsvjaUv4Y2Fch8o0=
X-Gm-Gg: ASbGncvzUvWG+fOkr5XQoAQ/IzKagc7KyF4OW15fAmfbCv+2r5O0Zf6jAdEtueO2upI
	NaFuEaHGeu1/2xxcbMtWhwPP18OYoQM7lSzCFZvKN1kRMDs+3BmtwHeG2Xcg4SmE/iTnSl+yGZZ
	ff5LqQNykblgrd9LvBdUbq7orQxjx7L4Op+EikaaiMAXotlRnQG49HBrSj9PKTcY5IXwxRObGBr
	2kJ4r7rDD0vzo4Ab8S436ZQS6IJ6n7nh5LsD/0p0xOtUpMDXFlBLyjicWJohyVuy9FlMnQiMNsl
	z24iY3YpvvdBII8yCVk1Sb7u1EyG0yyeXuW02xciJqWMcIFXkVHq9CuZSVr0zQZV7Ts=
X-Google-Smtp-Source: AGHT+IE+n0zcSmOYsebqtq7TETsjNPxycut/07W32TCEdCIwtKSu5T5aSW+1wl8qiRDR+g9UNxIPgA==
X-Received: by 2002:a05:600c:34c3:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-45343f2520bmr59719565e9.8.1750087287293;
        Mon, 16 Jun 2025 08:21:27 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2449f1sm151786325e9.23.2025.06.16.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:21:26 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:21:23 +0300
From: Joe Damato <joe@dama.to>
To: Dave Marquardt <davemarq@linux.ibm.com>, Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v2] Fixed typo in netdevsim documentation
Message-ID: <aFA2c96O-VFXms3G@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Dave Marquardt <davemarq@linux.ibm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250613-netdevsim-typo-fix-v2-1-d4e90aff3f2f@linux.ibm.com>
 <aFA1seeltkOQROVn@MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFA1seeltkOQROVn@MacBook-Air.local>

On Mon, Jun 16, 2025 at 06:18:09PM +0300, Joe Damato wrote:
> On Fri, Jun 13, 2025 at 11:02:23AM -0500, Dave Marquardt wrote:
> > Fixed a typographical error in "Rate objects" section
> > 
> > Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> > ---
> > - Fixed typographical error in "Rate objects" section
> > - Spell checked netdevsim.rst and found no additional errors
> > -
> > ---
> >  Documentation/networking/devlink/netdevsim.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> For future reference, since Breno gave a Reviewed-by for the last patch [1],
> you could have included his tag since there were no substantive changes.
> 
> In any case:
> 
> Reviewed-by: Joe Damato <joe@dama.to>

On second thought... this should target net-next (not net) and should also CC Breno.

Have a look at:

  https://www.kernel.org/doc/html/v5.16/process/submitting-patches.html

  and

  https://www.kernel.org/doc/html/v5.16/networking/netdev-FAQ.html

