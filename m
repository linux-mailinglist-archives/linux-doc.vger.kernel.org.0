Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B038340349
	for <lists+linux-doc@lfdr.de>; Thu, 18 Mar 2021 11:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhCRK3y (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Mar 2021 06:29:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:45838 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229996AbhCRK3Z (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Mar 2021 06:29:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 41A90ACBF;
        Thu, 18 Mar 2021 10:29:24 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
        broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
        emil.l.velikov@gmail.com, geert+renesas@glider.be,
        hdegoede@redhat.com, bluescreen_avenger@verizon.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/10] drm: Support simple-framebuffer devices and firmware fbs
Date:   Thu, 18 Mar 2021 11:29:11 +0100
Message-Id: <20210318102921.21536-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patchset adds support for simple-framebuffer platform devices and
a handover mechanism for native drivers to take-over control of the
hardware.

The new driver, called simpledrm, binds to a simple-frambuffer platform
device. The kernel's boot code creates such devices for firmware-provided
framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
loader sets up the framebuffers. Description via device tree is also an
option.

Simpledrm is small enough to be linked into the kernel. The driver's main
purpose is to provide graphical output during the early phases of the boot
process, before the native DRM drivers are available. Native drivers are
typically loaded from an initrd ram disk. Occationally simpledrm can also
serve as interim solution on graphics hardware without native DRM driver.

So far distributions rely on fbdev drivers, such as efifb, vesafb or
simplefb, for early-boot graphical output. However fbdev is deprecated and
the drivers do not provide DRM interfaces for modern userspace.

Patches 1 and 2 prepare the DRM format helpers for simpledrm.

Patches 3 and 4 add a hand-over mechanism. Simpledrm acquires it's
framebuffer's I/O-memory range and provides a callback function to be
removed by a native driver. The native driver will remove simpledrm before
taking over the hardware. The removal is integrated into existing helpers,
so drivers use it automatically.

Patches 5 to 10 add the simpledrm driver. It's build on simple DRM helpers
and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
pageflips, SHMEM buffers are copied into the framebuffer memory, similar
to cirrus or mgag200. The code in patches 8 and 9 handles clocks and
regulators. It's based on the simplefb drivers, but has been modified for
DRM.

I've also been working on fastboot support (i.e., flicker-free booting).
This requires state-readout from simpledrm via generic interfaces, as
outlined in [1]. I do have some prototype code, but it will take a while
to get this ready. Simpledrm will then support it.

I've tested simpledrm with x86 EFI and VESA framebuffers, which both work
reliably. The fbdev console and Weston work automatically. Xorg requires
manual configuration of the device. Xorgs current modesetting driver does
not work with both, platform and PCI device, for the same physical
hardware. Once configured, X11 works. I looked into X11, but couldn't see
an easy way of fixing the problem. With the push towards Wayland+Xwayland
I expect the problem to become a non-issue soon. Additional testing has
been reported at [2].

One cosmetical issue is that simpledrm's device file is card0 and the
native driver's device file is card1. After simpledrm has been kicked out,
only card1 is left. This does not seem to be a practical problem however.

TODO/IDEAS:

	* provide deferred takeover
	* provide bootsplash DRM client
	* make simplekms usable with ARM-EFI fbs

v2:
	* rename to simpledrm, aperture helpers
	* reorganized patches
	* use hotplug helpers for removal (Daniel)
	* added DT match tables (Rob)
	* use shadow-plane helpers
	* lots of minor cleanups

[1] https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/
[2] https://lore.kernel.org/dri-devel/1761762.3HQLrFs1K7@nerdopolis/

Thomas Zimmermann (10):
  drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip()
  drm/format-helper: Add blitter functions
  drm/aperture: Move fbdev conflict helpers into drm_aperture.h
  drm/aperture: Add infrastructure for aperture ownership
  drm: Add simpledrm driver
  drm/simpledrm: Add fbdev emulation
  drm/simpledrm: Initialize framebuffer data from device-tree node
  drm/simpledrm: Acquire clocks from DT device node
  drm/simpledrm: Acquire regulators from DT device node
  drm/simpledrm: Acquire memory aperture for framebuffer

 Documentation/gpu/drm-internals.rst    |  12 +
 MAINTAINERS                            |   7 +
 drivers/gpu/drm/Kconfig                |   7 +
 drivers/gpu/drm/Makefile               |   1 +
 drivers/gpu/drm/drm_aperture.c         | 287 ++++++++
 drivers/gpu/drm/drm_format_helper.c    |  96 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
 drivers/gpu/drm/tiny/Kconfig           |  17 +
 drivers/gpu/drm/tiny/Makefile          |   1 +
 drivers/gpu/drm/tiny/cirrus.c          |   2 +-
 drivers/gpu/drm/tiny/simpledrm.c       | 932 +++++++++++++++++++++++++
 include/drm/drm_aperture.h             |  96 +++
 include/drm/drm_fb_helper.h            |  56 +-
 include/drm/drm_format_helper.h        |  10 +-
 14 files changed, 1466 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_aperture.c
 create mode 100644 drivers/gpu/drm/tiny/simpledrm.c
 create mode 100644 include/drm/drm_aperture.h

--
2.30.1

