Return-Path: <linux-doc+bounces-6433-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1974382893F
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 16:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADFE2B24E30
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 15:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5903A1B9;
	Tue,  9 Jan 2024 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Rci+9t21"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5301939FDD
	for <linux-doc@vger.kernel.org>; Tue,  9 Jan 2024 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-204458dec9cso509092fac.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jan 2024 07:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1704815225; x=1705420025; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ajh3wJBKLsu531r6WRf+IpRdXWvKgp4BEX66vMfnC00=;
        b=Rci+9t21r8MppalZFlp2OSv3bWSla+6hSzXpMrLlq1ENW7EFBPzMtYBU06WLDzuE26
         W43WwU0+U2o3U+jdjnI9GgCeO61kXv6o5ynULMYL+5CRmCg+BAjjb7dyqbBN+x9CX+eU
         8MlAvpjbUw864h8l+wmtqXcP3pfWIkAATq5f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704815225; x=1705420025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ajh3wJBKLsu531r6WRf+IpRdXWvKgp4BEX66vMfnC00=;
        b=VXzRZOUZuuBnLAJ65f0I58IaSNaK5oHh+yOtSi7u7xOtS0hdJFbUyKkqXSo0JQQCyF
         lXQOXAUUDMbUWdTPw4rWubrMyxHG492CA44rwDLfLBP4xQqWumI9vIympvM6yavXs6Zj
         eijX/Y199xuNXgkZvqjXFo/pxnr3YqDuEf9uzYOXAGtpERnhXAYIcDV8HFKF9EymroB6
         wOLVvf2/SUtpb8s09suxPS+rMpluZY+aSXrJuyZeDIHin3BHnLihemoPNleJilaoyDJJ
         BvtmZONH/krgWbAoa1Ki3wzub7nphgFP4DTqGv6nnxhDJLgeHDgdjuVdR6PiRQDKWhzo
         CSGw==
X-Gm-Message-State: AOJu0YyioLHL8/A5bhxovga8Ui/S+LMU7F5XaGXZGYSSAnYieyzuXw3n
	nCe4LVCQt6fD/nJzsujcpxQ1sAt7xctnA+M9WUxfj0qhSABkEbYFiwwVkPnvn8M=
X-Google-Smtp-Source: AGHT+IGuz6Kv0C4r9SRTOnkL/azSIOUR6+mS7Jncap+r34/eBwyeVjHuC2xpIroalVbHvQTvEiamVhi9HKKRZY5kGrc=
X-Received: by 2002:a05:6871:2884:b0:204:5ad3:e6ec with SMTP id
 bq4-20020a056871288400b002045ad3e6ecmr10293877oac.4.1704815225438; Tue, 09
 Jan 2024 07:47:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240107012400.32587-1-rdunlap@infradead.org>
In-Reply-To: <20240107012400.32587-1-rdunlap@infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 9 Jan 2024 16:46:54 +0100
Message-ID: <CAKMK7uGQqH7Y7bnNb=zeKkLyavtoJBpGJxwptBBUSqsYGdFEtA@mail.gmail.com>
Subject: Re: [PATCH v2] doc-guide: kernel-doc: tell about object-like macros
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Jan 2024 at 02:24, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Since 2014 kernel-doc has supported describing object-like macros
> but it is not documented anywhere. I should have required some
> documentation for it when I merged the patch. :(
>
> There are currently only 3 uses of this (all in DRM headers, in
> include/drm/*.h).
>
> Add object-like macro kernel-doc documentation now so that more may
> know about it and use it.
>
> Fixes: cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
> v2: Previous attempts to use kernel-doc were for data definitions,
>     not macros, so remove that comment.
>     Remove a duplicate word in the patch description.
>     Add examples.

Randy pointed to this in another thread and also mentioned that
function-like macros are already documented, so this also has my

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>


>
>  Documentation/doc-guide/kernel-doc.rst |   45 +++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff -- a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
> --- a/Documentation/doc-guide/kernel-doc.rst
> +++ b/Documentation/doc-guide/kernel-doc.rst
> @@ -341,6 +341,51 @@ Typedefs with function prototypes can al
>     */
>     typedef void (*type_name)(struct v4l2_ctrl *arg1, void *arg2);
>
> +Object-like macro documentation
> +-------------------------------
> +
> +Object-like macros are distinct from function-like macros. They are
> +differentiated by whether the macro name is immediately followed by a
> +left parenthesis ('(') for function-like macros or not followed by one
> +for object-like macros.
> +
> +Function-like macros are handled like functions by ``scripts/kernel-doc``.
> +They may have a parameter list. Object-like macros have do not have a
> +parameter list.
> +
> +The general format of an object-like macro kernel-doc comment is::
> +
> +  /**
> +   * define object_name - Brief description.
> +   *
> +   * Description of the object.
> +   */
> +
> +Example::
> +
> +  /**
> +   * define MAX_ERRNO - maximum errno value that is supported
> +   *
> +   * Kernel pointers have redundant information, so we can use a
> +   * scheme where we can return either an error code or a normal
> +   * pointer with the same return value.
> +   */
> +  #define MAX_ERRNO    4095
> +
> +Example::
> +
> +  /**
> +   * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
> +   *   Initializes struct drm_plane_helper_funcs for VRAM handling
> +   *
> +   * This macro initializes struct drm_plane_helper_funcs to use the
> +   * respective helper functions.
> +   */
> +  #define DRM_GEM_VRAM_PLANE_HELPER_FUNCS \
> +       .prepare_fb = drm_gem_vram_plane_helper_prepare_fb, \
> +       .cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb
> +
> +
>  Highlights and cross-references
>  -------------------------------
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

