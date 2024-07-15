Return-Path: <linux-doc+bounces-20719-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662829318A3
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jul 2024 18:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA50EB2298C
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jul 2024 16:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D792423749;
	Mon, 15 Jul 2024 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XU6zqNTr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3775E46556
	for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061629; cv=none; b=qIL7rg+KCFqyPMKLSmthJwtJ++Tjnr0D8DuN9ZkIYlIJNzA+ckTbk2t/KgAO6l0bUJ+SFhVHXWpHIENkUpZ12MtAkijvb5g5+v/vUcFSNTMvVvgRma22vwHdEeje7+shhnFmj7iik8QqAJTiYkDaxExaMhkPN867IIPziAjbr5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061629; c=relaxed/simple;
	bh=kBWBnjXh7VOgbtn1rxNBCQXca9txmQle+V4SDlhC8HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFDhEQCi+Qd2tESZf7BqumhobV/1yrMzYLctpmaxMKzrZTmSEyeBnA6LZfEgNwhQF197mxJsAX8hG+IdazRN/ZKvVHe9YEX42G+wuJkHVk3ffrWOaotHAS+lwc7a2O2iX0uNqEhUXwqSr9s9bWMJk5zWBMckegP/JU2/7txYKs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XU6zqNTr; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6b5e760eb36so27096856d6.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 09:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721061623; x=1721666423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q43fP/YwIscAu2HdaErO2TBIovUlIaQMWdgLOPVgO94=;
        b=XU6zqNTryXv3s8FpkljJm3gLDCklCN+bU5KnWRob2tJPRx1V8AfNoH+9fSaeZnOQRa
         nF+wGCC1PehulayCbhiCwIn/+9hrCBTjCmSW/TktrSojHIWaBulYlntSdZz009aGY4In
         dLoCPE9Q4FIzYAW+kH69YRnrhP/a48uUpNks4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721061623; x=1721666423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q43fP/YwIscAu2HdaErO2TBIovUlIaQMWdgLOPVgO94=;
        b=KEJhHzPc0iu1vhJ4/C0qR9Qs6vODZZA286U9XMY6RTrZVJ7nRhQNITZHmeyjgf0Lbi
         Qc4n1WouJVC689nC/aCp0EAKbpMBznfxja7Gg8ubmyIibqpiqrmXVY3pwiSLFtVwEZ64
         oyrKVni3LxLY1tOhQcfVf1d3nopyY2JVm17dLkL386D7jhdcbZiweKixMZWM2HyUNtxc
         xtWptZmMN0aOQ8ggoRGNv7mglcjSjOBB5vJ/NkABqsiZzLvQ237vUbEJ2q3ovoHNAoZT
         NKxZiLDO4f0AhvORNZPun1fgF6ePKSyufu9dAAJG1QavaC7wL1Vl439Ia0uXh4xjk+oW
         GkFg==
X-Forwarded-Encrypted: i=1; AJvYcCXm/XRqTEFu2noHGOZhzyRrvWbQg8hckbpaiRsb29O6kpxjHTuX0WXValP4/xw4yjk3mi6NzQGqtF2uKgRNczKqNaNYgLqm1qK1
X-Gm-Message-State: AOJu0YyvCj9f5YC5cb7vmrZqZZkyDB7M8tJ5Wu15rJJUiYxJw+EeKD3t
	TaPNpYYVoJnPo6l4vp26t4xLgTkT/mm15QXNSx8F+94ZJpYcTj765muMWzOCQM/USBRktHyTeD4
	=
X-Google-Smtp-Source: AGHT+IGcJJyw0jBolKvZLF7RX5nZfyooNXBQVFzJTJusaCN9snArWsC+AgiNNm8ExbPLlNt0NhYBlw==
X-Received: by 2002:a05:6214:19cb:b0:6b5:e663:4d4d with SMTP id 6a1803df08f44-6b77deb47a3mr2908416d6.30.1721061623121;
        Mon, 15 Jul 2024 09:40:23 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b76197d5b3sm22775056d6.41.2024.07.15.09.40.21
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 09:40:22 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-447f8aa87bfso7401cf.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 09:40:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJLydzP7AuVzxIvxIbZccVJo9hGeoLlPGOmeful6CQ68WtkC1R01eF9PQfmu1l85/h8z1smYkP5LugefeUP3FW2n72ke+kCf6w
X-Received: by 2002:ac8:6908:0:b0:447:e497:95d0 with SMTP id
 d75a77b69052e-44f5ac90b7dmr6164531cf.17.1721061621306; Mon, 15 Jul 2024
 09:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <CAD=FV=VwebY8F3XjeVt6kvKwB7QZ8Khn5oJJoDThuemiGx9y+g@mail.gmail.com>
In-Reply-To: <CAD=FV=VwebY8F3XjeVt6kvKwB7QZ8Khn5oJJoDThuemiGx9y+g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jul 2024 09:40:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UdsuEiyPK2K3sYdQm50WNukA5pxD=wUaEAVQStNnNA_A@mail.gmail.com>
Message-ID: <CAD=FV=UdsuEiyPK2K3sYdQm50WNukA5pxD=wUaEAVQStNnNA_A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chris Morgan <macromorgan@hotmail.com>, 
	Yuran Pereira <yuran.pereira@hotmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 21, 2024 at 1:46=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Jun 21, 2024 at 1:45=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > At shutdown if you've got a _properly_ coded DRM modeset driver then
> > you'll get these two warnings at shutdown time:
> >
> >   Skipping disable of already disabled panel
> >   Skipping unprepare of already unprepared panel
> >
> > These warnings are ugly and sound concerning, but they're actually a
> > sign of a properly working system. That's not great.
> >
> > We're not ready to get rid of the calls to drm_panel_disable() and
> > drm_panel_unprepare() because we're not 100% convinced that all DRM
> > modeset drivers are properly calling drm_atomic_helper_shutdown() or
> > drm_helper_force_disable_all() at the right times. However, having the
> > warning show up for correctly working systems is bad.
> >
> > As a bit of a workaround, add some "if" tests to try to avoid the
> > warning on correctly working systems. Also add some comments and
> > update the TODO items in the hopes that future developers won't be too
> > confused by what's going on here.
> >
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This patch came out of discussion on dri-devel on 2024-06-21
> > [1]. NOTE: I have put all changes into one patch since it didn't seem
> > to add anything to break up the updating of the TODO or the comments
> > in the core into separate patches since the patch is all about one
> > topic and all code is expected to land in the same tree.
> >
> > Previous versions:
> > v0: https://lore.kernel.org/r/20240604172305.v3.24.Ieb287c2c3ee3f6d3b0d=
5f49b29f746b93621749c@changeid/
> > v1: https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49=
b29f746b93621749c@changeid
> >
> > [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=3Ddri-devel=
&date=3D2024-06-21
> >
> >  Documentation/gpu/todo.rst           | 35 +++++++++++++---------------
> >  drivers/gpu/drm/drm_panel.c          | 18 ++++++++++++++
> >  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++-------
> >  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++-------
> >  4 files changed, 68 insertions(+), 37 deletions(-)
>
> Ugh! I realized right after I hit "send" that I forgot to mark this as
> V2 and give it version history. Sorry! :( Please consider this to be
> v2. It's basically totally different than v1 based on today's IRC
> discussion, which should be linked above.
>
> If I need to send a new version I will send it as v3.

Is anyone willing to give me a Reviewed-by and/or Acked by for this
patch? ...or does anything want me to make any changes? Given all the
discussion we had, it would be nice to get this landed before we
forget what we agreed upon. :-P

-Doug

