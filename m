Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3FA346F7AC
	for <lists+linux-doc@lfdr.de>; Fri, 10 Dec 2021 00:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234615AbhLIXve (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Dec 2021 18:51:34 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:11246 "EHLO smtp5-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232760AbhLIXve (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 9 Dec 2021 18:51:34 -0500
Received: from localhost.localdomain (unknown [88.120.44.86])
        by smtp5-g21.free.fr (Postfix) with ESMTP id F02D85FF10;
        Fri, 10 Dec 2021 00:47:58 +0100 (CET)
From:   Yann Dirson <ydirson@free.fr>
To:     amd-gfx@lists.freedesktop.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        linux-doc@vger.kernel.org, Yann Dirson <ydirson@free.fr>
Subject: [PATCH 1/3] Documentation/gpu: split amdgpu/index for readability
Date:   Fri, 10 Dec 2021 00:47:15 +0100
Message-Id: <20211209234717.8897-2-ydirson@free.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211209234717.8897-1-ydirson@free.fr>
References: <20211209234717.8897-1-ydirson@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This starts to make the formated index much more manageable to the reader.

Signed-off-by: Yann Dirson <ydirson@free.fr>
---
 Documentation/gpu/amdgpu/driver-core.rst      |  65 ++++
 Documentation/gpu/amdgpu/driver-misc.rst      | 112 +++++++
 Documentation/gpu/amdgpu/index.rst            | 298 +-----------------
 .../gpu/amdgpu/module-parameters.rst          |   7 +
 Documentation/gpu/amdgpu/ras.rst              |  62 ++++
 Documentation/gpu/amdgpu/thermal.rst          |  65 ++++
 6 files changed, 324 insertions(+), 285 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/driver-core.rst
 create mode 100644 Documentation/gpu/amdgpu/driver-misc.rst
 create mode 100644 Documentation/gpu/amdgpu/module-parameters.rst
 create mode 100644 Documentation/gpu/amdgpu/ras.rst
 create mode 100644 Documentation/gpu/amdgpu/thermal.rst

diff --git a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/amdgpu/driver-core.rst
new file mode 100644
index 000000000000..97f9a9b68924
--- /dev/null
+++ b/Documentation/gpu/amdgpu/driver-core.rst
@@ -0,0 +1,65 @@
+============================
+ Core Driver Infrastructure
+============================
+
+.. _amdgpu_memory_domains:
+
+Memory Domains
+==============
+
+.. kernel-doc:: include/uapi/drm/amdgpu_drm.h
+   :doc: memory domains
+
+Buffer Objects
+==============
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+   :doc: amdgpu_object
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+   :internal:
+
+PRIME Buffer Sharing
+====================
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+   :doc: PRIME Buffer Sharing
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+   :internal:
+
+MMU Notifier
+============
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+   :doc: MMU Notifier
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+   :internal:
+
+AMDGPU Virtual Memory
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+   :doc: GPUVM
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+   :internal:
+
+Interrupt Handling
+==================
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+   :doc: Interrupt Handling
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+   :internal:
+
+IP Blocks
+=========
+
+.. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
+   :doc: IP Blocks
+
+.. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
+   :identifiers: amd_ip_block_type amd_ip_funcs
diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
new file mode 100644
index 000000000000..e3d6b2fa2493
--- /dev/null
+++ b/Documentation/gpu/amdgpu/driver-misc.rst
@@ -0,0 +1,112 @@
+================================
+ Misc AMDGPU driver information
+================================
+
+GPU Product Information
+=======================
+
+Information about the GPU can be obtained on certain cards
+via sysfs
+
+product_name
+------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+   :doc: product_name
+
+product_number
+--------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+   :doc: product_name
+
+serial_number
+-------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+   :doc: serial_number
+
+unique_id
+---------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: unique_id
+
+GPU Memory Usage Information
+============================
+
+Various memory accounting can be accessed via sysfs
+
+mem_info_vram_total
+-------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+   :doc: mem_info_vram_total
+
+mem_info_vram_used
+------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+   :doc: mem_info_vram_used
+
+mem_info_vis_vram_total
+-----------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+   :doc: mem_info_vis_vram_total
+
+mem_info_vis_vram_used
+----------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+   :doc: mem_info_vis_vram_used
+
+mem_info_gtt_total
+------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+   :doc: mem_info_gtt_total
+
+mem_info_gtt_used
+-----------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+   :doc: mem_info_gtt_used
+
+PCIe Accounting Information
+===========================
+
+pcie_bw
+-------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: pcie_bw
+
+pcie_replay_count
+-----------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+   :doc: pcie_replay_count
+
+GPU SmartShift Information
+==========================
+
+GPU SmartShift information via sysfs
+
+smartshift_apu_power
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: smartshift_apu_power
+
+smartshift_dgpu_power
+---------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: smartshift_dgpu_power
+
+smartshift_bias
+---------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: smartshift_bias
diff --git a/Documentation/gpu/amdgpu/index.rst b/Documentation/gpu/amdgpu/index.rst
index ff38c360b04e..c9641ace0c0b 100644
--- a/Documentation/gpu/amdgpu/index.rst
+++ b/Documentation/gpu/amdgpu/index.rst
@@ -8,76 +8,18 @@ Next (GCN) architecture.
 Module Parameters
 =================
 
-The amdgpu driver supports the following module parameters:
+.. toctree::
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+   module-parameters
 
 Core Driver Infrastructure
 ==========================
 
 This section covers core driver infrastructure.
 
-.. _amdgpu_memory_domains:
+.. toctree::
 
-Memory Domains
---------------
-
-.. kernel-doc:: include/uapi/drm/amdgpu_drm.h
-   :doc: memory domains
-
-Buffer Objects
---------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
-   :doc: amdgpu_object
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
-   :internal:
-
-PRIME Buffer Sharing
---------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
-   :doc: PRIME Buffer Sharing
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
-   :internal:
-
-MMU Notifier
-------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
-   :doc: MMU Notifier
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
-   :internal:
-
-AMDGPU Virtual Memory
----------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
-   :doc: GPUVM
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
-   :internal:
-
-Interrupt Handling
-------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
-   :doc: Interrupt Handling
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
-   :internal:
-
-IP Blocks
----------
-
-.. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
-   :doc: IP Blocks
-
-.. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
-   :identifiers: amd_ip_block_type amd_ip_funcs
+   driver-core
 
 Display Core
 ============
@@ -99,241 +41,27 @@ AMDGPU XGMI Support
 AMDGPU RAS Support
 ==================
 
-The AMDGPU RAS interfaces are exposed via sysfs (for informational queries) and
-debugfs (for error injection).
-
-RAS debugfs/sysfs Control and Error Injection Interfaces
---------------------------------------------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
-   :doc: AMDGPU RAS debugfs control interface
-
-RAS Reboot Behavior for Unrecoverable Errors
---------------------------------------------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
-   :doc: AMDGPU RAS Reboot Behavior for Unrecoverable Errors
-
-RAS Error Count sysfs Interface
--------------------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
-   :doc: AMDGPU RAS sysfs Error Count Interface
-
-RAS EEPROM debugfs Interface
-----------------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
-   :doc: AMDGPU RAS debugfs EEPROM table reset interface
-
-RAS VRAM Bad Pages sysfs Interface
-----------------------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
-   :doc: AMDGPU RAS sysfs gpu_vram_bad_pages Interface
-
-Sample Code
------------
-Sample code for testing error injection can be found here:
-https://cgit.freedesktop.org/mesa/drm/tree/tests/amdgpu/ras_tests.c
-
-This is part of the libdrm amdgpu unit tests which cover several areas of the GPU.
-There are four sets of tests:
-
-RAS Basic Test
-
-The test verifies the RAS feature enabled status and makes sure the necessary sysfs and debugfs files
-are present.
-
-RAS Query Test
-
-This test checks the RAS availability and enablement status for each supported IP block as well as
-the error counts.
-
-RAS Inject Test
-
-This test injects errors for each IP.
-
-RAS Disable Test
-
-This test tests disabling of RAS features for each IP block.
+.. toctree::
 
+   ras
 
 GPU Power/Thermal Controls and Monitoring
 =========================================
 
 This section covers hwmon and power/thermal controls.
 
-HWMON Interfaces
-----------------
+.. toctree::
 
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: hwmon
+   thermal
 
-GPU sysfs Power State Interfaces
---------------------------------
+Misc information
+================
 
-GPU power controls are exposed via sysfs files.
+This section covers miscellaneous topics not fitting in other sections.
 
-power_dpm_state
-~~~~~~~~~~~~~~~
+.. toctree::
 
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: power_dpm_state
-
-power_dpm_force_performance_level
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: power_dpm_force_performance_level
-
-pp_table
-~~~~~~~~
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: pp_table
-
-pp_od_clk_voltage
-~~~~~~~~~~~~~~~~~
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: pp_od_clk_voltage
-
-pp_dpm_*
-~~~~~~~~
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: pp_dpm_sclk pp_dpm_mclk pp_dpm_socclk pp_dpm_fclk pp_dpm_dcefclk pp_dpm_pcie
-
-pp_power_profile_mode
-~~~~~~~~~~~~~~~~~~~~~
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: pp_power_profile_mode
-
-\*_busy_percent
-~~~~~~~~~~~~~~~
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: gpu_busy_percent
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: mem_busy_percent
-
-gpu_metrics
-~~~~~~~~~~~~~~~~~~~~~
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: gpu_metrics
-
-GPU Product Information
-=======================
-
-Information about the GPU can be obtained on certain cards
-via sysfs
-
-product_name
-------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
-   :doc: product_name
-
-product_number
---------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
-   :doc: product_name
-
-serial_number
--------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
-   :doc: serial_number
-
-unique_id
----------
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: unique_id
-
-GPU Memory Usage Information
-============================
-
-Various memory accounting can be accessed via sysfs
-
-mem_info_vram_total
--------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
-   :doc: mem_info_vram_total
-
-mem_info_vram_used
-------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
-   :doc: mem_info_vram_used
-
-mem_info_vis_vram_total
------------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
-   :doc: mem_info_vis_vram_total
-
-mem_info_vis_vram_used
-----------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
-   :doc: mem_info_vis_vram_used
-
-mem_info_gtt_total
-------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
-   :doc: mem_info_gtt_total
-
-mem_info_gtt_used
------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
-   :doc: mem_info_gtt_used
-
-PCIe Accounting Information
-===========================
-
-pcie_bw
--------
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: pcie_bw
-
-pcie_replay_count
------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
-   :doc: pcie_replay_count
-
-GPU SmartShift Information
-==========================
-
-GPU SmartShift information via sysfs
-
-smartshift_apu_power
---------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: smartshift_apu_power
-
-smartshift_dgpu_power
----------------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: smartshift_dgpu_power
-
-smartshift_bias
----------------
-
-.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
-   :doc: smartshift_bias
+   driver-misc
 
 AMDGPU Glossary
 ===============
diff --git a/Documentation/gpu/amdgpu/module-parameters.rst b/Documentation/gpu/amdgpu/module-parameters.rst
new file mode 100644
index 000000000000..ea538c8dda35
--- /dev/null
+++ b/Documentation/gpu/amdgpu/module-parameters.rst
@@ -0,0 +1,7 @@
+===================
+ Module Parameters
+===================
+
+The amdgpu driver supports the following module parameters:
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
diff --git a/Documentation/gpu/amdgpu/ras.rst b/Documentation/gpu/amdgpu/ras.rst
new file mode 100644
index 000000000000..047f76e395cf
--- /dev/null
+++ b/Documentation/gpu/amdgpu/ras.rst
@@ -0,0 +1,62 @@
+====================
+ AMDGPU RAS Support
+====================
+
+The AMDGPU RAS interfaces are exposed via sysfs (for informational queries) and
+debugfs (for error injection).
+
+RAS debugfs/sysfs Control and Error Injection Interfaces
+========================================================
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+   :doc: AMDGPU RAS debugfs control interface
+
+RAS Reboot Behavior for Unrecoverable Errors
+============================================
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+   :doc: AMDGPU RAS Reboot Behavior for Unrecoverable Errors
+
+RAS Error Count sysfs Interface
+===============================
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+   :doc: AMDGPU RAS sysfs Error Count Interface
+
+RAS EEPROM debugfs Interface
+============================
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+   :doc: AMDGPU RAS debugfs EEPROM table reset interface
+
+RAS VRAM Bad Pages sysfs Interface
+==================================
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+   :doc: AMDGPU RAS sysfs gpu_vram_bad_pages Interface
+
+Sample Code
+===========
+Sample code for testing error injection can be found here:
+https://cgit.freedesktop.org/mesa/drm/tree/tests/amdgpu/ras_tests.c
+
+This is part of the libdrm amdgpu unit tests which cover several areas of the GPU.
+There are four sets of tests:
+
+RAS Basic Test
+
+The test verifies the RAS feature enabled status and makes sure the necessary sysfs and debugfs files
+are present.
+
+RAS Query Test
+
+This test checks the RAS availability and enablement status for each supported IP block as well as
+the error counts.
+
+RAS Inject Test
+
+This test injects errors for each IP.
+
+RAS Disable Test
+
+This test tests disabling of RAS features for each IP block.
diff --git a/Documentation/gpu/amdgpu/thermal.rst b/Documentation/gpu/amdgpu/thermal.rst
new file mode 100644
index 000000000000..8aeb0186c9ef
--- /dev/null
+++ b/Documentation/gpu/amdgpu/thermal.rst
@@ -0,0 +1,65 @@
+===========================================
+ GPU Power/Thermal Controls and Monitoring
+===========================================
+
+HWMON Interfaces
+================
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: hwmon
+
+GPU sysfs Power State Interfaces
+================================
+
+GPU power controls are exposed via sysfs files.
+
+power_dpm_state
+---------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: power_dpm_state
+
+power_dpm_force_performance_level
+---------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: power_dpm_force_performance_level
+
+pp_table
+--------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: pp_table
+
+pp_od_clk_voltage
+-----------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: pp_od_clk_voltage
+
+pp_dpm_*
+--------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: pp_dpm_sclk pp_dpm_mclk pp_dpm_socclk pp_dpm_fclk pp_dpm_dcefclk pp_dpm_pcie
+
+pp_power_profile_mode
+---------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: pp_power_profile_mode
+
+\*_busy_percent
+---------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: gpu_busy_percent
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: mem_busy_percent
+
+gpu_metrics
+-----------
+
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
+   :doc: gpu_metrics
-- 
2.31.1

