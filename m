Return-Path: <linux-doc+bounces-16049-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D901B8C051A
	for <lists+linux-doc@lfdr.de>; Wed,  8 May 2024 21:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36B81B246FF
	for <lists+linux-doc@lfdr.de>; Wed,  8 May 2024 19:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66A5130A5B;
	Wed,  8 May 2024 19:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Brv8j+TO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0E12CDBC;
	Wed,  8 May 2024 19:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715196784; cv=none; b=uSOQlfxWulYT7cbWgXGOtC4RIAGbTs9KnhmbVhoPlI70oDKyhbMKugajI/QuGVlMjkg/2bW7+vAp1Gab8G7FdTOKbqHbz3awVkcT0EUpDH5EXc4T0DpzaPzQpG/283sZVNVRGrsD0ZpWOImMpz3geusPU48WnfzbiPNts3Kz1C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715196784; c=relaxed/simple;
	bh=n/UIj+mbfnqLvJd6toaYjCd4MgTWYG3g1wG9t9FQBpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAThYwqMoO/1S81mDFEDMIqFY90dSOjExKxm9PgdcFuTnh+dWWyrTjZKzWyKhx1IG3ArsIMo3uDsudVAJXOR6H9CBpIvdDS4auBMcXrFXNUma+fteHY2Q/vhdMXKKp+XL735+HGLr+PhUQarBgky8hs8gm0EC/rBhS6WXkHeEdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Brv8j+TO; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-47f0a45375aso24027137.1;
        Wed, 08 May 2024 12:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715196778; x=1715801578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeGkuoqGm4ojyPofieMvfXuRIhVkD6MEYG1NSOYmwNI=;
        b=Brv8j+TO7sug5PLwPeHHlkNnNZDU7WuJEwLxLuDUWm/4a17eTvMARYEZavTma0aCv2
         azWiI1GoSky0pduvmfUVZ8AC4qFdU4eW1G3watsSU9f/qqlwjsWDyfGz5Tb7B1Ad7zRT
         b48QvyDfiQ0yuQYitOi9QIBdp76p1yYjDGV+GgtoJFSJt2VaVu/nq7gtNZT7IdPlMRO5
         l3h9pjjmV9lMmKTAC/3+iPzbqESUO0QHJIJxOeKFOg4NgXdm8uitRVVxXSichCzSx4LL
         RbYl5AVcP6F5SFOAZRawFKzvGWXs9f4SIKzLFWjDXewAAL/TovqFhxU9rJWYu1zgq91q
         Br9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715196778; x=1715801578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeGkuoqGm4ojyPofieMvfXuRIhVkD6MEYG1NSOYmwNI=;
        b=FXu+5XAcCyXnQ0D+1pgKPoNV1NCgfjQuqNt6yG2gAAOHQXEBDX87vnFZfr5X+BGaMX
         jSKdp/tEskqNQ1JM6L0WaKBAV1ARQp2Ao2rHoWnfuvBhci8VbM682br3Ha44bbhg/Qzy
         QxhUwoJew6uqdM89myFZrS7T8q+UQl/zucDt9dhzdFOGuClwGM7N6lNDCaK7H8qemvXr
         Yn+4kMbD36di0EXjHYb/FFxDUtu9V7w3OxHQlcypetkGmeMPRnVu5fsYYD3Hvs6E0iE8
         smbbmSKr1s37HLhM0uG4r4IkbWGwG/Ls9xLG1kRERoyvsw7WXBe1IHsHu3GvkAuFWCkE
         uI2g==
X-Forwarded-Encrypted: i=1; AJvYcCVNFUni/FHN+3J4KgOUMTMnRV6XT4nFqT2t+FH/k8N4xsigvbgr3k5/DNNM6gCxHXS9zxDWqzhXNWO7ccXFJV27WcPAK8Bdqsg2eq+mm+lkDssUUHYQsfuxzQx1u1CXhPpC7YInXbQP
X-Gm-Message-State: AOJu0YwYep/ElS47jaS/x9rmtMbaeUbaN5J3HoXSdXIUsZu/yWBeHIsm
	aWPMurUj7LP1D8JpgVa8C83U2IZW3Rci8GxEZGxbOyHJ9D7YYxm6bF5CtIU/S/jnFA+vFuyYtPF
	IUSTxoEVryIHIC6jle9GuFPW+XBM=
X-Google-Smtp-Source: AGHT+IHKGE9hjd+cCGtZxxqqU85MC1L5JFTilJwadymvbQMNtE1cmZ3sjjbd0UUV3pA799UfbgfUq1LUzOdlWrgNmkw=
X-Received: by 2002:a05:6102:313b:b0:47f:245f:85c2 with SMTP id
 ada2fe7eead31-47f3c2cb9d0mr3342495137.14.1715196778123; Wed, 08 May 2024
 12:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429193145.66543-1-jim.cromie@gmail.com>
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
From: jim.cromie@gmail.com
Date: Wed, 8 May 2024 13:32:30 -0600
Message-ID: <CAJfuBxzx87Xe1EeJ3xVQ85z6WN5vTJO1XyXEaA16EiepvGcrKg@mail.gmail.com>
Subject: Re: [PATCH v8 00/35] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y regression
To: jbaron@akamai.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch, 
	tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
	ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com, 
	groeck@google.com, yanivt@google.com, bleung@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 1:32=E2=80=AFPM Jim Cromie <jim.cromie@gmail.com> w=
rote:
>
> hi Greg, Jason, DRM-folk,
>
> This patchset fixes the CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy regression,
> Fixes: bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")
>
> this is v8.
> Its also here:
> https://github.com/jimc/linux/tree/dd-classmap-fix-8a
>

This patchset didnt get picked up by drm patchwork
maybe its tired my stochastic renaming, sorry about that

https://patchwork.freedesktop.org/project/intel-gfx/series/?ordering=3D-las=
t_updated

125063fix DRM_USE_DYNAMIC_DEBUG=3Dy
regressionwarningNew23jim.cromie@gmail.comNone2023-11-01
123572fix DRM_USE_DYNAMIC_DEBUG
regressionfailureNew22jim.cromie@gmail.comNone2023-09-11
113363fix DRM_USE_DYNAMIC_DEBUG regressionwarningIn progress
22jim.cromie@gmail.comNone2023-08-01
111651DRM_USE_DYNAMIC_DEBUG
regressionfailureNew20jim.cromie@gmail.comNone2023-01-13
111631DRM - avoid regression in -rc, fix comment

is there something missing for a DRM patchwork run ?
does it kick out because theres non-drm subsystem stuff in there ?

thanks



> v7 had at least 2 problems:
>
>  https://lore.kernel.org/lkml/20231101002609.3533731-1-jim.cromie@gmail.c=
om/
>  https://patchwork.freedesktop.org/series/125066/
>
> 1. missing __align(8) in METATDATA macro, giving too much placement
> freedom to linker, caused weird segvs following non-ptr vals, but for
> builtin modules only. found by lkp-test.
>
> 2. the main patch changed both the dyndbg API, and the drm/drivers.
> This was a flag-day annoyance, and not practical.  Fix by preserving
> old API macro until "later", and splitting the patch and set into 2
> sequential subsets.  removal can wait.
>
> What was broken ?
>
> Booting a modular kernel with drm.debug=3D0x1ff, this enabled pr_debugs
> only in drm itself, not the yet-to-be loaded driver + helpers.  I had
> tested with scripts doing lots of modprobes with dyndbg=3D<> options
> permuting.  I didn't notice that I didn't really test without them.
>
> The deeper cause was my design error, a violation of the K&R rule:
> "define once, refer many times".
>
> DECLARE_DYNDBG_CLASSMAP defined the classmap, and was used everywhere,
> re-declaring the same static classmap repeatedly. Jani Nikula actually
> picked up on this at the time, but didn't scream loudly enough for
> anyone to notice, I know I didn't get it then.  One patchset across 2
> trees didn't help either.
>
> The revised classmap API "splits" it to def & ref.
>
> DYNDBG_CLASSMAP_DEFINE fixes & updates the busted macro, EXPORTing the
> classmap instead.  It gets invoked once per subsystem, by the
> parent/builtin, drm.ko for DRM.
>
> DYNDBG_CLASSMAP_USE in drivers and helpers refer to the classmap by
> name, which links the 2 modules (like __drm_debug already does).
>
> These 2 tell dyndbg to map "class FOO" to the defined FOO_ID, which
> allows it to make those changes via >control.
>
> DYNDBG_CLASSMAP_PARAM*, defines the controlling kparam, and binds it
> to both the _var, and the _DEFINEd classmap.  So drm uses this to bind
> the classmap to __drm_debug.
>
> It provides the common control-point for the sub-system; it is applied
> to the classmaps during modprobe of both _DEFINEr and USErs.  It also
> enforces the relative nature of LEVEL classmaps, ie V3>V2.
>
> DECLARE_DYNDBG_CLASSMAP is preserved to decouple the DRM patches.
>
> A new struct and elf section contain the _USEs; on modprobe, these are
> scanned similarly to the _DEFINEs, but follow the references to their
> defining modules, find the kparam wired to the classmap, and apply its
> classmap settings to the USEr.  This action is what V1 missed, which
> is why drivers failed to enable debug during modprobe.
>
> In order to recapitulate the regression scenario without involving
> DRM, the patchset (v6 I think) adds test_dynamic_debug_submod, which
> is a duplicate of its parent; _submod.c #defines _SUBMOD, and then
> includes parent.
>
> This puts _DEFINE and _USE close together in the same file, for
> obviousness.  It also guarantees that the submod always has the same
> complement of debug()s, giving consistent output from both when
> classmaps are working properly, as tested when changing callsites via
> both param and >control.
>
> To provide a turn-key selftest, the patchset also adds
> ./tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh, pilfered
> from a debug-to-trace patchset I and Lukasz Bartozik have been working
> out.  It starts with basic_tests, then to test 2 new parsing
> delimiters, which simplify testing of the classmap functionality.
>
> It works nicely from virtme-ng:
>
> [jimc@frodo vx]$ vrun_ -- ./tools/testing/selftests/dynamic_debug/dyndbg_=
selftest.sh
> doing: vng --verbose --name v6.9-rc5-34-g2f1ace6e1c68 \
>        --user root --cwd ../.. \
>        -a dynamic_debug.verbose=3D2 -p 4 \
>        -- ./tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> virtme: waiting for virtiofsd to start
> ...
> [    3.546739] ip (260) used greatest stack depth: 12368 bytes left
> [    3.609288] virtme-init: starting script
> test_dynamic_debug_submod not there
> test_dynamic_debug not there
> # BASIC_TESTS
> ...
> # Done on: Fri Apr 26 20:45:08 MDT 2024
> [    4.765751] virtme-init: script returned {0}
> Powering off.
> [    4.805790] ACPI: PM: Preparing to enter system sleep state S5
> [    4.806223] kvm: exiting hardware virtualization
> [    4.806564] reboot: Power down
> [jimc@frodo vx]$
>
>
> I've been running the kernel on my x86 desktop & laptop, booting with
> drm.debug=3D0x1f, then turning it all-off after sleep 15.
>
> a few highlights from a bare-metal boot:
>
> here modprobe amdgpu; dyndbg applies last bit/class/category, and finishe=
s init,
> then drm and amdgpu start logging as they execute
> ...
> [    9.019696] gandalf kernel: dyndbg: query 0: "class DRM_UT_ATOMIC +p" =
mod:amdgpu
> [    9.019704] gandalf kernel: dyndbg: class-ref: amdgpu.DRM_UT_ATOMIC  m=
odule:amdgpu nd:4754 nc:0 nu:1
> [    9.020012] gandalf kernel: dyndbg: processed 1 queries, with 21 match=
es, 0 errs
> [    9.020017] gandalf kernel: dyndbg: bit_4: 21 matches on class: DRM_UT=
_ATOMIC -> 0x1f
> [    9.020021] gandalf kernel: dyndbg: applied bitmap: 0x1f to: 0x0 for a=
mdgpu
> [    9.020026] gandalf kernel: dyndbg: attach-client-module:  module:amdg=
pu nd:4754 nc:0 nu:1
> [    9.020031] gandalf kernel: dyndbg: 4754 debug prints in module amdgpu
> [    9.055065] gandalf kernel: [drm] amdgpu kernel modesetting enabled.
> [    9.055138] gandalf kernel: [drm:amdgpu_acpi_detect [amdgpu]] No match=
ing acpi device found for AMD3000
> [    9.055564] gandalf kernel: amdgpu: Virtual CRAT table created for CPU
> [    9.055585] gandalf kernel: amdgpu: Topology: Add CPU node
> [    9.055752] gandalf kernel: amdgpu 0000:0c:00.0: enabling device (0006=
 -> 0007)
> [    9.055821] gandalf kernel: [drm] initializing kernel modesetting (NAV=
I10 0x1002:0x731F 0x148C:0x2398 0xC1).
> [    9.055835] gandalf kernel: [drm] register mmio base: 0xFCB00000
> [    9.055839] gandalf kernel: [drm] register mmio size: 524288
> [    9.059148] gandalf kernel: [drm:amdgpu_discovery_set_ip_blocks [amdgp=
u]] number of dies: 1
> [    9.059387] gandalf kernel: [drm:amdgpu_discovery_set_ip_blocks [amdgp=
u]] number of hardware IPs on die0: 39
> [    9.059623] gandalf kernel: [drm:amdgpu_discovery_set_ip_blocks [amdgp=
u]] ATHUB(35) #0 v2.0.0:
> [    9.059856] gandalf kernel: [drm:amdgpu_discovery_set_ip_blocks [amdgp=
u]]         0x00000c00
> [    9.060096] gandalf kernel: [drm:amdgpu_discovery_set_ip_blocks [amdgp=
u]]         0x02408c00
> [    9.060328] gandalf kernel: [drm:amdgpu_discovery_set_ip_blocks [amdgp=
u]] set register base offset for ATHUB
>
> a startup script, after sleep 15, turns off the logging:
>
>   echo 0 > /sys/module/drm/parameters/debug
>
> heres 1st 2 bits/classes/categories being turned off:
>
> [   29.105991] gandalf kernel: [drm:amdgpu_ih_process [amdgpu]] amdgpu_ih=
_process: rptr 90752, wptr 90784
> [   29.118086] gandalf kernel: dyndbg: bits:0x0 > *.debug
> [   29.118096] gandalf kernel: dyndbg: apply bitmap: 0x0 to: 0x1f for '*'
> [   29.118102] gandalf kernel: dyndbg: query 0: "class DRM_UT_CORE -p" mo=
d:*
> [   29.118122] gandalf kernel: dyndbg: good-class: drm.DRM_UT_CORE  modul=
e:drm nd:338 nc:1 nu:0
> [   29.119548] gandalf kernel: dyndbg: class-ref: drm_kms_helper.DRM_UT_C=
ORE  module:drm_kms_helper nd:93
> nc:0 nu:1
> [   29.119552] gandalf kernel: dyndbg: class-ref: drm_display_helper.DRM_=
UT_CORE  module:drm_display_helper nd:151 nc:0 nu:1
> [   29.119737] gandalf kernel: dyndbg: class-ref: amdgpu.DRM_UT_CORE  mod=
ule:amdgpu nd:4754 nc:0 nu:1
> [   29.122181] gandalf kernel: [drm:amdgpu_ih_process [amdgpu]] amdgpu_ih=
_process: rptr 90784, wptr 90816
> [   29.127687] gandalf kernel: dyndbg: processed 1 queries, with 466 matc=
hes, 0 errs
> [   29.127690] gandalf kernel: dyndbg: bit_0: 466 matches on class: DRM_U=
T_CORE -> 0x0
> [   29.127692] gandalf kernel: dyndbg: query 0: "class DRM_UT_DRIVER -p" =
mod:*
> [   29.127696] gandalf kernel: dyndbg: good-class: drm.DRM_UT_DRIVER  mod=
ule:drm nd:338 nc:1 nu:0
> [   29.127699] gandalf kernel: dyndbg: class-ref: drm_kms_helper.DRM_UT_D=
RIVER  module:drm_kms_helper nd:93 nc:0 nu:1
> [   29.127701] gandalf kernel: dyndbg: class-ref: drm_display_helper.DRM_=
UT_DRIVER  module:drm_display_helper nd:151 nc:0 nu:1
> [   29.127885] gandalf kernel: dyndbg: class-ref: amdgpu.DRM_UT_DRIVER  m=
odule:amdgpu nd:4754 nc:0 nu:1
> [   29.152925] gandalf kernel: dyndbg: processed 1 queries, with 1384 mat=
ches, 0 errs
>
>
> The resulting journal is ~14.6k lines, written in the 1st 15 (29)
> seconds of startup.  I'm unsure what the 15/29 discrepancy might
> indicate/betray, besides a lot of logging work.  sleep 15 is not the
> best stopwatch.
>
> recent spins thru lkp-test have also been SUCCESS-ful.
>
> Jim Cromie (35):
>
> old-bugs & cleanups:
>   dyndbg: fix old BUG_ON in >control parser
>   docs/dyndbg: update examples \012 to \n
>   test-dyndbg: fixup CLASSMAP usage error
>   dyndbg: reword "class unknown," to "class:_UNKNOWN_"
>   dyndbg: make ddebug_class_param union members same size
>   dyndbg: replace classmap list with a vector
>   dyndbg: ddebug_apply_class_bitmap - add module arg, select on it
>   dyndbg: split param_set_dyndbg_classes to _module & wrapper fns
>   dyndbg: drop NUM_TYPE_ARRAY
>   dyndbg: reduce verbose/debug clutter
>   dyndbg: silence debugs with no-change updates
>   dyndbg: tighten ddebug_class_name() 1st arg type
>   dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
>   dyndbg: reduce verbose=3D3 messages in ddebug_add_module
>   dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
>
> core fix & selftests:
>   dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP
>   selftests-dyndbg: add tools/testing/selftests/dynamic_debug/*
>   selftests-dyndbg: exit 127 if no facility
>   dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
>   dyndbg-doc: add classmap info to howto
>   dyndbg: treat comma as a token separator
>   selftests-dyndbg: add comma_terminator_tests
>   dyndbg: split multi-query strings with %
>   selftests-dyndbg: test_percent_splitting multi-cmds on module classes
>   docs/dyndbg: explain new delimiters: comma, percent
>   selftests-dyndbg: add test_mod_submod
>   selftests-dyndbg: test dyndbg-to-tracefs
>   dyndbg-doc: explain flags parse 1st
>   dyndbg: add __counted_by annotations
>
> DRM parts
>   drm+drivers: adapt to use DYNDBG_CLASSMAP_{DEFINE,USE}
>   drm-dyndbg: adapt to use DYNDBG_CLASSMAP_PARAM
>   drm: use correct ccflags-y spelling
>   drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
>   drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
>   drm-print: workaround compiler meh
>
>  .../admin-guide/dynamic-debug-howto.rst       |  99 ++-
>  MAINTAINERS                                   |   3 +-
>  drivers/gpu/drm/Kconfig                       |   3 +-
>  drivers/gpu/drm/Makefile                      |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
>  drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
>  drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +
>  drivers/gpu/drm/drm_print.c                   |  38 +-
>  drivers/gpu/drm/gud/gud_drv.c                 |   2 +
>  drivers/gpu/drm/i915/i915_params.c            |  12 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c         |   2 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +-
>  drivers/gpu/drm/qxl/qxl_drv.c                 |   2 +
>  drivers/gpu/drm/radeon/radeon_drv.c           |   2 +
>  drivers/gpu/drm/udl/udl_main.c                |   2 +
>  drivers/gpu/drm/vkms/vkms_drv.c               |   2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +
>  include/asm-generic/vmlinux.lds.h             |   1 +
>  include/drm/drm_print.h                       |  10 +
>  include/linux/dynamic_debug.h                 | 130 ++-
>  kernel/module/main.c                          |   3 +
>  lib/Kconfig.debug                             |  24 +-
>  lib/Makefile                                  |   3 +
>  lib/dynamic_debug.c                           | 443 ++++++----
>  lib/test_dynamic_debug.c                      | 131 +--
>  lib/test_dynamic_debug_submod.c               |  17 +
>  tools/testing/selftests/Makefile              |   1 +
>  .../testing/selftests/dynamic_debug/Makefile  |   9 +
>  tools/testing/selftests/dynamic_debug/config  |   2 +
>  .../dynamic_debug/dyndbg_selftest.sh          | 765 ++++++++++++++++++
>  31 files changed, 1398 insertions(+), 363 deletions(-)
>  create mode 100644 lib/test_dynamic_debug_submod.c
>  create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
>  create mode 100644 tools/testing/selftests/dynamic_debug/config
>  create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest=
.sh
>
> --
> 2.44.0
>

