Return-Path: <linux-doc+bounces-3040-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C27F7F769C
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 15:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48435B2182E
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 14:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818FD2D61F;
	Fri, 24 Nov 2023 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OgaXH2lN"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758F319A1
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 06:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700836908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e3K50cOwL2e/Sm1/EHsvbvDxOsSWvo2nEBpLvx7bOk4=;
	b=OgaXH2lNxWR1gBvmlfemE5YJRfMg/ei3nYx5R81wNllbgM6D0f2sDH+52oCS2K8D/6kGc7
	dFtzpjALnycerIauog+iE8qOAEwa5+YnEkJ+lfIlhZRQTdh/5B9tcY55+lgbXaVy5yDkxs
	V1KiWlOKQB+epLsw/JaKwwXHS7u8vKc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-9R7tzX09MI-_UZ-9AOPHqA-1; Fri, 24 Nov 2023 09:41:47 -0500
X-MC-Unique: 9R7tzX09MI-_UZ-9AOPHqA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3316945c6e5so1644006f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 06:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700836906; x=1701441706;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3K50cOwL2e/Sm1/EHsvbvDxOsSWvo2nEBpLvx7bOk4=;
        b=NxUvR7SEpzU+Uz6g8sqCEifnt4KfcnaI6AHnj9mZkM5VEQzFrgQyI2gjkAy/RXzuso
         degaHE5wtWCFV/WIWLbXSjpwYNfyZsvmxsyf+yZd6BLFZ8yCQOhixq+r8N3+X/DTVEDH
         T6mYhXfm20kAkVI3gDneWVoYabGmPSqHsaPNeLhq5e1KOPMXZm8ERaLFnAUv6yT4xQ1G
         XtK3iX1Co48Az9K4m+HJkh+PsvQNjA8mbVEp7rdL/PbJgqlF627StZWPr4bZL6FEFbum
         oeTtH5XPLnAN22BrjyETupIf+ttxkpbV8lon/gHcWhAI+pTai8MXaRUw6E7sMOlI84wL
         Z72g==
X-Gm-Message-State: AOJu0Yw4LGW1MRvNS35lsGIm2miu+LbGPm6e6iHYh3Bw7S6KHWINE8pC
	Z9JJ3vifnlP4LoYLjuhAhsM3Oz6JJUworUd/0CzLMQBTz0pAThzZFw3llxmQFkVzwq7XYCz+RiH
	zioZU1I2c0GEO77yRZxc8
X-Received: by 2002:adf:ff92:0:b0:332:eacf:c9d7 with SMTP id j18-20020adfff92000000b00332eacfc9d7mr2292955wrr.8.1700836906398;
        Fri, 24 Nov 2023 06:41:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE53BbITSRE5erDBMKhplTxbIjo+7N2xRO0vWBt96X5OYz91Q7KP0WC4vmV1rL31vNgSjrYww==
X-Received: by 2002:adf:ff92:0:b0:332:eacf:c9d7 with SMTP id j18-20020adfff92000000b00332eacfc9d7mr2292920wrr.8.1700836906054;
        Fri, 24 Nov 2023 06:41:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s15-20020adf978f000000b00332d41f0798sm4514822wrb.29.2023.11.24.06.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 06:41:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Albert Esteve <aesteve@redhat.com>, qemu-devel@nongnu.org
Cc: zackr@vmware.com, contact@emersion.fr, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 iforbes@vmware.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chia-I Wu <olvaffe@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, Matt Roper
 <matthew.d.roper@intel.com>, David Airlie <airlied@gmail.com>,
 banackm@vmware.com, Rob Clark <robdclark@gmail.com>, krastevm@vmware.com,
 spice-devel@lists.freedesktop.org, Gurchetan Singh
 <gurchetansingh@chromium.org>, Jonathan Corbet <corbet@lwn.net>, David
 Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, mombasawalam@vmware.com, Daniel Vetter
 <daniel@ffwll.ch>, ppaalanen@gmail.com, VMware Graphics Reviewers
 <linux-graphics-maintainer@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH v6 0/9] Fix cursor planes with virtualized drivers
In-Reply-To: <20231023074613.41327-1-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
Date: Fri, 24 Nov 2023 15:41:44 +0100
Message-ID: <87h6lbcixj.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Albert Esteve <aesteve@redhat.com> writes:

> v6: Shift DRIVER_CURSOR_HOTSPOT flag bit to BIT(9), since BIT(8)
> was already taken by DRIVER_GEM_GPUVA.
>
> v5: Add a change with documentation from Michael, based on his discussion
> with Pekka and bump the kernel version DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
> might be introduced with to 6.6.
>
> v4: Make drm_plane_create_hotspot_properties static, rename
> DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE to DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
> and some minor stylistic fixes for things found by Javier and Pekka
> in v3.
>
> v3: Renames, fixes and cleanups suggested by Daniel, Simon and Pekka
> after v2. There's no major changes in functionality. Please let me know
> if I missed anything, it's been a while since v2.
>
> Virtualized drivers have had a lot of issues with cursor support on top
> of atomic modesetting. This set both fixes the long standing problems
> with atomic kms and virtualized drivers and adds code to let userspace
> use atomic kms on virtualized drivers while preserving functioning
> seamless cursors between the host and guest.
>
> The first change in the set is one that should be backported as far as
> possible, likely 5.4 stable, because earlier stable kernels do not have
> virtualbox driver. The change makes virtualized drivers stop exposing
> a cursor plane for atomic clients, this fixes mouse cursor on all well
> formed compositors which will automatically fallback to software cursor.
>
> The rest of the changes until the last one ports the legacy hotspot code
> to atomic plane properties.
>
> Finally the last change introduces userspace API to let userspace
> clients advertise the fact that they are aware of additional restrictions
> placed upon the cursor plane by virtualized drivers and lets them use
> atomic kms with virtualized drivers (the clients are expected to set
> hotspots correctly when advertising support for virtual cursor plane).
>
> Link to the IGT test covering this patch (already merged):
> https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
>
> Mutter patch:
> https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
>
> Michael Banack (1):
>   drm: Introduce documentation for hotspot properties
>
> Zack Rusin (8):
>   drm: Disable the cursor plane on atomic contexts with virtualized
>     drivers
>   drm/atomic: Add support for mouse hotspots
>   drm/vmwgfx: Use the hotspot properties from cursor planes
>   drm/qxl: Use the hotspot properties from cursor planes
>   drm/vboxvideo: Use the hotspot properties from cursor planes
>   drm/virtio: Use the hotspot properties from cursor planes
>   drm: Remove legacy cursor hotspot code
>   drm: Introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


