Return-Path: <linux-doc+bounces-6397-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230708286B7
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 14:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4935A1C242DA
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 13:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1323C07B;
	Tue,  9 Jan 2024 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="VKt5oT3W"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A7E3C08A
	for <linux-doc@vger.kernel.org>; Tue,  9 Jan 2024 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5578cb9645bso783430a12.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jan 2024 04:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1704805155; x=1705409955; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ajGb4247KZo9KXfE9A+LGftI6qScHSAY4EbVlCZxC6s=;
        b=VKt5oT3WoqRwa1/1uzCt/kEqheUAL9ZbLIGAY5gMKLStruIqP/5OoD96CBvNpc+LQZ
         bgbDtYSEoGWkc+9NgDV5t8bylT2ezozVYcFTGcltJjhfk66yA1zaVzNdjSG64iBgp8Oa
         qP8d5pa1nhqgPv+LwpbbJZ3r48anBQiLUYsHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805155; x=1705409955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajGb4247KZo9KXfE9A+LGftI6qScHSAY4EbVlCZxC6s=;
        b=tg2TM2o/AcZSSEBd9/EK2oe+Ncjpbpq1sSdUY1OlV9ksYq8RaiObqdObWvBJjjPU2/
         my+LKnCZf7Kv5MsnPxrvrVO+gJKiJQFk2pGa/vCEgL5nyeaINeZ4RcNWP6+WUNb/8/4E
         lyajn7F8Okwjd43SYfFTCJPoXppvmdQwpSYFfqid3nM9duu3/YcDkSB95HvSOqtM6Mtc
         WYMbBbNfFq6T/zuGgkAniZyIWhhc2TK7xqwoYVOTV6l6U8ayilJMSWK5gYB3PMap30qI
         bUgUYlC8HHzlitCj4cc4jodoyfdXmv+duSiX1D7u1DGfFU788ZEevMu1kYBVNsBYa2u9
         fUUw==
X-Gm-Message-State: AOJu0YzeGP6OsR4777BK468+RGEFcf06TUvy7eUa6Oqxex+fP5DwKYbH
	HxMqwaXv3U46KIZ4U/57qsGbOqASYxGZRg==
X-Google-Smtp-Source: AGHT+IEiNvJtidM6AfcfTl6aPABFX/Lddd3jmaxaqV9/ccBNBWaa06ww2Vw6qpTZsv2fGb9xghRo+Q==
X-Received: by 2002:a17:906:6c86:b0:a2b:1e1a:ac4c with SMTP id s6-20020a1709066c8600b00a2b1e1aac4cmr1481053ejr.6.1704805155545;
        Tue, 09 Jan 2024 04:59:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id la8-20020a170906ad8800b00a2af8872e9bsm1042408ejb.14.2024.01.09.04.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:59:14 -0800 (PST)
Date: Tue, 9 Jan 2024 13:59:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2] drm/vram-helper: fix kernel-doc warnings
Message-ID: <ZZ1DIDjGlHP-tmAi@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
References: <20240106032957.1195-1-rdunlap@infradead.org>
 <944ca2e6-23d9-44a2-a58c-4380e9ee575f@suse.de>
 <dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org>
X-Operating-System: Linux phenom 6.5.0-4-amd64 

On Mon, Jan 08, 2024 at 01:10:12PM -0800, Randy Dunlap wrote:
> Hi Thomas,
> 
> On 1/8/24 00:57, Thomas Zimmermann wrote:
> > Hi,
> > 
> > thanks for the fix.
> > 
> > Am 06.01.24 um 04:29 schrieb Randy Dunlap:
> >> Remove the @funcs entry from struct drm_vram_mm to quieten the kernel-doc
> >> warning.
> >>
> >> Use the "define" kernel-doc keyword and an '\' line continuation
> >> to fix another kernel-doc warning.
> >>
> >> drm_gem_vram_helper.h:129: warning: missing initial short description on line:
> >>   * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> >> drm_gem_vram_helper.h:185: warning: Excess struct member 'funcs' description in 'drm_vram_mm'
> >>
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >> v2: Add commit description
> >>
> >> base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
> >>
> >>   include/drm/drm_gem_vram_helper.h |    3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff -- a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> >> --- a/include/drm/drm_gem_vram_helper.h
> >> +++ b/include/drm/drm_gem_vram_helper.h
> >> @@ -126,7 +126,7 @@ drm_gem_vram_plane_helper_cleanup_fb(str
> >>                        struct drm_plane_state *old_state);
> >>     /**
> >> - * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> >> + * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
> > 
> > Did something change wrt. doc syntax? I think this used to work without warnings. About this 'define': we don't use is in another docs. Can we leave it out here or is this the new syntax?
> > 
> 
> There are no doc syntax changes that I know of. This is not
> new syntax. It has been around since 2014:
>   cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")

I had no idea this exists, thanks a lot for this TIL :-)

I guess the issue here is that this exists, yay, but it's not documented
with the other here:

https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation

I guess a patch to kernel-doc.rst would be great. Adding some kernel-doc
folks.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

