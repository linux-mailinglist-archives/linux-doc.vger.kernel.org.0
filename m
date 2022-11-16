Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E007362B038
	for <lists+linux-doc@lfdr.de>; Wed, 16 Nov 2022 01:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiKPArr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Nov 2022 19:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiKPArq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Nov 2022 19:47:46 -0500
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490FD2C139
        for <linux-doc@vger.kernel.org>; Tue, 15 Nov 2022 16:46:56 -0800 (PST)
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 16 Nov 2022
 08:31:43 +0800
From:   Jiucheng Xu <jiucheng.xu@amlogic.com>
To:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        John Garry <john.garry@huawei.com>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Chris Healy <cphealy@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Kelvin Zhang <kelvin.zhang@amlogic.com>,
        Jiucheng Xu <jiucheng.xu@amlogic.com>,
        Chris Healy <healych@amazon.com>
Subject: [PATCH v10 2/2] docs/perf: Add documentation for the Amlogic G12 DDR PMU
Date:   Wed, 16 Nov 2022 08:31:33 +0800
Message-ID: <20221116003133.1049346-2-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
References: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.88.11.200]
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a user guide to show how to use DDR PMU to
monitor DDR bandwidth on Amlogic G12 SoC

Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
Reviewed-by: Chris Healy <healych@amazon.com>
---
Changes v9 -> v10:
  - Rebase code
  - Add "Reviewed-by" tag

Changes v8 -> v9:
  - No change

Changes v7 -> v8:
  - No change

Changes v6 -> v7:
  - Drop the Reported-by tag
  - Fix spelling error

Changes v5 -> v6:
  - No change

Changes v4 -> v5:
  - Fix building warning

Changes v3 -> v4:
  - No change

Changes v2 -> v3:
  - Rename doc name from aml-ddr-pmu.rst to meson-ddr-pmu.rst

Changes v1 -> v2:
  - Nothing was changed
---
 Documentation/admin-guide/perf/index.rst      |  1 +
 .../admin-guide/perf/meson-ddr-pmu.rst        | 70 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 72 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/meson-ddr-pmu.rst

diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index 793e1970bc05..c767e03e4d34 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -19,3 +19,4 @@ Performance monitor support
    arm_dsu_pmu
    thunderx2-pmu
    alibaba_pmu
+   meson-ddr-pmu
diff --git a/Documentation/admin-guide/perf/meson-ddr-pmu.rst b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
new file mode 100644
index 000000000000..15e93a751ced
--- /dev/null
+++ b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================================
+Amlogic SoC DDR Bandwidth Performance Monitoring Unit (PMU)
+===========================================================
+
+There is a bandwidth monitor inside the DRAM controller. The monitor includes
+4 channels which can count the read/write request of accessing DRAM individually.
+It can be helpful to show if the performance bottleneck is on DDR bandwidth.
+
+Currently, this driver supports the following 5 Perf events:
+
++ meson_ddr_bw/total_rw_bytes/
++ meson_ddr_bw/chan_1_rw_bytes/
++ meson_ddr_bw/chan_2_rw_bytes/
++ meson_ddr_bw/chan_3_rw_bytes/
++ meson_ddr_bw/chan_4_rw_bytes/
+
+meson_ddr_bw/chan_{1,2,3,4}_rw_bytes/ events are the channel related events.
+Each channel support using keywords as filter, which can let the channel
+to monitor the individual IP module in SoC.
+
+The following keywords are the filter:
+
++ arm             - DDR access request from CPU
++ vpu_read1       - DDR access request from OSD + VPP read
++ gpu             - DDR access request from 3D GPU
++ pcie            - DDR access request from PCIe controller
++ hdcp            - DDR access request from HDCP controller
++ hevc_front      - DDR access request from HEVC codec front end
++ usb3_0          - DDR access request from USB3.0 controller
++ hevc_back       - DDR access request from HEVC codec back end
++ h265enc         - DDR access request from HEVC encoder
++ vpu_read2       - DDR access request from DI read
++ vpu_write1      - DDR access request from VDIN write
++ vpu_write2      - DDR access request from di write
++ vdec            - DDR access request from legacy codec video decoder
++ hcodec          - DDR access request from H264 encoder
++ ge2d            - DDR access request from ge2d
++ spicc1          - DDR access request from SPI controller 1
++ usb0            - DDR access request from USB2.0 controller 0
++ dma             - DDR access request from system DMA controller 1
++ arb0            - DDR access request from arb0
++ sd_emmc_b       - DDR access request from SD eMMC b controller
++ usb1            - DDR access request from USB2.0 controller 1
++ audio           - DDR access request from Audio module
++ sd_emmc_c       - DDR access request from SD eMMC c controller
++ spicc2          - DDR access request from SPI controller 2
++ ethernet        - DDR access request from Ethernet controller
+
+
+The following command is to show the total DDR bandwidth:
+
+  .. code-block:: bash
+
+      perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
+
+This command will print the total DDR bandwidth per second.
+
+The following commands are to show how to use filter parameters:
+
+  .. code-block:: bash
+
+      perf stat -a -e meson_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 sleep 10
+      perf stat -a -e meson_ddr_bw/chan_2_rw_bytes,gpu=1/ -I 1000 sleep 10
+      perf stat -a -e meson_ddr_bw/chan_3_rw_bytes,arm=1,gpu=1/ -I 1000 sleep 10
+
+The 1st command show how to use channel 1 to monitor the DDR bandwidth from ARM.
+The 2nd command show using channel 2 to get the DDR bandwidth of GPU.
+The 3rd command show using channel 3 to monitor the sum of ARM and GPU.
diff --git a/MAINTAINERS b/MAINTAINERS
index 415eaa30c523..b76c4deddf22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1098,6 +1098,7 @@ M:	Jiucheng Xu <jiucheng.xu@amlogic.com>
 L:	linux-amlogic@lists.infradead.org
 S:	Supported
 W:	http://www.amlogic.com
+F:	Documentation/admin-guide/perf/meson-ddr-pmu.rst
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
-- 
2.25.1

