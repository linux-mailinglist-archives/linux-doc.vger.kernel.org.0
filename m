Return-Path: <linux-doc+bounces-6402-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A95E828744
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 14:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CEF5B23929
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 13:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5BA3987B;
	Tue,  9 Jan 2024 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="IOqj1hej"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19739848
	for <linux-doc@vger.kernel.org>; Tue,  9 Jan 2024 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2057f388b2dso616680fac.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jan 2024 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1704807751; x=1705412551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vmRcbAu5bKOJKOBtEpsAYRxyu5lKuff4W580bKuX76Y=;
        b=IOqj1hejew4Hu+5SDH9AS9F3nj+AqiLgCprcdh4yKqtIXrEWQYmtWxDls44qRhLN1O
         xxRM5sifX/QjUNZaLxDxYuWRC3rHXRQhZU5R63bHqRhkYmECWC8lXyHuSF3/3WU7bY5f
         qKMt2F/05r2Y0N4+HsNeppl/32h7TfReaPMGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704807751; x=1705412551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmRcbAu5bKOJKOBtEpsAYRxyu5lKuff4W580bKuX76Y=;
        b=cTOaUhrXbxiO/tL7IwXB6eJWqUeM/eZf6SDiy6eUYSWr7ms984MXTcOhO393eAWSjh
         O4Jv0ebU5d4gCp9+jiCWeN3atENsQDFGm3ytebaZ6npmTHFUIE2bOaa1D2eOBu+b6Y17
         9cCRM+lAjXy+PoTymByurOxuk9MfDgk6ovkxGZZsH5pclZ/z/g5IO7rBZ2XToZvmQDlF
         ChmIxp06zb5kaxUWLHEushnULYxwXLvaszsbNWs2FHLSDWGkveIgXVijvxWY9Q85a0jQ
         XE18RazRNrhimuhGQRgfD7qlvGI6OZdM4KeKyWuIZRAniHxQTIrum0JZmrUYsj0WwRpJ
         cXAQ==
X-Gm-Message-State: AOJu0Yyu1EezR6G0OexWtWV9dZ2zZ0CSLoaQ869AdReHaJXIr9g10bIM
	B6kmT0sYu+BYtp0mE0JCd9Fd2Z898a3UoihJvNC3Xoo37GLC6A==
X-Google-Smtp-Source: AGHT+IFUP7Cfqhxw9wfvOIGXAR+NbRfkhHdEOBJqOL2b8XiT5tH5BLiIWrHWRv+Rh+J6+REzezoK9bSt9V8ZQ2+zR0w=
X-Received: by 2002:a05:6871:7a1:b0:203:fc17:ebe3 with SMTP id
 o33-20020a05687107a100b00203fc17ebe3mr9182168oap.1.1704807751608; Tue, 09 Jan
 2024 05:42:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106032957.1195-1-rdunlap@infradead.org> <944ca2e6-23d9-44a2-a58c-4380e9ee575f@suse.de>
 <dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org> <ZZ1DIDjGlHP-tmAi@phenom.ffwll.local>
In-Reply-To: <ZZ1DIDjGlHP-tmAi@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Jan 2024 14:42:19 +0100
Message-ID: <CAKMK7uFbjQ1apr3-XrnWTH=TwRqW_9TDZ-21QAwJtiNB5FZ8dA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vram-helper: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jan 2024 at 13:59, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jan 08, 2024 at 01:10:12PM -0800, Randy Dunlap wrote:
> > Hi Thomas,
> >
> > On 1/8/24 00:57, Thomas Zimmermann wrote:
> > > Hi,
> > >
> > > thanks for the fix.
> > >
> > > Am 06.01.24 um 04:29 schrieb Randy Dunlap:
> > >> Remove the @funcs entry from struct drm_vram_mm to quieten the kernel-doc
> > >> warning.
> > >>
> > >> Use the "define" kernel-doc keyword and an '\' line continuation
> > >> to fix another kernel-doc warning.
> > >>
> > >> drm_gem_vram_helper.h:129: warning: missing initial short description on line:
> > >>   * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> > >> drm_gem_vram_helper.h:185: warning: Excess struct member 'funcs' description in 'drm_vram_mm'
> > >>
> > >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > >> Cc: David Airlie <airlied@gmail.com>
> > >> Cc: Daniel Vetter <daniel@ffwll.ch>
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >> Cc: Maxime Ripard <mripard@kernel.org>
> > >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > >> ---
> > >> v2: Add commit description
> > >>
> > >> base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
> > >>
> > >>   include/drm/drm_gem_vram_helper.h |    3 +--
> > >>   1 file changed, 1 insertion(+), 2 deletions(-)
> > >>
> > >> diff -- a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> > >> --- a/include/drm/drm_gem_vram_helper.h
> > >> +++ b/include/drm/drm_gem_vram_helper.h
> > >> @@ -126,7 +126,7 @@ drm_gem_vram_plane_helper_cleanup_fb(str
> > >>                        struct drm_plane_state *old_state);
> > >>     /**
> > >> - * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> > >> + * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
> > >
> > > Did something change wrt. doc syntax? I think this used to work without warnings. About this 'define': we don't use is in another docs. Can we leave it out here or is this the new syntax?
> > >
> >
> > There are no doc syntax changes that I know of. This is not
> > new syntax. It has been around since 2014:
> >   cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
>
> I had no idea this exists, thanks a lot for this TIL :-)
>
> I guess the issue here is that this exists, yay, but it's not documented
> with the other here:
>
> https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation
>
> I guess a patch to kernel-doc.rst would be great. Adding some kernel-doc
> folks.

Ok I went ahead and typed that patch (just we don't waste effort),
just waiting for the sphinx build to finish to make sure it looks nice
before I send out the patch.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

