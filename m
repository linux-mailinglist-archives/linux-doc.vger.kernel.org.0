Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC68758F38
	for <lists+linux-doc@lfdr.de>; Fri, 28 Jun 2019 02:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfF1AuP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jun 2019 20:50:15 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:38123 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbfF1AuP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jun 2019 20:50:15 -0400
Received: by mail-pg1-f182.google.com with SMTP id z75so1781899pgz.5
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 17:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/2sb9hYyfsw8WeSVT5nzjFqwXBw7n6CAVVqtEtqe5yo=;
        b=aq895HQtGDQ5iapby5U7B+vct0FIO+62ioQcJhQPp1IGLyVuE7K5hLrSTOgolAUgrD
         nT7p0Ejiu4WfNlZt8tq+NvmjO3yEBL5Vdh4W5riiyng/1o/zlbH2mNkqy2R0mgQnBU/T
         L7CnRXgjjmXlPAsyaaj4gp2MM03mCZFpIfsnsGELz1N0JJyZgYtRIT2wyD3Xk63WNQKN
         JVk1FdAYOct1WWqV85WJRDPM0qoylFbIZFBrVxmVRxlroM3bAwrQDqWAhJxH7Yg7BdFG
         g5udHCEQmBSVpAfUeVU0QYPVq8zU8Aq6NWV92SiUX5mhZtStLhD+e/slaRW527nS+owQ
         RPkg==
X-Gm-Message-State: APjAAAXKT4oqZy7OPbMk8G/xoCVBWlnhh7Z36RoUYGG3OnVOmayh9/z2
        g+yJGAaQT3mEG2wp1Bb7kfTC8A==
X-Google-Smtp-Source: APXvYqxgwYFE0x/C7FEGII/7g2GTw0w2jtCjz9Dt3boSx0JghIsMGG6LzP+pgOPkeurX1/r+fwbtKg==
X-Received: by 2002:a63:593:: with SMTP id 141mr5704119pgf.78.1561683014046;
        Thu, 27 Jun 2019 17:50:14 -0700 (PDT)
Received: from localhost (c-76-21-109-208.hsd1.ca.comcast.net. [76.21.109.208])
        by smtp.gmail.com with ESMTPSA id n7sm280544pff.59.2019.06.27.17.50.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 17:50:12 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     linux-fpga@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 00/15] FPGA DFL updates
Date:   Thu, 27 Jun 2019 17:49:36 -0700
Message-Id: <20190628004951.6202-1-mdf@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Greg,

can you please take the following patches. They're mostly new features
and some cleanup of the DFL internals.

They've been on the mailing list and have been reviewed.

Note: I've seen that Mauro touched Documentation/fpga/dfl.rst in linux-next
      commit c220a1fae6c5d ("docs: fpga: convert docs to ReST and rename to *.rst")
      and fixed up PATCH 05/15 to apply on top of that.

If you prefer the original series against char-misc-next let me know,
and I'll resubmit.

Thanks,

Moritz

Wu Hao (15):
  fpga: dfl-fme-mgr: fix FME_PR_INTFC_ID register address.
  fpga: dfl: fme: remove copy_to_user() in ioctl for PR
  fpga: dfl: fme: align PR buffer size per PR datawidth
  fpga: dfl: fme: support 512bit data width PR
  Documentation: fpga: dfl: add descriptions for virtualization and new
    interfaces.
  fpga: dfl: fme: add DFL_FPGA_FME_PORT_RELEASE/ASSIGN ioctl support.
  fpga: dfl: pci: enable SRIOV support.
  fpga: dfl: afu: add AFU state related sysfs interfaces
  fpga: dfl: afu: add userclock sysfs interfaces.
  fpga: dfl: add id_table for dfl private feature driver
  fpga: dfl: afu: export __port_enable/disable function.
  fpga: dfl: afu: add error reporting support.
  fpga: dfl: afu: add STP (SignalTap) support
  fpga: dfl: fme: add capability sysfs interfaces
  fpga: dfl: fme: add global error reporting support

 .../ABI/testing/sysfs-platform-dfl-fme        |  98 +++++
 .../ABI/testing/sysfs-platform-dfl-port       | 104 +++++
 Documentation/fpga/dfl.rst                    | 100 +++++
 drivers/fpga/Makefile                         |   3 +-
 drivers/fpga/dfl-afu-error.c                  | 225 ++++++++++
 drivers/fpga/dfl-afu-main.c                   | 330 ++++++++++++++-
 drivers/fpga/dfl-afu.h                        |   7 +
 drivers/fpga/dfl-fme-error.c                  | 385 ++++++++++++++++++
 drivers/fpga/dfl-fme-main.c                   | 120 +++++-
 drivers/fpga/dfl-fme-mgr.c                    | 117 +++++-
 drivers/fpga/dfl-fme-pr.c                     |  65 +--
 drivers/fpga/dfl-fme.h                        |   7 +-
 drivers/fpga/dfl-pci.c                        |  40 ++
 drivers/fpga/dfl.c                            | 169 +++++++-
 drivers/fpga/dfl.h                            |  54 ++-
 include/uapi/linux/fpga-dfl.h                 |  32 ++
 16 files changed, 1776 insertions(+), 80 deletions(-)
 create mode 100644 drivers/fpga/dfl-afu-error.c
 create mode 100644 drivers/fpga/dfl-fme-error.c

-- 
2.22.0

