Return-Path: <linux-doc+bounces-6432-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA46982890F
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 16:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D2111C2393F
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 15:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DD93A1A6;
	Tue,  9 Jan 2024 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Veu3ym9i"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2573A1A2
	for <linux-doc@vger.kernel.org>; Tue,  9 Jan 2024 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-20418dd34e3so506446fac.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jan 2024 07:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1704814356; x=1705419156; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F8I3Nv9FKTpOHBsjhQ9rf60s9dsEhGuM1snjGAzQnEc=;
        b=Veu3ym9inOhrb/N2bO45RDmHxRqO8c8lTo8kdZG3xoU9dqY+YEgP54GoZswDC15RNB
         uDqnnaduxnCBNZ4DOnrGxdo58Cm0WdB15lSjqxXS7HFth79aSlMfuCAiA4lbQ3LKMBMl
         /NdFNKmhy8CXoz2pVq5YPpt0jrcZowFCZaucI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814356; x=1705419156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8I3Nv9FKTpOHBsjhQ9rf60s9dsEhGuM1snjGAzQnEc=;
        b=UtZ5K6jx9GzMAy+63Q5cisyvSD0p2lSkZOqODucEyZ7HhKWF5a0oV7H0zaQB2xHfW9
         plfu9496lPUAzpQsnO+4o8XiGXaerlHZ7zK0Zf9X1zKFp/B2tH/QVzdt2MbJ15Ciyel+
         a3Ium2LwyflZICGp/5XceohcRtf9F107aTRGUGA09zIYeqO2xVDaXeNdTL/sq5hvnqlM
         tN7MPI59g/b3XKSyQtbBNWCrkWozTVV4+bd+NgCoWghNGFrTuMSRf9LeclrxeFRS0Gg1
         Ai8iPudzwYHSkET4XyoXdzNiVVJoI+210HAEiSI/gaWV6b2Ti79QmX7BK158DVCMToBM
         rMEQ==
X-Gm-Message-State: AOJu0Yzuh5HAttFl2gwWsELtDrOswyriUXudqEOSvHsvcAOIFZV1zENe
	9gZAQpqx8Wc2vdL8xHGad7c36x2BCCe0MpW57zpral56qKBsHg==
X-Google-Smtp-Source: AGHT+IFVZSYOh7KqGAWxb6Y3RR7SLa2W95DrHp1wqSB8p0lrUrWpQNHMCRuUiqdJQJSUT9sxUErFsFH3vkt7h7gnbCc=
X-Received: by 2002:a05:6870:f152:b0:1fb:23ec:3318 with SMTP id
 l18-20020a056870f15200b001fb23ec3318mr10480037oac.0.1704814356195; Tue, 09
 Jan 2024 07:32:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106032957.1195-1-rdunlap@infradead.org> <944ca2e6-23d9-44a2-a58c-4380e9ee575f@suse.de>
 <dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org> <ZZ1DIDjGlHP-tmAi@phenom.ffwll.local>
 <CAKMK7uFbjQ1apr3-XrnWTH=TwRqW_9TDZ-21QAwJtiNB5FZ8dA@mail.gmail.com>
 <10b6ec8a-8b58-43a0-a3f8-c6d354b71ee4@infradead.org> <CAKMK7uHwcXq+gSBx1RdJ84OVS0BheyDJp-c7byhR7EfJ0s+qQA@mail.gmail.com>
 <f6feb944-b0dc-4802-a20a-c3ef39f4b0d5@infradead.org>
In-Reply-To: <f6feb944-b0dc-4802-a20a-c3ef39f4b0d5@infradead.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Jan 2024 16:32:25 +0100
Message-ID: <CAKMK7uFkcaP6j0MuHuGWrumJJE4G_n62tQSf5NCSWcCMYMjHtw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vram-helper: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jan 2024 at 16:29, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 1/9/24 07:25, Daniel Vetter wrote:
> > On Tue, 9 Jan 2024 at 16:23, Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >>
> >>
> >> On 1/9/24 05:42, Daniel Vetter wrote:
> >>> On Tue, 9 Jan 2024 at 13:59, Daniel Vetter <daniel@ffwll.ch> wrote:
> >>>>
> >>>> On Mon, Jan 08, 2024 at 01:10:12PM -0800, Randy Dunlap wrote:
> >>>>> Hi Thomas,
> >>>>>
> >>>>> On 1/8/24 00:57, Thomas Zimmermann wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> thanks for the fix.
> >>>>>>
> >>>>>> Am 06.01.24 um 04:29 schrieb Randy Dunlap:
> >>>>>>> Remove the @funcs entry from struct drm_vram_mm to quieten the kernel-doc
> >>>>>>> warning.
> >>>>>>>
> >>>>>>> Use the "define" kernel-doc keyword and an '\' line continuation
> >>>>>>> to fix another kernel-doc warning.
> >>>>>>>
> >>>>>>> drm_gem_vram_helper.h:129: warning: missing initial short description on line:
> >>>>>>>   * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> >>>>>>> drm_gem_vram_helper.h:185: warning: Excess struct member 'funcs' description in 'drm_vram_mm'
> >>>>>>>
> >>>>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >>>>>>> Cc: David Airlie <airlied@gmail.com>
> >>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>>>>>> Cc: dri-devel@lists.freedesktop.org
> >>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
> >>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>>> ---
> >>>>>>> v2: Add commit description
> >>>>>>>
> >>>>>>> base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
> >>>>>>>
> >>>>>>>   include/drm/drm_gem_vram_helper.h |    3 +--
> >>>>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff -- a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> >>>>>>> --- a/include/drm/drm_gem_vram_helper.h
> >>>>>>> +++ b/include/drm/drm_gem_vram_helper.h
> >>>>>>> @@ -126,7 +126,7 @@ drm_gem_vram_plane_helper_cleanup_fb(str
> >>>>>>>                        struct drm_plane_state *old_state);
> >>>>>>>     /**
> >>>>>>> - * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> >>>>>>> + * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
> >>>>>>
> >>>>>> Did something change wrt. doc syntax? I think this used to work without warnings. About this 'define': we don't use is in another docs. Can we leave it out here or is this the new syntax?
> >>>>>>
> >>>>>
> >>>>> There are no doc syntax changes that I know of. This is not
> >>>>> new syntax. It has been around since 2014:
> >>>>>   cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
> >>>>
> >>>> I had no idea this exists, thanks a lot for this TIL :-)
> >>>>
> >>>> I guess the issue here is that this exists, yay, but it's not documented
> >>>> with the other here:
> >>>>
> >>>> https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation
> >>>>
> >>>> I guess a patch to kernel-doc.rst would be great. Adding some kernel-doc
> >>>> folks.
> >>>
> >>> Ok I went ahead and typed that patch (just we don't waste effort),
> >>> just waiting for the sphinx build to finish to make sure it looks nice
> >>> before I send out the patch.
> >>> -Sima
> >>
> >> I sent one a few days ago:
> >>
> >> https://lore.kernel.org/lkml/20240107012400.32587-1-rdunlap@infradead.org/
> >
> > Could you please also add documentation for function-like macros,
> > since that's also missing? With that acked-by: me.
> >
> > Cheers!
>
> This is already present:
>
> Function documentation
> ----------------------
>
> The general format of a function and function-like macro kernel-doc comment is::
>
>   /**
>    * function_name() - Brief description of function.
>    * @arg1: Describe the first argument.
>    * @arg2: Describe the second argument.
>    *        One can provide multiple line descriptions
>    *        for arguments.
>
>
> but the way that you did it makes sense also.

Ah missed that it includes wording for function-like macros. On your
patch as-is:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

