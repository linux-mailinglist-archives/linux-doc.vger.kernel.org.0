Return-Path: <linux-doc+bounces-11157-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A267486E1AF
	for <lists+linux-doc@lfdr.de>; Fri,  1 Mar 2024 14:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18E831F22142
	for <lists+linux-doc@lfdr.de>; Fri,  1 Mar 2024 13:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBD76A8B2;
	Fri,  1 Mar 2024 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RVa4J3Wl"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67717E1
	for <linux-doc@vger.kernel.org>; Fri,  1 Mar 2024 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709298929; cv=none; b=AbGPRp7OKHnYXdJATee5TExBUduqrZ19XJ5S3nutr8Q/ejThJ+KvxI8tGl9EX9/3uU1awLxhlnqL+qYhzfUbXQX0ecpNnvBe52+oV03zwctQu2CP4bDi0c1qobwSprAyMwHXS+GR7ZGTvWsWR7Wtn4+Mx8DOJkUUcBJgwAAOK4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709298929; c=relaxed/simple;
	bh=ppxwsid024kYh+xIImopd5C7MqjcjcriC8usZ9HcFiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLXLd8GGmblgzWleqOXQkVCFaF1t3WF5l5IIcbrNmEDgNAKn3fRqn0xpGUF4H0EdsaSlC0hrTcEc5nK5o8RIdBagwob1l9Rjc8s/HT7ek4ZklaiMc3yc5p+F4zHqX4hdxJKSQ7TwUXxlWxTtoO033okk44B4Aeas6ik3irC16fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RVa4J3Wl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709298926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j6JDdzMRW33EgNy8WVE2rwXJul+k7YILcoZp2XURKLI=;
	b=RVa4J3Wlfk1aD4BVAnTbkPGGxMmrunaF2e22Gbsw6fzkGMIXuLhwrLJd4zbSvmYcrO+rq8
	s5Jx1ET5CM0BJUgbAK50GuuUse0ZwxBisABVXUfNjsUcOwD3B41FLy+7GqDpy5aP8x1rp+
	LCg+zqCm8lKB5aBGtkfW3guFtpmuxXs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-JcwEMqy_MPWB8bdwd02G4w-1; Fri, 01 Mar 2024 08:15:24 -0500
X-MC-Unique: JcwEMqy_MPWB8bdwd02G4w-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-512a5c6465bso1589248e87.1
        for <linux-doc@vger.kernel.org>; Fri, 01 Mar 2024 05:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709298922; x=1709903722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6JDdzMRW33EgNy8WVE2rwXJul+k7YILcoZp2XURKLI=;
        b=dCnRpKLQeYYjzcCtQIW00LrGstOX3zF3defZ5IzpfIjKoWjIRwnHVZvZulRdlhkIRz
         SIWi8UdRcX5sYvKdBzEAMteNK3dPIN/vXx8e/GK2rG0ksvT+yPcDnMZGgXeQ9RLbwV5J
         KtFaJWogn5Uj2mXOm1YwUfjU8LkXsLn1w3O0LKJ/GQXkiShnx+BsEdEoN8sH2CG/ELYF
         JRiCXPY1QNJmZpXAgggpOPATqIp0wQDWWrCDgjR7tGF42qnDrORu4SJFkY7SnEMz8u7N
         f5pdNcKp8O4xo8Kt22dQEOylIjkBjZjY0LLQeWPCah6smwJMLgepFW6aozE0HLXDqjW4
         b5Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUbufNsNv0IqiguSxhQsVuDtGrcdiMDaH7YpTn+BZdG9moCYT5vT9Cr9KWRv1RtVJSJHpyEEr5YGAQEhAz971aji7gpCr2E3FtY
X-Gm-Message-State: AOJu0YxbEF2TgGJya3Ywk34RSDV0n1P+YK2aOgfKZC68pFmsSLZpd1Bi
	hSfQrq0658qdJwnTtZ/Org8qfxOCoQO+vnw/LDaQLDlWcrje5n4JoqmuWGVwrEgxVkOeoaY7qtH
	dcHSAyJ6/Bo/KzTrG+jFyH8oEz6iQPR/JNYxC0pk5WASzzDPawekznfU+ng==
X-Received: by 2002:ac2:599b:0:b0:512:f6d3:9998 with SMTP id w27-20020ac2599b000000b00512f6d39998mr1223722lfn.17.1709298922220;
        Fri, 01 Mar 2024 05:15:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwlzt5HlgK0WAcZyh2ZsOJe95EyGGHjhxje8QxMH4nFVP4Pvs9Hg/dbyzZ0Awcz9X/EGacJg==
X-Received: by 2002:ac2:599b:0:b0:512:f6d3:9998 with SMTP id w27-20020ac2599b000000b00512f6d39998mr1223689lfn.17.1709298921881;
        Fri, 01 Mar 2024 05:15:21 -0800 (PST)
Received: from toolbox ([2001:9e8:89a0:c500:c65:1f3a:8c08:2a1d])
        by smtp.gmail.com with ESMTPSA id bw1-20020a0560001f8100b0033db0c866f7sm4639850wrb.11.2024.03.01.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 05:15:21 -0800 (PST)
Date: Fri, 1 Mar 2024 14:15:19 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240301131519.GA10491@toolbox>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
 <20240229194726.GB166694@toolbox>
 <20240301-light-impressive-grasshopper-adabeb@houat>
 <20240301112941.GE166694@toolbox>
 <20240301-loyal-cornflower-oxpecker-83ed59@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301-loyal-cornflower-oxpecker-83ed59@houat>

On Fri, Mar 01, 2024 at 01:12:02PM +0100, Maxime Ripard wrote:
> On Fri, Mar 01, 2024 at 12:29:41PM +0100, Sebastian Wick wrote:
> > On Fri, Mar 01, 2024 at 11:30:56AM +0100, Maxime Ripard wrote:
> > > On Thu, Feb 29, 2024 at 08:47:26PM +0100, Sebastian Wick wrote:
> > > > > @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
> > > > >  /**
> > > > >   * DOC: HDMI connector properties
> > > > >   *
> > > > > + * Broadcast RGB (HDMI specific)
> > > > > + *      Indicates the Quantization Range (Full vs Limited) used. The color
> > > > > + *      processing pipeline will be adjusted to match the value of the
> > > > > + *      property, and the Infoframes will be generated and sent accordingly.
> > > > > + *
> > > > > + *      This property is only relevant if the HDMI output format is RGB. If
> > > > > + *      it's one of the YCbCr variant, it will be ignored and the output will
> > > > > + *      use a limited quantization range.
> > > > 
> > > > Uh, maybe just say that the quantization range is selected automatically
> > > > in case a YCbCr output format is in use. I'm not sure every YCbCr
> > > > variant requires limited and even if it does, new formats could change
> > > > this.
> > > 
> > > I documented what i915 is doing:
> > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display/intel_hdmi.c#L2143
> > 
> > Sure, this is one valid strategy for the automatic behavior of YCbCr.
> > Drivers could also always send an InfoFrame to ensure full range where
> > possible. The point here is that this property shall not affect YCbCr
> > output formats!
> > 
> > Maybe it's even better to say "driver specific" instead of "automatic".
> 
> Honestly, I'm not sure what you want from me here. Ville and you
> insisted on the previous version to document what i915 is doing and to
> follow whatever the behaviour was, and that we shouldn't spend time
> improving the property. Fine, I did that.
> 
> But now, you want me to ... improve the property?

The property has a clear scope: quantization range for RGB output
formats. What Intel does with things that are not in scope of the
property is irrelevant. This isn't improving the property either but
documenting the scope of the property.

Sorry if this seems arbitrary but these details are so important to get
right because the interactions between all the different things is
already majorly broken.

> Maxime
> 


