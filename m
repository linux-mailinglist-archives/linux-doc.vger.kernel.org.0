Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B096DFEA0
	for <lists+linux-doc@lfdr.de>; Wed, 12 Apr 2023 21:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjDLTS6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 12 Apr 2023 15:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjDLTS5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Apr 2023 15:18:57 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4C75FD5
        for <linux-doc@vger.kernel.org>; Wed, 12 Apr 2023 12:18:54 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-505048d50aeso84665a12.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Apr 2023 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681327133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TGL3bUwy0CjP6dEeOnz8k7NbweddrjPgWSVcyIXLFpM=;
        b=awg0mq6hdOO9TfKJ5JmEuVSiEziodQXiTZ2yowEPACOI7WWQ7QJ28hvHS1hIGOFkPa
         Q8n/IgIFtE406cFWsTVThepE4sre8OWCOmY+nAP0vBn2bOx3W3a0zme+k0hSK1AqwRAi
         aT1I1T6mOPJmW7AnJGbnpiGLUQDsoL7h/l6/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681327133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGL3bUwy0CjP6dEeOnz8k7NbweddrjPgWSVcyIXLFpM=;
        b=j920usAJZqsfBerj1vJmlSPXWh8EEcgvmLiUMKn7zKhVuj3FBTKDC/FzrdLDs9MKnk
         Mb5bJVsKrWEa+6hHZAtqX+9oBdSPdkBlQ9w4LW0vdnDfUMIjuQuGKwcUjpDctvlm3Mxb
         2LA/xObityrfwAQzz6lI3NpQi66qTX2lnuC0OF7TwMGoJtruWjnvl5/+ycL9sRIoiIv4
         8Ci0Vcb7L7+f4VgRZly4znzTEWQUQolNBTjbeIWotsAvgH/chVzd/aqrjwGyPYEoW8qy
         KixyelDONZhVCw+bn+zghUbPppFLAhgXu4OBElDhcib8CTmJJ6XR8M2W+qbtOFZnnmy1
         4XAQ==
X-Gm-Message-State: AAQBX9fgIVwlAHULndWiX+ukounCnHL2fRqlot1qexJh5yIKfzVuYP0C
        vPtyE68aynOTzAnLPjHMC1kibw==
X-Google-Smtp-Source: AKy350by+rGXNXV48PE9MRVzRAkiKDfB9e2R5kZEpuVCwWy53yG9kksqhG53X9VEVb9+PvEjWjB7+A==
X-Received: by 2002:a05:6402:40c2:b0:502:ffd:74a0 with SMTP id z2-20020a05640240c200b005020ffd74a0mr3481764edb.2.1681327132649;
        Wed, 12 Apr 2023 12:18:52 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id r2-20020aa7cb82000000b0050504648fc4sm876390edt.80.2023.04.12.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 12:18:51 -0700 (PDT)
Date:   Wed, 12 Apr 2023 21:18:50 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
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
Subject: Re: [PATCH v3 6/7] drm: Add fdinfo memory stats
Message-ID: <ZDcEGoSPGr/oRLas@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
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
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-7-robdclark@gmail.com>
 <29a8d9aa-c6ea-873f-ce0b-fb8199b13068@linux.intel.com>
 <CAF6AEGsZsMx+Vy+4UQSx3X7w_QNvvjLqWxx=PnCLAOC9f-X2CQ@mail.gmail.com>
 <ZDb1phnddSne79iN@phenom.ffwll.local>
 <CAF6AEGvBeDVM12ac0j_PKSdcY83hNDhyrQs9-=h=dx_7AoMXLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvBeDVM12ac0j_PKSdcY83hNDhyrQs9-=h=dx_7AoMXLw@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
> On Wed, Apr 12, 2023 at 11:17 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
> > > On Wed, Apr 12, 2023 at 7:42 AM Tvrtko Ursulin
> > > <tvrtko.ursulin@linux.intel.com> wrote:
> > > >
> > > >
> > > > On 11/04/2023 23:56, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Add support to dump GEM stats to fdinfo.
> > > > >
> > > > > v2: Fix typos, change size units to match docs, use div_u64
> > > > > v3: Do it in core
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> > > > > ---
> > > > >   Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
> > > > >   drivers/gpu/drm/drm_file.c            | 76 +++++++++++++++++++++++++++
> > > > >   include/drm/drm_file.h                |  1 +
> > > > >   include/drm/drm_gem.h                 | 19 +++++++
> > > > >   4 files changed, 117 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> > > > > index b46327356e80..b5e7802532ed 100644
> > > > > --- a/Documentation/gpu/drm-usage-stats.rst
> > > > > +++ b/Documentation/gpu/drm-usage-stats.rst
> > > > > @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
> > > > >   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> > > > >   indicating kibi- or mebi-bytes.
> > > > >
> > > > > +- drm-shared-memory: <uint> [KiB|MiB]
> > > > > +
> > > > > +The total size of buffers that are shared with another file (ie. have more
> > > > > +than a single handle).
> > > > > +
> > > > > +- drm-private-memory: <uint> [KiB|MiB]
> > > > > +
> > > > > +The total size of buffers that are not shared with another file.
> > > > > +
> > > > > +- drm-resident-memory: <uint> [KiB|MiB]
> > > > > +
> > > > > +The total size of buffers that are resident in system memory.
> > > >
> > > > I think this naming maybe does not work best with the existing
> > > > drm-memory-<region> keys.
> > >
> > > Actually, it was very deliberate not to conflict with the existing
> > > drm-memory-<region> keys ;-)
> > >
> > > I wouldn't have preferred drm-memory-{active,resident,...} but it
> > > could be mis-parsed by existing userspace so my hands were a bit tied.
> > >
> > > > How about introduce the concept of a memory region from the start and
> > > > use naming similar like we do for engines?
> > > >
> > > > drm-memory-$CATEGORY-$REGION: ...
> > > >
> > > > Then we document a bunch of categories and their semantics, for instance:
> > > >
> > > > 'size' - All reachable objects
> > > > 'shared' - Subset of 'size' with handle_count > 1
> > > > 'resident' - Objects with backing store
> > > > 'active' - Objects in use, subset of resident
> > > > 'purgeable' - Or inactive? Subset of resident.
> > > >
> > > > We keep the same semantics as with process memory accounting (if I got
> > > > it right) which could be desirable for a simplified mental model.
> > > >
> > > > (AMD needs to remind me of their 'drm-memory-...' keys semantics. If we
> > > > correctly captured this in the first round it should be equivalent to
> > > > 'resident' above. In any case we can document no category is equal to
> > > > which category, and at most one of the two must be output.)
> > > >
> > > > Region names we at most partially standardize. Like we could say
> > > > 'system' is to be used where backing store is system RAM and others are
> > > > driver defined.
> > > >
> > > > Then discrete GPUs could emit N sets of key-values, one for each memory
> > > > region they support.
> > > >
> > > > I think this all also works for objects which can be migrated between
> > > > memory regions. 'Size' accounts them against all regions while for
> > > > 'resident' they only appear in the region of their current placement, etc.
> > >
> > > I'm not too sure how to rectify different memory regions with this,
> > > since drm core doesn't really know about the driver's memory regions.
> > > Perhaps we can go back to this being a helper and drivers with vram
> > > just don't use the helper?  Or??
> >
> > I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: then it
> > all works out reasonably consistently?
> 
> That is basically what we have now.  I could append -system to each to
> make things easier to add vram/etc (from a uabi standpoint)..

What you have isn't really -system, but everything. So doesn't really make
sense to me to mark this -system, it's only really true for integrated (if
they don't have stolen or something like that).

Also my comment was more in reply to Tvrtko's suggestion.
-Daniel


> 
> BR,
> -R
> 
> > And ttm could/should perhaps provide a helper to dump the region specific
> > version of this. Or we lift the concept of regions out of ttm a bit
> > higher, that's kinda needed for cgroups eventually anyway I think.
> > -Daniel
> >
> > >
> > > BR,
> > > -R
> > >
> > > > Userspace can aggregate if it wishes to do so but kernel side should not.
> > > >
> > > > > +
> > > > > +- drm-purgeable-memory: <uint> [KiB|MiB]
> > > > > +
> > > > > +The total size of buffers that are purgeable.
> > > > > +
> > > > > +- drm-active-memory: <uint> [KiB|MiB]
> > > > > +
> > > > > +The total size of buffers that are active on one or more rings.
> > > > > +
> > > > >   - drm-cycles-<str> <uint>
> > > > >
> > > > >   Engine identifier string must be the same as the one specified in the
> > > > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > > > > index 37dfaa6be560..46fdd843bb3a 100644
> > > > > --- a/drivers/gpu/drm/drm_file.c
> > > > > +++ b/drivers/gpu/drm/drm_file.c
> > > > > @@ -42,6 +42,7 @@
> > > > >   #include <drm/drm_client.h>
> > > > >   #include <drm/drm_drv.h>
> > > > >   #include <drm/drm_file.h>
> > > > > +#include <drm/drm_gem.h>
> > > > >   #include <drm/drm_print.h>
> > > > >
> > > > >   #include "drm_crtc_internal.h"
> > > > > @@ -871,6 +872,79 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
> > > > >   }
> > > > >   EXPORT_SYMBOL(drm_send_event);
> > > > >
> > > > > +static void print_size(struct drm_printer *p, const char *stat, size_t sz)
> > > > > +{
> > > > > +     const char *units[] = {"", " KiB", " MiB"};
> > > > > +     unsigned u;
> > > > > +
> > > > > +     for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
> > > > > +             if (sz < SZ_1K)
> > > > > +                     break;
> > > > > +             sz = div_u64(sz, SZ_1K);
> > > > > +     }
> > > > > +
> > > > > +     drm_printf(p, "%s:\t%zu%s\n", stat, sz, units[u]);
> > > > > +}
> > > > > +
> > > > > +static void print_memory_stats(struct drm_printer *p, struct drm_file *file)
> > > > > +{
> > > > > +     struct drm_gem_object *obj;
> > > > > +     struct {
> > > > > +             size_t shared;
> > > > > +             size_t private;
> > > > > +             size_t resident;
> > > > > +             size_t purgeable;
> > > > > +             size_t active;
> > > > > +     } size = {0};
> > > > > +     bool has_status = false;
> > > > > +     int id;
> > > > > +
> > > > > +     spin_lock(&file->table_lock);
> > > > > +     idr_for_each_entry (&file->object_idr, obj, id) {
> > > > > +             enum drm_gem_object_status s = 0;
> > > > > +
> > > > > +             if (obj->funcs && obj->funcs->status) {
> > > > > +                     s = obj->funcs->status(obj);
> > > > > +                     has_status = true;
> > > > > +             }
> > > > > +
> > > > > +             if (obj->handle_count > 1) {
> > > > > +                     size.shared += obj->size;
> > > > > +             } else {
> > > > > +                     size.private += obj->size;
> > > > > +             }
> > > > > +
> > > > > +             if (s & DRM_GEM_OBJECT_RESIDENT) {
> > > > > +                     size.resident += obj->size;
> > > > > +             } else {
> > > > > +                     /* If already purged or not yet backed by pages, don't
> > > > > +                      * count it as purgeable:
> > > > > +                      */
> > > > > +                     s &= ~DRM_GEM_OBJECT_PURGEABLE;
> > > >
> > > > Side question - why couldn't resident buffers be purgeable? Did you mean
> > > > for the if branch check to be active here? But then it wouldn't make
> > > > sense for a driver to report active _and_ purgeable..
> > > >
> > > > > +             }
> > > > > +
> > > > > +             if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
> > > > > +                     size.active += obj->size;
> > > > > +
> > > > > +                     /* If still active, don't count as purgeable: */
> > > > > +                     s &= ~DRM_GEM_OBJECT_PURGEABLE;
> > > >
> > > > Another side question - I guess this tidies a race in reporting? If so
> > > > not sure it matters given the stats are all rather approximate.
> > > >
> > > > > +             }
> > > > > +
> > > > > +             if (s & DRM_GEM_OBJECT_PURGEABLE)
> > > > > +                     size.purgeable += obj->size;
> > > > > +     }
> > > >
> > > > One concern I have here is that it is all based on obj->size. That is,
> > > > there is no provision for drivers to implement page level granularity.
> > > > So correct reporting in use cases such as VM BIND in the future wouldn't
> > > > work unless it was a driver hook to get almost all of the info above. At
> > > > which point common code is just a loop. TBF I don't know if any drivers
> > > > do sub obj->size backing store granularity today, but I think it is
> > > > sometimes to be sure of before proceeding.
> > > >
> > > > Second concern is what I touched upon in the first reply block - if the
> > > > common code blindly loops over all objects then on discrete GPUs it
> > > > seems we get an 'aggregate' value here which is not what I think we
> > > > want. We rather want to have the ability for drivers to list stats per
> > > > individual memory region.
> > > >
> > > > > +     spin_unlock(&file->table_lock);
> > > > > +
> > > > > +     print_size(p, "drm-shared-memory", size.shared);
> > > > > +     print_size(p, "drm-private-memory", size.private);
> > > > > +     print_size(p, "drm-active-memory", size.active);
> > > > > +
> > > > > +     if (has_status) {
> > > > > +             print_size(p, "drm-resident-memory", size.resident);
> > > > > +             print_size(p, "drm-purgeable-memory", size.purgeable);
> > > > > +     }
> > > > > +}
> > > > > +
> > > > >   /**
> > > > >    * drm_fop_show_fdinfo - helper for drm file fops
> > > > >    * @seq_file: output stream
> > > > > @@ -904,6 +978,8 @@ void drm_fop_show_fdinfo(struct seq_file *m, struct file *f)
> > > > >
> > > > >       if (dev->driver->show_fdinfo)
> > > > >               dev->driver->show_fdinfo(&p, file);
> > > > > +
> > > > > +     print_memory_stats(&p, file);
> > > > >   }
> > > > >   EXPORT_SYMBOL(drm_fop_show_fdinfo);
> > > > >
> > > > > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > > > > index dfa995b787e1..e5b40084538f 100644
> > > > > --- a/include/drm/drm_file.h
> > > > > +++ b/include/drm/drm_file.h
> > > > > @@ -41,6 +41,7 @@
> > > > >   struct dma_fence;
> > > > >   struct drm_file;
> > > > >   struct drm_device;
> > > > > +struct drm_printer;
> > > > >   struct device;
> > > > >   struct file;
> > > > >
> > > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > > index 189fd618ca65..213917bb6b11 100644
> > > > > --- a/include/drm/drm_gem.h
> > > > > +++ b/include/drm/drm_gem.h
> > > > > @@ -42,6 +42,14 @@
> > > > >   struct iosys_map;
> > > > >   struct drm_gem_object;
> > > > >
> > > > > +/**
> > > > > + * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
> > > > > + */
> > > > > +enum drm_gem_object_status {
> > > > > +     DRM_GEM_OBJECT_RESIDENT  = BIT(0),
> > > > > +     DRM_GEM_OBJECT_PURGEABLE = BIT(1),
> > > > > +};
> > > > > +
> > > > >   /**
> > > > >    * struct drm_gem_object_funcs - GEM object functions
> > > > >    */
> > > > > @@ -174,6 +182,17 @@ struct drm_gem_object_funcs {
> > > > >        */
> > > > >       int (*evict)(struct drm_gem_object *obj);
> > > > >
> > > > > +     /**
> > > > > +      * @status:
> > > > > +      *
> > > > > +      * The optional status callback can return additional object state
> > > > > +      * which determines which stats the object is counted against.  The
> > > > > +      * callback is called under table_lock.  Racing against object status
> > > > > +      * change is "harmless", and the callback can expect to not race
> > > > > +      * against object destruction.
> > > > > +      */
> > > > > +     enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
> > > >
> > > > Does this needs to be in object funcs and couldn't be consolidated to
> > > > driver level?
> > > >
> > > > Regards,
> > > >
> > > > Tvrtko
> > > >
> > > > > +
> > > > >       /**
> > > > >        * @vm_ops:
> > > > >        *
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
