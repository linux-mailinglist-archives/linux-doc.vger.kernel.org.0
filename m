Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514A13A7009
	for <lists+linux-doc@lfdr.de>; Mon, 14 Jun 2021 22:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbhFNUTU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Jun 2021 16:19:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25364 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235096AbhFNUTL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 16:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623701827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=6BGYUcTx5tsZwPa17u6H+0H1QgwUbqfF91m+1x+AxEk=;
        b=YJHWV82vS1RnOkr8kEctR5xoLTs1gYFhORbJ6aNj78xb5/7gOJdYxxcY7PJ6dlIJ/JU5du
        eF6711JUqtasJ4jNOQ8VWU/tdK9m+TiNAzpybLEEixAFQbI4qEvknTZbyIsl/v9c82jRD/
        pZ8I42tjndDmv2svjIyE3Ki5MigFO4w=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-pdcORlNmNwS8TTnswHUDog-1; Mon, 14 Jun 2021 16:17:06 -0400
X-MC-Unique: pdcORlNmNwS8TTnswHUDog-1
Received: by mail-oo1-f71.google.com with SMTP id l13-20020a4aa78d0000b0290245c8f11ac2so7635204oom.11
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 13:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6BGYUcTx5tsZwPa17u6H+0H1QgwUbqfF91m+1x+AxEk=;
        b=MrCgQ4qftDcuIzSyo0SFDqdt3KztjWMu+S8eHZj1v1CbxnIRfl1SixnheJuVVN89JL
         GA0H1tIKIRPvgjgCxWEjzVAXv4VFGqoa0bca0AIzDEu9Ql4QtdQ/GDdBSndnKiSz/U4E
         hoBC4y1E2yPPMVOu5nZiTrWvJcOPs6t7lEbsUxU92fbLSWXP1j1+S1tEVWrKpHUoAGmo
         AUeHxvYdB/fV9pCqaCw2Wr7qN8yZaf1XZVfNbopjclFhy+bIuIz72xWf5i98XX5deVpn
         C2QWEPh2TThoMh/ty5L6GfvsaN4NsAgyjxUdto2YGsmG/ECdNhvc7O2roxpVngBL0yPH
         +LIA==
X-Gm-Message-State: AOAM530phzCRc2n7PPphNVHf9dtsIxteWOcjxTGb+ea+tA3TbnS0KiBu
        UCsAIW8NKvA4rZTPA3CMhX70W8wmTx0jbwrTFUR/7B0G6bR+WhYpQVQ2M5yoKl/eVJtx5jCgS/+
        N4YTaEagXpO1xDkyAUe8G
X-Received: by 2002:a9d:ea2:: with SMTP id 31mr15359830otj.200.1623701825793;
        Mon, 14 Jun 2021 13:17:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxStQ7LCZTicbomt7siOy4OuZfVD05aIA2Dix5G42Cxc5pR7KAybcNVdBiEuXhJuxkEq35kJg==
X-Received: by 2002:a9d:ea2:: with SMTP id 31mr15359806otj.200.1623701825558;
        Mon, 14 Jun 2021 13:17:05 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b198sm408535oii.19.2021.06.14.13.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 13:17:05 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net,
        michal.simek@xilinx.com, gregkh@linuxfoundation.org,
        krzysztof.kozlowski@canonical.com, nava.manne@xilinx.com,
        yilun.xu@intel.com, davidgow@google.com, fpacheco@redhat.com,
        richard.gong@intel.com, luca@lucaceresoli.net
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH v4 0/4] fpga: reorganize to subdirs
Date:   Mon, 14 Jun 2021 13:16:43 -0700
Message-Id: <20210614201648.3358206-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The incoming xrt patchset has a toplevel subdir xrt/
The current fpga/ uses a single dir with filename prefixes to subdivide owners
For consistency, there should be only one way to organize the fpga/ dir.
Because the subdir model scales better, refactor to use it.
The discussion wrt xrt is here:
https://lore.kernel.org/linux-fpga/68e85a4f-4a10-1ff9-0443-aa565878c855@redhat.com/

Follow drivers/net/ethernet/ which has control configs
NET_VENDOR_BLA that map to drivers/net/ethernet/bla
Since fpgas do not have many vendors, drop the 'VENDOR' and use
FPGA_BLA.

There are several new subdirs
altera/
dfl/
lattice/
xilinx/

Each subdir has a Kconfig that has a new/reused

if FPGA_BLA
  ... existing configs ...
endif FPGA_BLA

Which is sourced into the main fpga/Kconfig

Each subdir has a Makefile whose transversal is controlled in the
fpga/Makefile by

obj-$(CONFIG_FPGA_BLA) += bla/

Some cleanup to arrange thing alphabetically and make fpga/Makefile's
whitespace look more like net/'s

Changes from
v1
  Drop renaming files
  Cleanup makefiles

v2
  Expand commit messages
  Add SPDX to Kconfig
  Expand new Kconfig variable help messages

v3
  Update Documentation/fpga/dfl.rst for fpga/dfl/

Tom Rix (4):
  fpga: dfl: reorganize to subdir layout
  fpga: xilinx: reorganize to subdir layout
  fpga: altera: reorganize to subdir layout
  fpga: lattice: reorganize to subdir layout

 Documentation/fpga/dfl.rst                    |   4 +-
 MAINTAINERS                                   |   2 +-
 drivers/fpga/Kconfig                          | 204 +-----------------
 drivers/fpga/Makefile                         |  47 +---
 drivers/fpga/altera/Kconfig                   |  85 ++++++++
 drivers/fpga/altera/Makefile                  |  12 ++
 drivers/fpga/{ => altera}/altera-cvp.c        |   0
 drivers/fpga/{ => altera}/altera-fpga2sdram.c |   0
 .../fpga/{ => altera}/altera-freeze-bridge.c  |   0
 drivers/fpga/{ => altera}/altera-hps2fpga.c   |   0
 .../{ => altera}/altera-pr-ip-core-plat.c     |   0
 drivers/fpga/{ => altera}/altera-pr-ip-core.c |   0
 drivers/fpga/{ => altera}/altera-ps-spi.c     |   0
 drivers/fpga/{ => altera}/socfpga-a10.c       |   0
 drivers/fpga/{ => altera}/socfpga.c           |   0
 drivers/fpga/{ => altera}/stratix10-soc.c     |   0
 drivers/fpga/{ => altera}/ts73xx-fpga.c       |   0
 drivers/fpga/dfl/Kconfig                      |  83 +++++++
 drivers/fpga/dfl/Makefile                     |  16 ++
 drivers/fpga/{ => dfl}/dfl-afu-dma-region.c   |   0
 drivers/fpga/{ => dfl}/dfl-afu-error.c        |   0
 drivers/fpga/{ => dfl}/dfl-afu-main.c         |   0
 drivers/fpga/{ => dfl}/dfl-afu-region.c       |   0
 drivers/fpga/{ => dfl}/dfl-afu.h              |   0
 drivers/fpga/{ => dfl}/dfl-fme-br.c           |   0
 drivers/fpga/{ => dfl}/dfl-fme-error.c        |   0
 drivers/fpga/{ => dfl}/dfl-fme-main.c         |   0
 drivers/fpga/{ => dfl}/dfl-fme-mgr.c          |   0
 drivers/fpga/{ => dfl}/dfl-fme-perf.c         |   0
 drivers/fpga/{ => dfl}/dfl-fme-pr.c           |   0
 drivers/fpga/{ => dfl}/dfl-fme-pr.h           |   0
 drivers/fpga/{ => dfl}/dfl-fme-region.c       |   0
 drivers/fpga/{ => dfl}/dfl-fme.h              |   0
 drivers/fpga/{ => dfl}/dfl-n3000-nios.c       |   0
 drivers/fpga/{ => dfl}/dfl-pci.c              |   0
 drivers/fpga/{ => dfl}/dfl.c                  |   0
 drivers/fpga/{ => dfl}/dfl.h                  |   0
 drivers/fpga/lattice/Kconfig                  |  29 +++
 drivers/fpga/lattice/Makefile                 |   4 +
 drivers/fpga/{ => lattice}/ice40-spi.c        |   0
 drivers/fpga/{ => lattice}/machxo2-spi.c      |   0
 drivers/fpga/xilinx/Kconfig                   |  55 +++++
 drivers/fpga/xilinx/Makefile                  |   6 +
 .../fpga/{ => xilinx}/xilinx-pr-decoupler.c   |   0
 drivers/fpga/{ => xilinx}/xilinx-spi.c        |   0
 drivers/fpga/{ => xilinx}/zynq-fpga.c         |   0
 drivers/fpga/{ => xilinx}/zynqmp-fpga.c       |   0
 47 files changed, 305 insertions(+), 242 deletions(-)
 create mode 100644 drivers/fpga/altera/Kconfig
 create mode 100644 drivers/fpga/altera/Makefile
 rename drivers/fpga/{ => altera}/altera-cvp.c (100%)
 rename drivers/fpga/{ => altera}/altera-fpga2sdram.c (100%)
 rename drivers/fpga/{ => altera}/altera-freeze-bridge.c (100%)
 rename drivers/fpga/{ => altera}/altera-hps2fpga.c (100%)
 rename drivers/fpga/{ => altera}/altera-pr-ip-core-plat.c (100%)
 rename drivers/fpga/{ => altera}/altera-pr-ip-core.c (100%)
 rename drivers/fpga/{ => altera}/altera-ps-spi.c (100%)
 rename drivers/fpga/{ => altera}/socfpga-a10.c (100%)
 rename drivers/fpga/{ => altera}/socfpga.c (100%)
 rename drivers/fpga/{ => altera}/stratix10-soc.c (100%)
 rename drivers/fpga/{ => altera}/ts73xx-fpga.c (100%)
 create mode 100644 drivers/fpga/dfl/Kconfig
 create mode 100644 drivers/fpga/dfl/Makefile
 rename drivers/fpga/{ => dfl}/dfl-afu-dma-region.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-afu-error.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-afu-main.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-afu-region.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-afu.h (100%)
 rename drivers/fpga/{ => dfl}/dfl-fme-br.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-fme-error.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-fme-main.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-fme-mgr.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-fme-perf.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-fme-pr.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-fme-pr.h (100%)
 rename drivers/fpga/{ => dfl}/dfl-fme-region.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-fme.h (100%)
 rename drivers/fpga/{ => dfl}/dfl-n3000-nios.c (100%)
 rename drivers/fpga/{ => dfl}/dfl-pci.c (100%)
 rename drivers/fpga/{ => dfl}/dfl.c (100%)
 rename drivers/fpga/{ => dfl}/dfl.h (100%)
 create mode 100644 drivers/fpga/lattice/Kconfig
 create mode 100644 drivers/fpga/lattice/Makefile
 rename drivers/fpga/{ => lattice}/ice40-spi.c (100%)
 rename drivers/fpga/{ => lattice}/machxo2-spi.c (100%)
 create mode 100644 drivers/fpga/xilinx/Kconfig
 create mode 100644 drivers/fpga/xilinx/Makefile
 rename drivers/fpga/{ => xilinx}/xilinx-pr-decoupler.c (100%)
 rename drivers/fpga/{ => xilinx}/xilinx-spi.c (100%)
 rename drivers/fpga/{ => xilinx}/zynq-fpga.c (100%)
 rename drivers/fpga/{ => xilinx}/zynqmp-fpga.c (100%)

-- 
2.26.3

