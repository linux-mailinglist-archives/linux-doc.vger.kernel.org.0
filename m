Return-Path: <linux-doc+bounces-38468-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0635BA39BF3
	for <lists+linux-doc@lfdr.de>; Tue, 18 Feb 2025 13:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 284517A51B2
	for <lists+linux-doc@lfdr.de>; Tue, 18 Feb 2025 12:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB902417F1;
	Tue, 18 Feb 2025 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UDcNjbTD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA562417D9
	for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880890; cv=none; b=IxsMOInf2rt6gl9NkJ826K0S6CrVCFpircHnhqH6v71h7GG/vSh+rlM0giqtHpDZ6LirnT30vCM0sBH3Y6hmaO4qFhPmdnuMweAsl+RgxnN+YRCVLH9ymBLsPuJM4i/qkqkCVaZKCDvAPwzJJ8jmFzAmVQ2vqD/aPN/Mg8h5mts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880890; c=relaxed/simple;
	bh=C/Is0xdze+hQVq89VghxK/XTnw4+Y8GKlxKYUALCUWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buRow6m0Ik0dD2+0wqKL1sG0rrcGg8DYXIiPOic/J2XDdaMXpCLbU+uv4TClItnt4l4DwR/ODlQs09zBlDtNGp/MnRnWr8rB1pRry4/CUb9Z2y89mTrpfeCLbFNiAKw449KQhtSBWZR2ZrUq7V2qhJsUFehtShfladz1xhb0xFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UDcNjbTD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30761be8fa8so59007931fa.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 04:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739880886; x=1740485686; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LAbvVw7Ic6dqBTqHKxGeWC/7bVyNwl4nKrDf3x382TY=;
        b=UDcNjbTDtG7HvbR4I9Son6ej72DyyHVBsxuJx4ZjfDTincO7AVMU3VzF0j/dyvobjU
         fyzWSITTAqpPJQxgdnZ6RRhQw0qGYupOUAKrG+Kq15pKJ0Wy3R0rDflrrNneG5TzE49s
         IORceGCoQUug5d/aKxsRFuIMtBzN7+wv0Tz7HjKJW6yJMcu/lTeZznL4gCNSgrSelIVp
         TJUSO4moomaW2a7mDTe9OkDTrxifcRGS5lgzj6hk8F6CxYmOhO5dp9IAsM1PfTNiLy5C
         kdPtpmUyXF1pXU7RYIGOj3SGLE0hbErWHQxow+8syCu2jjZyoXtIGQ4NmUs50F6nxFZc
         uNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739880886; x=1740485686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAbvVw7Ic6dqBTqHKxGeWC/7bVyNwl4nKrDf3x382TY=;
        b=Z8W8qFuK7MRc1UbQkXHIuHe6gNIRXNlKwauwdg6FqAf8cb3v2gMvnv7M7yuEJsPKX7
         kCvqb2WDfCJyolrtgM0/IWRW2bhyE4IjlzOizOWxmEcBxu/t9wAPS/+vqm3ZV0NTlYJm
         AZWxB/aRWZ0UIuXIMLq3qq0bAekB4g26Nxh3skNozM7EJPZ6zAaoU8mhOgWWgRZqWygD
         4qovcOfSRguaNBk0jNJvq7MUPmmvHL5IeG0I9PiErz6XLE8f7VuYEkxVZ5OV7/CIUoqe
         Z851QfpmZTHZJ90FJlUJYUIKDGOEGcn+hW/MDqUc4lE1n2EGKks51L2J/wzUqQCdF/2E
         QQDg==
X-Forwarded-Encrypted: i=1; AJvYcCXSLzmGGrb7V1o3jU+YmfeC0Ts4wBM0fi7s+OkjkvZy4rPLjLC0YlD6u4BgJgiFJ8IVVx5l3ACE4GA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5wUk0A8Ydk1CAeFt8LtYeCqI42EdU2qMzZBaHfc+OGO/oj6sy
	XxHeETOOaV3KDHRSC0pePVDkHsAcDLAusvZd6F57Anl4IsUK5SG1MgSPlSTBBLLqASaxbZ1eofY
	n
X-Gm-Gg: ASbGncsR5/W4/BxqL9HwgdVq0l5EGQKpXIQY9dpGbdw2nFautZh3DuzFvC6dQQfBx1m
	eBOqwBX+Sd6YwXP8Mbe0figI9uKzpdlIZRsa+eiY/JRDyflfmSwpi8MjA+PeFNIFvHvlxx5HkX6
	ngLy8dXzWDsFhQ3cV/FifMITMW1tUoU+kXpo20iiDKYZIKaJLzRU2CLejBGfTdXyOufK9RZpRPk
	Og58URvtE309UbXZWNRVoNkR9Zf4XQtRvgrmpHJhhp3ywGKlIrkPstauDx1LXp45qN09kTZHFEH
	uppfL27MHFBnXiLQjlJLOBiqcTspmPbGcTQt3y8kjKEVSYD7ZCL8rJqf69vSxB5qHhC/ZO0=
X-Google-Smtp-Source: AGHT+IF6AAq0z6X4U1x73BkyxvJFRwy8V69OthYTxy/w5cJfeaIMCbsxrPSvj127AN4NZvNVoTBUaw==
X-Received: by 2002:a2e:95d7:0:b0:307:46f3:4e92 with SMTP id 38308e7fff4ca-30927b128d4mr41674151fa.32.1739880886356;
        Tue, 18 Feb 2025 04:14:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a303a659fsm7266191fa.106.2025.02.18.04.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 04:14:45 -0800 (PST)
Date: Tue, 18 Feb 2025 14:14:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jianhua Lu <lujianhua000@gmail.com>, 
	Robert Chiras <robert.chiras@nxp.com>, Artur Weber <aweber.kernel@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: Re: [PATCH 00/20] drm/panel: Move to using mipi_dsi_*_multi()
 variants when available
Message-ID: <ynmxaimdwkwfiryz5le5vpnfh5fzh5se4ebyqzkbnq355me76x@yxtyan3niivb>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
 <20250218-fabulous-agile-corgi-9a5ee0@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218-fabulous-agile-corgi-9a5ee0@houat>

On Tue, Feb 18, 2025 at 10:55:49AM +0100, Maxime Ripard wrote:
> On Fri, Feb 14, 2025 at 08:26:02AM -0800, Doug Anderson wrote:
> > Hi,
> > 
> > On Thu, Feb 13, 2025 at 12:44 PM Anusha Srivatsa <asrivats@redhat.com> wrote:
> > >
> > > A lot of mipi API are deprecated and have a _multi() variant
> > > which is the preferred way forward. This covers  TODO in the
> > > gpu Documentation:[1]
> > >
> > > An incomplete effort was made in the previous version
> > > to address this[2]. It removed on the mipi_dsi_dcs_write_seq()
> > > and mipi_dsi_generic_write_seq_multi() with the respective
> > > replacemts and not the rest of the API.
> > 
> > You didn't seem to take most of the suggestions I gave in response to
> > your v1 [3]. Specifically:
> > 
> > a) I asked that you CC Tejas. I've added him again.
> > 
> > b) I asked that you CC me on the whole patch series, which you didn't
> > do. I can find them, but I'd find it convenient in this case for them
> > to be in my Inbox.
> > 
> > The first patch conflicts with what Tejas already landed in
> > drm-misc-next. See commit 8025f23728e9 ("drm/panel:
> > xinpeng-xpp055c272: transition to mipi_dsi wrapped functions"). The
> > second patch _also_ conflicts with what Tejas already landed. See
> > commit f4dd4cb79f9e ("drm/panel: visionox-r66451: transition to
> > mipi_dsi wrapped functions"). Later patches also also conflict. See
> > commit 0d6c9edf9e5b ("drm/panel: ebbg-ft8719: transition to mipi_dsi
> > wrapped functions"), commit ce8c69ec90ca ("drm/panel:
> > samsung-s6e88a0-ams452ef01: transition to mipi_dsi wrapped
> > functions"), and commit 7e3bf00047cd ("drm/panel: sharp-ls060t1sx01:
> > transition to mipi_dsi wrapped functions"). Maybe you should sync up
> > with drm-misc-next before submitting.
> 
> Yes, you should definitely work from drm-misc-next there, and sync with
> Tejas.
> 
> > I also questioned whether this really made sense to try to do with a
> > Coccinelle script and I still don't think so. It looks like Dmitry has
> > already reviewed the first few of your patches and has repeated my
> > advice. If you want to help with the effort of addressing this TODO
> > item then that's great, but I'll stop reviewing (and start silently
> > deleting) any future submissions of yours that say that they're done
> > entirely with a Coccinelle script unless you address this point and
> > convince me that your Coccinelle script is really smart enough to
> > handle all the corner cases. I'll also assert that you should review
> > Tejas's submissions to see how these conversions are expected to go.
> 
> I couldn't find that in your first answer though. What corner cases do
> you have in mind, and why do you think coccinelle can't handle them?

As can be seen from the reviews:

- sleeps between DSI calls
- properly propagating the error at the end of the function
- making decision whether to create the context at the caller or the
  callee side. E.g. in patch 8 it is better to allocate context in
  hx8394_enable() and pass it to .init_sequence() instead of keeping
  some of error handling.

> Also, why do you think ignoring a contributor after a second mistake is
> a reasonable reaction?
> 
> Anusha, most of those comments aren't the end of the discussion though.
> If you feel like something's not clear enough or ambiguous, feel free to
> ask for more details and keep the discussion going.

From my side: feel free to ask for the details if any of the emails is
not clear enough. At the same time, please review your patches before
sending them. Returning 0 in case there was an error is an obvious
issue.

-- 
With best wishes
Dmitry

