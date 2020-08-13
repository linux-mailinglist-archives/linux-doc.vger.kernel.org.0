Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A411C24401F
	for <lists+linux-doc@lfdr.de>; Thu, 13 Aug 2020 22:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgHMUwJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Aug 2020 16:52:09 -0400
Received: from ms.lwn.net ([45.79.88.28]:49068 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726192AbgHMUwJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 Aug 2020 16:52:09 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9E85D559;
        Thu, 13 Aug 2020 20:52:08 +0000 (UTC)
Date:   Thu, 13 Aug 2020 14:52:07 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation fixes for 5.9
Message-ID: <20200813145207.0a4a3078@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following changes since commit
2c12c8103d8f15790cf880f1545dafa36acb004a:

  scripts/kernel-doc: optionally treat warnings as errors (2020-07-31 11:11:17 -0600)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-5.9-2

for you to fetch changes up to 1edcd4675e44dc0e6e3b34e8e29000d8a05f998c:

  Documentation/locking/locktypes: fix the typo (2020-08-13 14:47:38 -0600)

----------------------------------------------------------------
A handful of obvious fixes that wandered in during the merge window.

----------------------------------------------------------------
Billy Wilson (1):
      docs: Correct the release date of 5.2 stable

Bryan Brattlof (1):
      docs: trace: fix a typo

Huang Shijie (1):
      Documentation/locking/locktypes: fix the typo

Kees Cook (1):
      mailmap: Update comments for with format and more detalis

Lukas Bulwahn (2):
      doc/zh_CN: fix title heading markup in admin-guide cpu-load
      doc/zh_CN: resolve undefined label warning in admin-guide index

Puranjay Mohan (3):
      Filesystems: Documentation: Replace deprecated :c:func: Usage
      Dev-tools: Documentation: Replace deprecated :c:func: Usage
      Core-api: Documentation: Replace deprecated :c:func: Usage

Randy Dunlap (1):
      Doc: admin-guide: use correct legends in kernel-parameters.txt

Remi Andruccioli (1):
      docs: cdrom: Fix a typo and rst markup

Stephen Kitt (1):
      docs: remove the 2.6 "Upgrading I2C Drivers" guide

Sumera Priyadarsini (1):
      documentation: coccinelle: Improve command example for make C={1,2}

Tobias Klauser (1):
      Documentation/features: refresh RISC-V arch support files

 .mailmap                                           |   9 +-
 Documentation/admin-guide/kernel-parameters.txt    |  36 +--
 Documentation/cdrom/cdrom-standard.rst             |   4 +-
 Documentation/core-api/idr.rst                     |  32 +--
 Documentation/dev-tools/coccinelle.rst             |  15 +-
 Documentation/dev-tools/kgdb.rst                   |  16 +-
 .../features/debug/kmemleak/arch-support.txt       |   2 +-
 .../features/debug/stackprotector/arch-support.txt |   2 +-
 .../features/locking/lockdep/arch-support.txt      |   2 +-
 .../time/context-tracking/arch-support.txt         |   2 +-
 Documentation/filesystems/journalling.rst          |  66 ++---
 Documentation/i2c/index.rst                        |   1 -
 Documentation/i2c/upgrading-clients.rst            | 285 ---------------------
 Documentation/locking/locktypes.rst                |   2 +-
 Documentation/process/2.Process.rst                |   2 +-
 Documentation/trace/intel_th.rst                   |   2 +-
 .../translations/zh_CN/admin-guide/cpu-load.rst    |   4 +-
 .../translations/zh_CN/admin-guide/index.rst       |   2 +-
 18 files changed, 105 insertions(+), 379 deletions(-)
 delete mode 100644 Documentation/i2c/upgrading-clients.rst
