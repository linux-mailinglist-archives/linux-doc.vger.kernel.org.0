Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4550135C724
	for <lists+linux-doc@lfdr.de>; Mon, 12 Apr 2021 15:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241764AbhDLNLE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Apr 2021 09:11:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:55700 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241498AbhDLNLE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Apr 2021 09:11:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E41B4AFEF;
        Mon, 12 Apr 2021 13:10:45 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] drm: Add aperture helpers
Date:   Mon, 12 Apr 2021 15:10:40 +0200
Message-Id: <20210412131043.5787-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds helpers for maintaining aperture ownership. Currently wraps
the infrastructure around fbdev's remove_conflicting_framebuffers().

For adding generic drivers to DRM, we need a hand-over mechanism
that unloads the generic driver before loading the hardware's native
driver. So far, this was supported for generic fbdev drivers, but
not for DRM drivers.

As a first step, this patchset provides a DRM interface to release
ownership of a framebuffer aperture. When called, all generic drivers
for framebuffers in the range are being unloaded. At this point
the functions wrap similar fbdev functionality. The old fbdev-based
interface is being inlined into the new functionsa and drivers are
converted.

The patchset is based on patches 3 and 4 of [1]. I incorporated the
review comments and kept the acked-bys.

All converted drivers have been built at least once on either x86-64,
aarch64 or arm.

[1] https://lore.kernel.org/dri-devel/20210318102921.21536-1-tzimmermann@suse.de/

v2:
	* fix docs for drm_aperture_remove_framebuffers()

Thomas Zimmermann (3):
  drm/aperture: Add infrastructure for aperture ownership
  drm/aperture: Convert drivers to aperture interfaces
  drm/aperture: Inline fbdev conflict helpers into aperture helpers

 Documentation/gpu/drm-internals.rst           |  12 ++
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   3 +-
 drivers/gpu/drm/armada/armada_drv.c           |   5 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  23 ++-
 drivers/gpu/drm/bochs/bochs_drv.c             |   3 +-
 drivers/gpu/drm/drm_aperture.c                | 131 ++++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   4 +-
 drivers/gpu/drm/i915/i915_drv.c               |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |  27 ++--
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   5 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |   5 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   3 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   5 +-
 drivers/gpu/drm/radeon/radeon_drv.c           |   3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   5 +-
 drivers/gpu/drm/tegra/drm.c                   |   4 +-
 drivers/gpu/drm/tiny/cirrus.c                 |   3 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |   3 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |   5 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   4 +-
 include/drm/drm_aperture.h                    |  31 +++++
 include/drm/drm_fb_helper.h                   |  51 -------
 24 files changed, 242 insertions(+), 108 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_aperture.c
 create mode 100644 include/drm/drm_aperture.h

--
2.31.1

