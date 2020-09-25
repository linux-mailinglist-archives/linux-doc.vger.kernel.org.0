Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E278127865C
	for <lists+linux-doc@lfdr.de>; Fri, 25 Sep 2020 13:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgIYL4H (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Sep 2020 07:56:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:45390 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727521AbgIYL4G (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Sep 2020 07:56:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 44E1DAEF5;
        Fri, 25 Sep 2020 11:56:05 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     sumit.semwal@linaro.org, christian.koenig@amd.com, afd@ti.com,
        corbet@lwn.net, benjamin.gaignard@linaro.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, mchehab@kernel.org,
        matthew.auld@intel.com, robin.murphy@arm.com,
        thomas.hellstrom@intel.com, sam@ravnborg.org, kraxel@redhat.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O memory
Date:   Fri, 25 Sep 2020 13:55:57 +0200
Message-Id: <20200925115601.23955-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dma-buf provides vmap() and vunmap() for retriving and releasing mappings
of dma-buf memory in kernel address space. The functions operate with plain
addresses and the assumption is that the memory can be accessed with load
and store operations. This is not the case on some architectures (e.g.,
sparc64) where I/O memory can only be accessed with dedicated instructions.

This patchset introduces struct dma_buf_map, which contains the address of
a buffer and a flag that tells whether system- or I/O-memory instructions
are required.

Some background: updating the DRM framebuffer console on sparc64 makes the
kernel panic. This is because the framebuffer memory cannot be accessed with
system-memory instructions. We currently employ a workaround in DRM to
address this specific problem. [1]

To resolve the problem, we'd like to address it at the most common point,
which is the dma-buf framework. The dma-buf mapping ideally knows if I/O
instructions are required and exports this information to it's users. The
new structure struct dma_buf_map stores the buffer address and a flag that
signals I/O memory. Affected users of the buffer (e.g., drivers, frameworks)
can then access the memory accordingly.

This patchset only introduces struct dma_buf_map, and updates struct dma_buf
and it's interfaces. Further patches can update dma-buf users. For example,
there's a prototype patchset for DRM that fixes the framebuffer problem. [2]

Further work: TTM, one of DRM's memory managers, already exports an
is_iomem flag of its own. It could later be switched over to exporting struct
dma_buf_map, thus simplifying some code. Several DRM drivers expect their
fbdev console to operate on I/O memory. These could possibly be switched over
to the generic fbdev emulation, as soon as the generic code uses struct
dma_buf_map.

v3:
	* update fastrpc driver (kernel test robot)
	* expand documentation (Daniel)
	* move documentation into separate patch
v2:
	* always clear map parameter in dma_buf_vmap() (Daniel)
	* include dma-buf-heaps and i915 selftests (kernel test robot)
	* initialize cma_obj before using it in drm_gem_cma_free_object()
	  (kernel test robot)

[1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg.org/
[2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmermann@suse.de/

Thomas Zimmermann (4):
  dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
  dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
  dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
  dma-buf: Document struct dma_buf_map

 Documentation/driver-api/dma-buf.rst          |   9 +
 drivers/dma-buf/dma-buf.c                     |  42 ++--
 drivers/dma-buf/heaps/heap-helpers.c          |  10 +-
 drivers/gpu/drm/drm_gem_cma_helper.c          |  20 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 +-
 drivers/gpu/drm/drm_prime.c                   |  15 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 +-
 .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |  14 +-
 drivers/gpu/drm/tegra/gem.c                   |  23 ++-
 .../common/videobuf2/videobuf2-dma-contig.c   |  17 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  19 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  21 +-
 drivers/misc/fastrpc.c                        |   6 +-
 include/drm/drm_prime.h                       |   5 +-
 include/linux/dma-buf-map.h                   | 193 ++++++++++++++++++
 include/linux/dma-buf.h                       |  11 +-
 18 files changed, 372 insertions(+), 94 deletions(-)
 create mode 100644 include/linux/dma-buf-map.h

--
2.28.0

