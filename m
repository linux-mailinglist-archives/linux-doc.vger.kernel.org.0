Return-Path: <linux-doc+bounces-19188-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F71B912ECC
	for <lists+linux-doc@lfdr.de>; Fri, 21 Jun 2024 22:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25568284F04
	for <lists+linux-doc@lfdr.de>; Fri, 21 Jun 2024 20:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6422717C212;
	Fri, 21 Jun 2024 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IzAppRSZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B971117BB37
	for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 20:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719002833; cv=none; b=f2E9SSKLiixPHds8UKTZP2v+t7gAaAr3jiVNlAFlflD7oJx9Wu5twn4rgLzWp3bhZfL6/sWJGad1mCeF4IgMV1UXyyWp4QmIe971gOGjl9l96Kocpwi8i5/DOJyxTgKNhgkNyqbFha0C+4MYmqI3hMTN/EWxws0nApEgU9aOVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719002833; c=relaxed/simple;
	bh=HRE+U2dgfJBzfQ6M8EvZDTIQ+wtvm4IcQYuk3+o/GOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6+N68F91hjQo4xUHSqZvGfkXwKluP9gdwpNtFA3tTBltWNiKU20pPSGfgBsHG+l2nbYb4W1CUyT04d7g4ivd0KhrcCRXs8wK6zeD4YGIxEyd0aDbbmbbRrQEBPe2EIFpKXGeuF5SXLZtFZsEGO7VKuXXSe74HipqWxh4FtLc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IzAppRSZ; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-627e3368394so24656947b3.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 13:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719002829; x=1719607629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vvcq6KNwg3xO4omyLiVP0kO5WMfy03mczyeSqWYQtY=;
        b=IzAppRSZCxQQd0LyMdTPMSVlR6QGhL1rKPG2JCf5B1hHxoKK4s8GuKah/WNuxuMNIB
         Zwjb+NIG/Hv22zJmuIY5AiSPr7MdwzsZoBt/Vocz49GLv5sgWA8Has3uhBA0rTvdx8+v
         y8HjmPtePInbC+r11xD7le/gZJ/ai3a3NdSuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719002829; x=1719607629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vvcq6KNwg3xO4omyLiVP0kO5WMfy03mczyeSqWYQtY=;
        b=FU3OA8q2lgGooZ4SVt2X62lRP/KT4ClBG/XiQyS0gTI2ru4fVTW0dc+VXrO8bJT8JZ
         35quIiBIBZ08S1RUgZGBHhq5CKd5cPbTHtk+4w0pJdWx2NumHq7jnuamunarwBHtu1nH
         ZKtfICj0VxSlMtXNPtokaD+e9YTtnQnHRoIsO+ul2+rxU74/1DTjLnqaokSRFkk0Cxoq
         W2B1qFlUXwARijW8ynOl36ewBiJpPZfeVme4/MkqUpkywQnN4rDUfGf4WC47D0hjJ9cH
         ZhJrjvy/VtFTH6E/BBN5dl1LJIN31d7ch/aLrHXJQfz17ekHaYhvvxKoAqwQjDWgcjYB
         uB5A==
X-Forwarded-Encrypted: i=1; AJvYcCUjGcn4aCho/3cfP9dHqfpBx8bRB8EiunIQNlJxHEjHeZ28AoWawORPiW29nUuXbczmaA4JA4C2OogrFqeL902C0EB7oGvazJmt
X-Gm-Message-State: AOJu0YwzzuS5zhAVjRMxyoWxpoaPQPfTieudeF86Y8Lt3Upja0RzKGis
	mhoiWkngV4EWJBH4ZLs2wgJhhNzhZOIoT/Q85BYgRvgw6aqkVk3K3xR0sMlEpvJDHr2dwMoaa9A
	=
X-Google-Smtp-Source: AGHT+IFVElvUGw94j8+SQC1hqAYV9NoEHsUH/hDAWd0scLMnFDIx8o2ATAj7ncKaA6WYR1zIlKeNuQ==
X-Received: by 2002:a81:be0b:0:b0:627:7f2a:3b0a with SMTP id 00721157ae682-63a8e4bb102mr98942847b3.31.1719002829441;
        Fri, 21 Jun 2024 13:47:09 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ef30b95sm12111356d6.98.2024.06.21.13.47.08
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 13:47:08 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-443580f290dso472141cf.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 13:47:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPvLEOKDyImFLwxxmwbf7Cnwd7+Us15BsqqHSgwfi5GCPSPVkik/H+ixo4igoTYCksI+yYjpHSsKToIg9nqKg/z6s0TppAZNm7
X-Received: by 2002:a05:622a:38e:b0:441:565e:8d31 with SMTP id
 d75a77b69052e-444ce32b611mr440721cf.19.1719002828083; Fri, 21 Jun 2024
 13:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
In-Reply-To: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Jun 2024 13:46:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VwebY8F3XjeVt6kvKwB7QZ8Khn5oJJoDThuemiGx9y+g@mail.gmail.com>
Message-ID: <CAD=FV=VwebY8F3XjeVt6kvKwB7QZ8Khn5oJJoDThuemiGx9y+g@mail.gmail.com>
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

On Fri, Jun 21, 2024 at 1:45=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> At shutdown if you've got a _properly_ coded DRM modeset driver then
> you'll get these two warnings at shutdown time:
>
>   Skipping disable of already disabled panel
>   Skipping unprepare of already unprepared panel
>
> These warnings are ugly and sound concerning, but they're actually a
> sign of a properly working system. That's not great.
>
> We're not ready to get rid of the calls to drm_panel_disable() and
> drm_panel_unprepare() because we're not 100% convinced that all DRM
> modeset drivers are properly calling drm_atomic_helper_shutdown() or
> drm_helper_force_disable_all() at the right times. However, having the
> warning show up for correctly working systems is bad.
>
> As a bit of a workaround, add some "if" tests to try to avoid the
> warning on correctly working systems. Also add some comments and
> update the TODO items in the hopes that future developers won't be too
> confused by what's going on here.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch came out of discussion on dri-devel on 2024-06-21
> [1]. NOTE: I have put all changes into one patch since it didn't seem
> to add anything to break up the updating of the TODO or the comments
> in the core into separate patches since the patch is all about one
> topic and all code is expected to land in the same tree.
>
> Previous versions:
> v0: https://lore.kernel.org/r/20240604172305.v3.24.Ieb287c2c3ee3f6d3b0d5f=
49b29f746b93621749c@changeid/
> v1: https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b2=
9f746b93621749c@changeid
>
> [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=3Ddri-devel&d=
ate=3D2024-06-21
>
>  Documentation/gpu/todo.rst           | 35 +++++++++++++---------------
>  drivers/gpu/drm/drm_panel.c          | 18 ++++++++++++++
>  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++-------
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++-------
>  4 files changed, 68 insertions(+), 37 deletions(-)

Ugh! I realized right after I hit "send" that I forgot to mark this as
V2 and give it version history. Sorry! :( Please consider this to be
v2. It's basically totally different than v1 based on today's IRC
discussion, which should be linked above.

If I need to send a new version I will send it as v3.

-Doug

