Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0A41AFB19
	for <lists+linux-doc@lfdr.de>; Wed, 11 Sep 2019 13:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbfIKLJU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Sep 2019 07:09:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:33718 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727408AbfIKLJU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Sep 2019 07:09:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BB7E4AF23;
        Wed, 11 Sep 2019 11:09:18 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, kraxel@redhat.com, airlied@linux.ie,
        corbet@lwn.net, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/4] Merge VRAM MM and GEM VRAM source files
Date:   Wed, 11 Sep 2019 13:09:06 +0200
Message-Id: <20190911110910.30698-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VRAM MM and GEM VRAM are only used with each other. This patch set
moves VRAM MM into GEM VRAM source files and cleans up the helper's
public interface.

Version 2 of the patch set doesn't contain functional changes. I'm
reposting due to the rebasing onto the debugfs patches.

v2:
	* updated for debugfs support
	* fixed typos in comments

Thomas Zimmermann (4):
  drm/vram: Move VRAM memory manager to GEM VRAM implementation
  drm/vram: Have VRAM MM call GEM VRAM functions directly
  drm/vram: Unexport internal functions of VRAM MM
  drm/vram: Unconditonally set BO call-back functions

 Documentation/gpu/drm-mm.rst                  |  12 -
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/ast/ast_drv.c                 |   1 -
 drivers/gpu/drm/ast/ast_main.c                |   1 -
 drivers/gpu/drm/ast/ast_ttm.c                 |   3 +-
 drivers/gpu/drm/bochs/bochs.h                 |   1 -
 drivers/gpu/drm/bochs/bochs_mm.c              |   3 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         | 406 +++++++++++++++---
 drivers/gpu/drm/drm_vram_helper_common.c      |   8 +-
 drivers/gpu/drm/drm_vram_mm_helper.c          | 353 ---------------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   |   3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h         |   1 -
 drivers/gpu/drm/mgag200/mgag200_ttm.c         |   3 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h          |   2 -
 drivers/gpu/drm/vboxvideo/vbox_ttm.c          |   3 +-
 include/drm/drm_gem_vram_helper.h             |  92 +++-
 include/drm/drm_vram_mm_helper.h              | 109 -----
 18 files changed, 421 insertions(+), 584 deletions(-)
 delete mode 100644 drivers/gpu/drm/drm_vram_mm_helper.c
 delete mode 100644 include/drm/drm_vram_mm_helper.h

--
2.23.0

