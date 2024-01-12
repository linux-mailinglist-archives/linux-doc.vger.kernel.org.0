Return-Path: <linux-doc+bounces-6717-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAA482C03D
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jan 2024 13:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CBF51F21D5E
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jan 2024 12:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A566BB35;
	Fri, 12 Jan 2024 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="gjckNLXe"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390446A34B
	for <linux-doc@vger.kernel.org>; Fri, 12 Jan 2024 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a28cfca3c45so163092866b.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jan 2024 04:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1705064341; x=1705669141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/IzbCUttBySDW4UF+/3Rn+hm1gmEpaoc8lHsutNmx8=;
        b=gjckNLXeJl1VQKwGhBLQJ6tU0IFqxyl6G/BhGUbaaaHvDKDRm++LMsDYwin5W7Dtbw
         eq6Ilj484MUG7TV6UC94ZWWISkSfgp75ESs4EV4WrwFJ1TWXU2kOx9sKkismzM5LmxZf
         WqfDsWg4P1C2ILDwlsjlB+2pVhE1xX6VQeIi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705064341; x=1705669141;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/IzbCUttBySDW4UF+/3Rn+hm1gmEpaoc8lHsutNmx8=;
        b=h3WiZf8OwNAgtsrwrmuw3CJs/KEi8HHOBwHjoLydhc1kT/GUVXjS11LHRlPxtR3WmL
         X0n8CijmRwJOp2Gu1HC6JdcZgEglcxuYsGZFpm9HTmekClPFBZ1cS9hgev/H9HMJQZKy
         1pxeWq55vdLMV0Lyd39Bb4+XIxBnBUIEI31roBZ8g668icwuyUbP8zBCI8e9K/lVGpG6
         ZzMP29R7VCiNyvUdIBMN+TLAH+Z0aurpS1k72NiCbDGh5HkM27vMxJjowd2ixoQR3mc4
         fxTU+IOkSBsWnKZgIZgTE/KbwlUVPDrEVE78E8WevlMuDv1E5Z4UBaBpf4AuHLYzAoAH
         gsQQ==
X-Gm-Message-State: AOJu0YxQc5bB1NhqOSbtVPLqR9nM6ZlI4tvoZ3BcjppWP1CK7fNWQTIy
	8c0UENVtwexuBvG7G98FUnCUUJ//1OUxOg==
X-Google-Smtp-Source: AGHT+IEfYaqUTOGYXCnanYoymnssMQ6JQhm90dq0lyVwhDnSY+yy0Tw5ugD8WF4joaSuBa55ngsAoA==
X-Received: by 2002:a17:906:5859:b0:a28:6639:ba53 with SMTP id h25-20020a170906585900b00a286639ba53mr1417632ejs.6.1705064341418;
        Fri, 12 Jan 2024 04:59:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id tg14-20020a1709078dce00b00a2cb117050fsm806326ejc.126.2024.01.12.04.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 04:59:01 -0800 (PST)
Date: Fri, 12 Jan 2024 13:58:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] drm/doc: internals: remove section on PCI legacy support
Message-ID: <ZaE3k1042oCQdft0@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20240112051731.15722-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112051731.15722-1-rdunlap@infradead.org>
X-Operating-System: Linux phenom 6.5.0-4-amd64 

On Thu, Jan 11, 2024 at 09:17:31PM -0800, Randy Dunlap wrote:
> The functions that were described in this section of
> drm-internals.rst were removed in NOV-2023, along with all of the
> kernel-doc comments in the source file. This now causes a
> docs build warning, so remove that section of the documentation also.
> 
> drivers/gpu/drm/drm_pci.c:1: warning: no structured comments found
> 
> Fixes: 2504c7ec728b ("drm: Remove source code for non-KMS drivers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org

Applied to drm-misc-next, thanks!
-Sima

> ---
>  Documentation/gpu/drm-internals.rst |   12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff -- a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -153,18 +153,6 @@ Managed Resources
>  .. kernel-doc:: include/drm/drm_managed.h
>     :internal:
>  
> -Bus-specific Device Registration and PCI Support
> -------------------------------------------------
> -
> -A number of functions are provided to help with device registration. The
> -functions deal with PCI and platform devices respectively and are only
> -provided for historical reasons. These are all deprecated and shouldn't
> -be used in new drivers. Besides that there's a few helpers for pci
> -drivers.
> -
> -.. kernel-doc:: drivers/gpu/drm/drm_pci.c
> -   :export:
> -
>  Open/Close, File Operations and IOCTLs
>  ======================================
>  

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

