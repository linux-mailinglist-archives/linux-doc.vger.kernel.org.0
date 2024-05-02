Return-Path: <linux-doc+bounces-15635-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFE8B9C40
	for <lists+linux-doc@lfdr.de>; Thu,  2 May 2024 16:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A995B21B8A
	for <lists+linux-doc@lfdr.de>; Thu,  2 May 2024 14:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D1E13C693;
	Thu,  2 May 2024 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hNohV//A"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FB3152788
	for <linux-doc@vger.kernel.org>; Thu,  2 May 2024 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714660099; cv=none; b=h0Lq4exhEJVgRAeube5n6n/UntIN/WspcFn7bzVIHeozaYW96slufVATcXPCqeAcJCAq+b58y4tGZnk4/GU6EsNuHCc+BvplvqylEIYaJVZoL2VLZbIt5RsZi/5/K7wZ67OGVZdsNIIem/W/nNSyQH+Hm73tyLMOBptZWJ6V8Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714660099; c=relaxed/simple;
	bh=CBoc+VmcBDwqKZezMaonoli64pzbejkHNhDkpIw3seQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biBUIByWk8GGM8eLk8oCihtl0N/eFkggsL89o7RpMc16R6zzAIvVOC/NEMN+sCrycDkmvUvBFVNRuSUovYRXoIVPmWxAffWJccGePAgm+rbHiNJ2OceGnmk57g0DrG7wHFz9NAs/nq9yfKbliSzk0XSZVYHnUc2TU+/Fh+hN0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hNohV//A; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6a04bb4f6d5so50621296d6.0
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714660097; x=1715264897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYJ66txjYnvZgvCB5h7LBuLGmwmjeh/xVp4SvQlr1p0=;
        b=hNohV//AIWFmQiHJcs6O/wVLzmlSd7jOIHGiarFiqlb5OZiYxIBEJO+0y28GE78H3t
         f77oguc1f2lWQsAy45SCTgouPy5GP5dpiePj8Qg6PD9M1IvdT8mRdW6sV/n4bd0C//Ye
         4svFIwL2XWJ+WygfTzKiAEq1vdtqtVt7+ZaJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714660097; x=1715264897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYJ66txjYnvZgvCB5h7LBuLGmwmjeh/xVp4SvQlr1p0=;
        b=QiHUpBXIMIIdOh3cMyjuY+7WdMZ3xPjawBvgwQqp1XOp8AuPgE9XitUBiC6GM7Ylw2
         mKzzSU3eckvoe+hE8H8B+pSsCEnzs6bSlrYsDx53+c6/sOGOSQTU29unf9Ab2ld8T6pU
         16+zzKAYd8wb3g8GeWgSP6BnkJ57hYgJTQCK6Hi9No8vtZEX8PYVA4bo9tA8U8l7GFu0
         b3ovqkqAgU1iqPoIPjTksE5GTiQLKBT2IOvDr8x1BdYZ6OkgYwp2+WBzFmJdhrO7GVx6
         qhv7C1OpzeYKY8tKZc9kGBVSyqHAjE5gYa+MSBAKttOFaQXkACwRhcScrM42z8gKDe9f
         Gbug==
X-Forwarded-Encrypted: i=1; AJvYcCXXp0SfSlpI0XFL8ctvL0W6XvYj+++1Rd2Lu7aWr4+kSTz+Fl8nfbfxK+2f6Ed+azAnFstnafIRGsDh1emo3YrPz9zJSr7Rut5+
X-Gm-Message-State: AOJu0YxZN6KS95uepR2PXacHhiBynBvhNqydLFYx7FqfXGLk/aL9A6gP
	VL47J3mc/QJcqJA8QdSrlYffDFQGR8x5e0oDowxagT50tiqMx6FGU3rWT7ct6sgK6EjjoM9Usbs
	=
X-Google-Smtp-Source: AGHT+IHHiE3Vbuy3neY2oVyLNT8TxRLN5zZioODSMN6V812vY7WBymhb1hQR5A5tsqiWImpgsbppoQ==
X-Received: by 2002:ad4:5ec9:0:b0:6a0:c707:1bed with SMTP id jm9-20020ad45ec9000000b006a0c7071bedmr7112616qvb.42.1714660097038;
        Thu, 02 May 2024 07:28:17 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id o14-20020a0cfa8e000000b006a0f63bcea6sm392447qvn.29.2024.05.02.07.28.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 07:28:16 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43989e6ca42so464481cf.0
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 07:28:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1+J6c28iyu110+5mOFrk0Cp1HMOoDZdogsJy3XK4n7eFhWeAwX/GQnUfN8K1hfSQDXCI7J87BQYiZfC4g4bUMjI2JJJ6XGRV7
X-Received: by 2002:ac8:59c9:0:b0:43b:af4:d3a with SMTP id d75a77b69052e-43caf9ca7d8mr2729291cf.19.1714660095878;
 Thu, 02 May 2024 07:28:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org> <a8a73fc4-7699-4c47-8970-cd68be0fe1d9@linaro.org>
In-Reply-To: <a8a73fc4-7699-4c47-8970-cd68be0fe1d9@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 May 2024 07:27:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VciR5UEQpvizrUNYR7mhE2P4ESvM2T7v4mUT3UpdX3bg@mail.gmail.com>
Message-ID: <CAD=FV=VciR5UEQpvizrUNYR7mhE2P4ESvM2T7v4mUT3UpdX3bg@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] drm/mipi-dsi: Reduce bloat and add funcs for
 cleaner init seqs
To: neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Hsin-Yi Wang <hsinyi@google.com>, 
	Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
	Javier Martinez Canillas <javierm@redhat.com>, Joel Selvaraj <jo@jsfamily.in>, 
	lvzhaoxiong@huaqin.corp-partner.google.com, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 2, 2024 at 12:48=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 01/05/2024 17:41, Douglas Anderson wrote:
> > The consensus of many DRM folks is that we want to move away from DSI
> > drivers defining tables of init commands. Instead, we want to move to
> > init functions that can use common DRM functions. The issue thus far
> > has been that using the macros mipi_dsi_generic_write_seq() and
> > mipi_dsi_dcs_write_seq() bloats the driver using them.
> >
> > While trying to solve bloat, we realized that the majority of the it
> > was easy to solve. This series solves the bloat for existing drivers
> > by moving the printout outside of the macro.
> >
> > During discussion of my v1 patch to fix the bloat [1], we also decided
> > that we really want to change the way that drivers deal with init
> > sequences to make it clearer. In addition to being cleaner, a side
> > effect of moving drivers to the new style reduces bloat _even more_.
> >
> > This series also contains a few minor fixes / cleanups that I found
> > along the way.
> >
> > This series converts four drivers over to the new
> > mipi_dsi_dcs_write_seq_multi() function. Not all conversions have been
> > tested, but hopefully they are straightforward enough. I'd appreciate
> > testing.
> >
> > NOTE: In v3 I tried to incorporate the feedback from v2. I also
> > converted the other two panels I could find that used table-based
> > initialization.
> >
> > [1] https://lore.kernel.org/r/20240424172017.1.Id15fae80582bc74a0d4f133=
8987fa375738f45b9@changeid
> >
> > Changes in v3:
> > - ("mipi_dsi_*_write functions don't need to ratelimit...") moved earli=
er.
> > - Add a TODO item for cleaning up the deprecated macros/functions.
> > - Fix spacing of init function.
> > - Inline kerneldoc comments for struct mipi_dsi_multi_context.
> > - Rebased upon patch to remove ratelimit of prints.
> > - Remove an unneeded error print.
> > - Squash boe-tv101wum-nl6 lowercase patch into main patch
> > - Use %zd in print instead of casting errors to int.
> > - drm/panel: ili9882t: Don't use a table for initting panels
> > - drm/panel: innolux-p079zca: Don't use a table for initting panels
> >
> > Changes in v2:
> > - Add some comments to the macros about printing and returning.
> > - Change the way err value is handled in prep for next patch.
> > - Modify commit message now that this is part of a series.
> > - Rebased upon patches to avoid theoretical int overflow.
> > - drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq(=
)
> > - drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_=
seq()
> > - drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
> > - drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit prin=
ts
> > - drm/panel: boe-tv101wum-nl6: Convert hex to lowercase
> > - drm/panel: boe-tv101wum-nl6: Don't use a table for initting commands
> > - drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
> >
> > Douglas Anderson (9):
> >    drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq=
()
> >    drm/mipi-dsi: Fix theoretical int overflow in
> >      mipi_dsi_generic_write_seq()
> >    drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit
> >      prints
> >    drm/mipi-dsi: Reduce driver bloat of mipi_dsi_*_write_seq()
> >    drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
> >    drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi(=
)
> >    drm/panel: boe-tv101wum-nl6: Don't use a table for initting panels
> >    drm/panel: ili9882t: Don't use a table for initting panels
> >    drm/panel: innolux-p079zca: Don't use a table for initting panels
>
> Thanks Doug!
>
> I think we all agree on the core changes, now I think we can wait a few w=
eeks
> and try to get some test feedbacks on the indirectly and directly affecte=
d
> panels, drm-misc-next won't be merged into linux-next until v6.10-rc1 any=
way
> so we have some time to test on our boards.

Great!

Just to be clear, are you suggesting that we leave these patches on
the lists for a few weeks before landing in drm-misc-next, or are you
suggesting that it's safe to land them in drm-misc-next because it
won't make it to linuxnext for a while anyway? I assume the former
(AKA leave it on the lists for a while) but just want to be clear. ;-)

There's nothing terribly urgent about these patches except that they
are blocking Cong Yang's patch series [0] and lvzhaoxiong's patch
series [1]. I think it would be fine for them to send out their patch
series with mine marked as a dependency so we can finish reviewing
their series and then when mine lands theirs will be good to go too.

Maybe we can aim for 2 weeks of stewing on the list if there are no
issues during that time? I know landing in drm-misc during this time
won't help get into mainline faster, but with ChromeOS's "upstream
first" policy it saves us a bunch of headache if we can land things in
our tree from a maintainer tree with stable git hashes (like
drm-misc-next) instead of landing from a mailing list. Certainly that
doesn't mean we want to rush patches in before they're ready, but I
just want to say that there is still some benefit in getting the
patches landed sooner rather than later. :-)

[0] https://lore.kernel.org/r/20240424023010.2099949-1-yangcong5@huaqin.cor=
p-partner.google.com
[1] https://lore.kernel.org/r/20240418081548.12160-3-lvzhaoxiong@huaqin.cor=
p-partner.google.com

