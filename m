Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54A5C6DDF1F
	for <lists+linux-doc@lfdr.de>; Tue, 11 Apr 2023 17:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjDKPLk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Apr 2023 11:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjDKPL1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Apr 2023 11:11:27 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AE75FC2
        for <linux-doc@vger.kernel.org>; Tue, 11 Apr 2023 08:11:02 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f0769b0699so279185e9.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Apr 2023 08:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681225861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xkBc8y85Toy8UTcXfQtWXbFA44zHzGMNAbB/qPFb8v0=;
        b=HudeJ0HfHwO6pVrBeBRsojqT8vHIe9KBuB5ATmGTODShfva0z04Os9nVeGorEN/ige
         peI5SidBvXShYK+9Au/tW2hkiGsZo9/9j2P8Z5Eh94DyFtIl4RKockTBdfh8h6xdyqG2
         Alm+HV8cVj5oSC775K3aKn2VX9ix8xJEuEtp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681225861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkBc8y85Toy8UTcXfQtWXbFA44zHzGMNAbB/qPFb8v0=;
        b=3t2/Igv3ENnlu71s8OCEOmxDzjbbhu1mqdNVll5kE1ZM65xNqUNWWarE0KD1QmntDF
         BhUhYJKKAeMO+qzJet5a31SLNHp9JUAXRn3W04FV5NIzS+i6dqhoybfCNkaFzakHcAmD
         ai3AjomCKAhYJtRppO2SjumGZ+O4A/O5wqIFlIOXii9hxgLCR2yyowUfSDXMjYFd+0+2
         e4k87LcJNaHxS2HOM37VilYT2ejHrxcHYmetGeFbND70MWV4XVp/YikC+tw6kJau8kPE
         NfC2vdBEBI+SZLAin+TUDImU+6S1PosfkTTLcOn0giHWg7fhHhF9Rvsk2w3ohqTcZP3P
         WVgQ==
X-Gm-Message-State: AAQBX9ftS+B6wiQ70bhqar7J7oPq2Hg2joh/dIUsIHRb0WDYpEYDhaKJ
        HN+1x8cQY7IIe08NXLRzafVAEg==
X-Google-Smtp-Source: AKy350Y7pJFFUoSYllXIEIad8W16svuGH0/mEehPGIXlC3q688kHpiU5nMeUx6zeDfGEnqW0xHK8Fg==
X-Received: by 2002:a05:600c:1d1d:b0:3f0:34c4:e76d with SMTP id l29-20020a05600c1d1d00b003f034c4e76dmr8176835wms.0.1681225861099;
        Tue, 11 Apr 2023 08:11:01 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c4fcb00b003ebff290a52sm21197394wmq.28.2023.04.11.08.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 08:11:00 -0700 (PDT)
Date:   Tue, 11 Apr 2023 17:10:58 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/2] drm: Add fdinfo memory stats
Message-ID: <ZDV4gl2t4Yt9KD5d@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <20230410210608.1873968-2-robdclark@gmail.com>
 <ZDU5vvc4V85E9hqP@phenom.ffwll.local>
 <CAF6AEGuzfvC0v7bo_OD7mP6C9cA4mJeTvdM+i7e1hVS-Tv+AFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGuzfvC0v7bo_OD7mP6C9cA4mJeTvdM+i7e1hVS-Tv+AFQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 11, 2023 at 08:02:09AM -0700, Rob Clark wrote:
> On Tue, Apr 11, 2023 at 3:43 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Apr 10, 2023 at 02:06:06PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add a helper to dump memory stats to fdinfo.  For the things the drm
> > > core isn't aware of, use a callback.
> > >
> > > v2: Fix typos, change size units to match docs, use div_u64
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >
> > Uh can't we wire this up by default? Having this as a per-driver opt-in
> > sounds like we'll get maximally fragmented drm fd_info, and since that's
> > uapi I don't think that's any good at all.
> 
> That is the reason for the centralized documentation of the props (and
> why for this one I added a helper, rather than continuing the current
> pattern of everyone rolling their own)..

Yeah, but we all know how consistent specs are without either a common
implementation or a test suite (or better, both) :-)

It's imo good to kick of new things, but anything that multiple drivers
could/should implement or once we have multiple drivers implementing
something should be common code.

I'm doing the same pushing for the fd_info around ctx, at least all
drivers using drm/sched should mostly just get this stuff instead of tons
of driver glue that then blows up in interesting ways because people
discover new ways to get lifetime rules wrong ...

> We _could_ (and I had contemplated) doing this all in core if (a) we
> move madv to drm_gem_object, and (b) track
> drm_gem_get_pages()/drm_gem_put_pages().  I guess neither is totally
> unreasonable, pretty much all the non-ttm/non-cma GEM drivers have
> some form of madvise ioctl and use
> drm_gem_get_pages()/drm_gem_put_pages()..

The active part shouldn't need anything new, you should be able to compute
that by looking at dma_resv (which is still ok under the spinlock, we
still have the lockless stuff to check status afaik).

The other bits are a bit more work, and I guess you could sort that out
for now by making the status callback optional. Long term pushing
purgeable as a concept one level up might make sense, but that's maybe a
bit too much refactoring for this.

I think just the minimal to get at least infra in place and the fully
driver-agnostic stuff computed for every gem driver would be great
already. And it makes it much easier for the next fd_info thing to become
fully generic, which hopefully motivates people to do that.
-Daniel

> 
> BR,
> -R
> 
> > I think it's time we have
> > - drm_fd_info
> > - rolled out to all drivers in their fops
> > - with feature checks as appropriate
> > - push the driver-specific things into a drm_driver callback
> >
> > And I guess start peopling giving a hard time for making things needless
> > driver-specifict ... there's really no reason at all this is not
> > consistent across drivers.
> > -Daniel
> >
> > > ---
> > >  Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> > >  drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
> > >  include/drm/drm_file.h                | 10 ++++
> > >  3 files changed, 110 insertions(+)
> > >
> > > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> > > index b46327356e80..b5e7802532ed 100644
> > > --- a/Documentation/gpu/drm-usage-stats.rst
> > > +++ b/Documentation/gpu/drm-usage-stats.rst
> > > @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
> > >  Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> > >  indicating kibi- or mebi-bytes.
> > >
> > > +- drm-shared-memory: <uint> [KiB|MiB]
> > > +
> > > +The total size of buffers that are shared with another file (ie. have more
> > > +than a single handle).
> > > +
> > > +- drm-private-memory: <uint> [KiB|MiB]
> > > +
> > > +The total size of buffers that are not shared with another file.
> > > +
> > > +- drm-resident-memory: <uint> [KiB|MiB]
> > > +
> > > +The total size of buffers that are resident in system memory.
> > > +
> > > +- drm-purgeable-memory: <uint> [KiB|MiB]
> > > +
> > > +The total size of buffers that are purgeable.
> > > +
> > > +- drm-active-memory: <uint> [KiB|MiB]
> > > +
> > > +The total size of buffers that are active on one or more rings.
> > > +
> > >  - drm-cycles-<str> <uint>
> > >
> > >  Engine identifier string must be the same as the one specified in the
> > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > > index a51ff8cee049..085b01842a87 100644
> > > --- a/drivers/gpu/drm/drm_file.c
> > > +++ b/drivers/gpu/drm/drm_file.c
> > > @@ -42,6 +42,7 @@
> > >  #include <drm/drm_client.h>
> > >  #include <drm/drm_drv.h>
> > >  #include <drm/drm_file.h>
> > > +#include <drm/drm_gem.h>
> > >  #include <drm/drm_print.h>
> > >
> > >  #include "drm_crtc_internal.h"
> > > @@ -868,6 +869,84 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
> > >  }
> > >  EXPORT_SYMBOL(drm_send_event);
> > >
> > > +static void print_size(struct drm_printer *p, const char *stat, size_t sz)
> > > +{
> > > +     const char *units[] = {"", " KiB", " MiB"};
> > > +     unsigned u;
> > > +
> > > +     for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
> > > +             if (sz < SZ_1K)
> > > +                     break;
> > > +             sz = div_u64(sz, SZ_1K);
> > > +     }
> > > +
> > > +     drm_printf(p, "%s:\t%zu%s\n", stat, sz, units[u]);
> > > +}
> > > +
> > > +/**
> > > + * drm_print_memory_stats - Helper to print standard fdinfo memory stats
> > > + * @file: the DRM file
> > > + * @p: the printer to print output to
> > > + * @status: callback to get driver tracked object status
> > > + *
> > > + * Helper to iterate over GEM objects with a handle allocated in the specified
> > > + * file.  The optional status callback can return additional object state which
> > > + * determines which stats the object is counted against.  The callback is called
> > > + * under table_lock.  Racing against object status change is "harmless", and the
> > > + * callback can expect to not race against object destruction.
> > > + */
> > > +void drm_print_memory_stats(struct drm_file *file, struct drm_printer *p,
> > > +                         enum drm_gem_object_status (*status)(struct drm_gem_object *))
> > > +{
> > > +     struct drm_gem_object *obj;
> > > +     struct {
> > > +             size_t shared;
> > > +             size_t private;
> > > +             size_t resident;
> > > +             size_t purgeable;
> > > +             size_t active;
> > > +     } size = {0};
> > > +     int id;
> > > +
> > > +     spin_lock(&file->table_lock);
> > > +     idr_for_each_entry (&file->object_idr, obj, id) {
> > > +             enum drm_gem_object_status s = 0;
> > > +
> > > +             if (status)
> > > +                     s = status(obj);
> > > +
> > > +             if (obj->handle_count > 1) {
> > > +                     size.shared += obj->size;
> > > +             } else {
> > > +                     size.private += obj->size;
> > > +             }
> > > +
> > > +             if (s & DRM_GEM_OBJECT_RESIDENT) {
> > > +                     size.resident += obj->size;
> > > +                     s &= ~DRM_GEM_OBJECT_PURGEABLE;
> > > +             }
> > > +
> > > +             if (s & DRM_GEM_OBJECT_ACTIVE) {
> > > +                     size.active += obj->size;
> > > +                     s &= ~DRM_GEM_OBJECT_PURGEABLE;
> > > +             }
> > > +
> > > +             if (s & DRM_GEM_OBJECT_PURGEABLE)
> > > +                     size.purgeable += obj->size;
> > > +     }
> > > +     spin_unlock(&file->table_lock);
> > > +
> > > +     print_size(p, "drm-shared-memory", size.shared);
> > > +     print_size(p, "drm-private-memory", size.private);
> > > +
> > > +     if (status) {
> > > +             print_size(p, "drm-resident-memory", size.resident);
> > > +             print_size(p, "drm-purgeable-memory", size.purgeable);
> > > +             print_size(p, "drm-active-memory", size.active);
> > > +     }
> > > +}
> > > +EXPORT_SYMBOL(drm_print_memory_stats);
> > > +
> > >  /**
> > >   * mock_drm_getfile - Create a new struct file for the drm device
> > >   * @minor: drm minor to wrap (e.g. #drm_device.primary)
> > > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > > index 0d1f853092ab..7bd8a1374f39 100644
> > > --- a/include/drm/drm_file.h
> > > +++ b/include/drm/drm_file.h
> > > @@ -41,6 +41,7 @@
> > >  struct dma_fence;
> > >  struct drm_file;
> > >  struct drm_device;
> > > +struct drm_printer;
> > >  struct device;
> > >  struct file;
> > >
> > > @@ -438,6 +439,15 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
> > >                                    struct drm_pending_event *e,
> > >                                    ktime_t timestamp);
> > >
> > > +enum drm_gem_object_status {
> > > +     DRM_GEM_OBJECT_RESIDENT  = BIT(0),
> > > +     DRM_GEM_OBJECT_PURGEABLE = BIT(1),
> > > +     DRM_GEM_OBJECT_ACTIVE    = BIT(2),
> > > +};
> > > +
> > > +void drm_print_memory_stats(struct drm_file *file, struct drm_printer *p,
> > > +                         enum drm_gem_object_status (*status)(struct drm_gem_object *));
> > > +
> > >  struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
> > >
> > >  #endif /* _DRM_FILE_H_ */
> > > --
> > > 2.39.2
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
