Return-Path: <linux-doc+bounces-156-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA377C740C
	for <lists+linux-doc@lfdr.de>; Thu, 12 Oct 2023 19:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7C6D1C21056
	for <lists+linux-doc@lfdr.de>; Thu, 12 Oct 2023 17:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A7F347C4;
	Thu, 12 Oct 2023 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmZrjaiK"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE5834199
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 17:21:47 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC172C6;
	Thu, 12 Oct 2023 10:21:45 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7a2bfd584f0so51414839f.0;
        Thu, 12 Oct 2023 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697131305; x=1697736105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dJs8k/8KlrmQtpA0CkiLpHx7YBAuj0tXGKp3HNTHAHg=;
        b=MmZrjaiKYyX0/aF583F9eu+hIAjm4VfrviEO0YIPMC62sDwhQToMf+zt8PTn2FJwLi
         LS2nkKozixlxK08UzylROmzGPmzzac9htjq/GDU3jIf6TannGKB21c+i1C5lrzNKEQr8
         jOzNjOGnHC7UH5TNdkddWbSN6d2+A+oyT798+qRbMP4XgJukrsR0BgElBP0z/qMhpun9
         vDJ+gVh7sj80DMqRb4HJ6vLWpGR+o5u9PSyr3j6d1lk+ZENnawIQ6vL9m4HZnKA5y1Bp
         u6+wMUhuXfYH084KUUPXMNI+h314RkQ1Z0RnLaiupF6v9UAb0qKdbU/UCogY1czjiCnP
         tP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697131305; x=1697736105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJs8k/8KlrmQtpA0CkiLpHx7YBAuj0tXGKp3HNTHAHg=;
        b=IN+zRtTmohvfS7Fr2HnsZLkGGHJSYJ+xrXRJGhkwGVzN+ACM8Pv7rwImYda129qGCw
         nfecFdJYaXGhsvH5vE7gY7MjHQPIzWFJuE6PFDY2z8jYg/WMTvzLieTkgFtAdeZpB5KA
         1UZbXGRS0o3pXZXa9TfXc1eiRJ9WYzdC/1G5ZZ9vrcojhzgceB5D30u6hz59LE5d5StH
         nIhHP82a8tNYTSEBOqw0t/U6ysSjxqLWEZ/Rf+INQRRrfJIP9FipGpNsWVGKbOhkAxGU
         SOqJ5DHFR3YGaFxly/J6gSEvrOg88txUHSd8DyrKyTpRVoy/dmVOZ2aFgPtP0GWVVOBA
         7nPw==
X-Gm-Message-State: AOJu0Yzt4rry/EY087Ip0wfoi6OXmKqwGxWu9Mc/Y/wEyS83sz3JZfFf
	R7huPJMpNdN33jZejSGE4AlJP42W51KJkA==
X-Google-Smtp-Source: AGHT+IFSbmKh2tgHdx5hRKItGC6Ju6zKHgF0pi/HbnUffxRaaDdOTY5F94hWaW5GBheN4k6+tUCr1g==
X-Received: by 2002:a5d:9ac4:0:b0:79f:d195:5384 with SMTP id x4-20020a5d9ac4000000b0079fd1955384mr27162668ion.17.1697131304923;
        Thu, 12 Oct 2023 10:21:44 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:21:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: daniel.vetter@ffwll.ch,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	linux-doc@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7 00/25] fix DRM_USE_DYNAMIC_DEBUG=y regression
Date: Thu, 12 Oct 2023 11:21:11 -0600
Message-ID: <20231012172137.3286566-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

hi Jason, DRM-folk

This patchest fixes the chicken-egg initialization problem in the 1st
version of ddebug-class-maps, that DRM-CI uncovered.

The root-problem was DECLARE_DYNDBG_CLASSMAP, which broke the K&R rule:
"define once, refer many".  In patch 14 it is replaced by:

 DYNDBG_CLASSMAP_DEFINE - define and export a struct ddebug_class_map
 DYNDBG_CLASSMAP_USE - ref the exported struct

test-dynamic-debug is also extended with a -submod.ko, in order to
recapitulate the drm & drivers initialization scenario.

They're on v6.6-rc5 now, and apply cleanly to drm-tip/drm-tip.

Ive been running recent revs on rc3+, on my desktop and laptop.

The final blocker was a missing __align(8) on the ddebug_class_user
record inserted by DYNDBG_CLASSMAP_USE.  This caused DRM=y (builtin
only) to have a corrupt record for drm_kms_helper (builtin dependent).
Curiously, a clang build did not exhibit this problem.

Heres a part of dmesg, for a DRM=y kernel, booted with
     dynamic_debug.verbose=3 drm.debug=0x10

[    0.466747] dyndbg: add-module: drm 406 sites
[    0.467569] dyndbg: classes[0]: module:drm base:0 len:10 type:DISJOINT_BITS
[    0.467743] dyndbg: module:drm attached 1 classes
[    0.468557] dyndbg: builtin class: module:drm base:0 len:10 type:DISJOINT_BITS
[    0.468742] dyndbg:  found kp:drm.debug =0x10
[    0.468743] dyndbg:   mapped to: module:drm base:0 len:10 type:DISJOINT_BITS
[    0.469742] dyndbg:   drm.debug: classbits: 0x10
[    0.470573] dyndbg: apply bitmap: 0x10 to: 0x0 for drm
[    0.470743] dyndbg: query 0: "class DRM_UT_ATOMIC +p" mod:drm
[    0.471743] dyndbg: split into words: "class" "DRM_UT_ATOMIC" "+p"
[    0.472743] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[    0.473679] dyndbg: parsed: func="" file="" module="drm" format="" lineno=0-0 class=DRM_UT_ATOMIC
[    0.473749] dyndbg: processed 1 queries, with 0 matches, 0 errs
[    0.474742] dyndbg: bit_4: 0 matches on class: DRM_UT_ATOMIC -> 0x10
[    0.475742] dyndbg: applied bitmap: 0x10 to: 0x0 for drm
[    0.476686] dyndbg: 406 debug prints in module drm
[    0.476743] dyndbg: add-module: drm_kms_helper 93 sites
[    0.477727] dyndbg: class_ref[0] drm_kms_helper -> drm module:drm base:0 len:10 type:DISJOINT_BITS
[    0.477743] dyndbg: builtin class: module:drm base:0 len:10 type:DISJOINT_BITS
[    0.478742] dyndbg:  found kp:drm.debug =0x10
[    0.478743] dyndbg:   mapped to: module:drm base:0 len:10 type:DISJOINT_BITS
[    0.479743] dyndbg:   drm.debug: classbits: 0x10
[    0.480592] dyndbg: apply bitmap: 0x10 to: 0x0 for drm_kms_helper
[    0.480743] dyndbg: query 0: "class DRM_UT_ATOMIC +p" mod:drm_kms_helper
[    0.481743] dyndbg: split into words: "class" "DRM_UT_ATOMIC" "+p"
[    0.482743] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[    0.483743] dyndbg: parsed: func="" file="" module="drm_kms_helper" format="" lineno=0-0 class=DRM_UT_ATOMIC
[    0.484750] dyndbg: class-ref: drm_kms_helper.DRM_UT_ATOMIC  module:drm_kms_helper nd:93 nc:0 nu:1
[    0.485809] dyndbg: processed 1 queries, with 44 matches, 0 errs
[    0.486742] dyndbg: bit_4: 44 matches on class: DRM_UT_ATOMIC -> 0x10
[    0.487742] dyndbg: applied bitmap: 0x10 to: 0x0 for drm_kms_helper
[    0.488743] dyndbg: attach-client-module:  module:drm_kms_helper nd:93 nc:0 nu:1
[    0.489742] dyndbg:  93 debug prints in module drm_kms_helper

Widespread testing is appreciated.
I have scripts if anyone wants them.

I'll forward lkp-robot reports here when I get them.

Jim Cromie (25):
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: replace classmap list with a vector
  dyndbg: ddebug_apply_class_bitmap - add module arg, select on it
  dyndbg: split param_set_dyndbg_classes to module/wrapper fns
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: reduce verbose/debug clutter
  dyndbg: silence debugs with no-change updates
  dyndbg: tighten ddebug_class_name() 1st arg type
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: reduce verbose=3 messages in ddebug_add_module
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  dyndbg-API: fix CONFIG_DRM_USE_DYNAMIC_DEBUG regression
  dyndbg: add for_each_boxed_vector
  dyndbg: refactor ddebug_classparam_clamp_input
  dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
  dyndbg-doc: add classmap info to howto
  dyndbg: reserve flag bit _DPRINTK_FLAGS_PREFIX_CACHED
  dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP
  dyndbg: refactor *dynamic_emit_prefix
  dyndbg: improve err report in attach_user_module_classes
  drm: use correct ccflags-y spelling
  drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN

 .../admin-guide/dynamic-debug-howto.rst       |  59 ++-
 MAINTAINERS                                   |   2 +-
 drivers/gpu/drm/Kconfig                       |   3 +-
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +
 drivers/gpu/drm/drm_print.c                   |  35 +-
 drivers/gpu/drm/gud/gud_drv.c                 |   2 +
 drivers/gpu/drm/i915/i915_params.c            |  12 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 +
 drivers/gpu/drm/radeon/radeon_drv.c           |   2 +
 drivers/gpu/drm/udl/udl_main.c                |   2 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +
 include/asm-generic/vmlinux.lds.h             |   1 +
 include/drm/drm_print.h                       |  12 +-
 include/linux/dynamic_debug.h                 | 121 +++--
 kernel/module/main.c                          |   3 +
 lib/Kconfig.debug                             |  22 +-
 lib/Makefile                                  |   3 +
 lib/dynamic_debug.c                           | 478 +++++++++++-------
 lib/test_dynamic_debug.c                      | 137 ++---
 lib/test_dynamic_debug_submod.c               |  17 +
 27 files changed, 599 insertions(+), 373 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

-- 
2.41.0


