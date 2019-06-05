Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4B7359F1
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2019 11:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfFEJyA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Jun 2019 05:54:00 -0400
Received: from mga07.intel.com ([134.134.136.100]:10368 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbfFEJx7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Jun 2019 05:53:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jun 2019 02:53:59 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2019 02:53:57 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-doc@vger.kernel.org, jani.nikula@intel.com
Subject: [PATCH 2/2] drm/i915: fix documentation build warnings
Date:   Wed,  5 Jun 2019 12:56:57 +0300
Message-Id: <20190605095657.23601-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190605095657.23601-1-jani.nikula@intel.com>
References: <20190605095657.23601-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just a straightforward bag of fixes for a clean htmldocs build.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/i915.rst              | 6 ------
 drivers/gpu/drm/i915/i915_reg.h         | 2 +-
 drivers/gpu/drm/i915/i915_vma.h         | 2 ++
 drivers/gpu/drm/i915/intel_guc_fwif.h   | 2 ++
 drivers/gpu/drm/i915/intel_runtime_pm.c | 2 --
 5 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index f98ee95da90f..300220c4b498 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -475,12 +475,6 @@ i915_context_create and i915_context_free
 .. kernel-doc:: drivers/gpu/drm/i915/i915_trace.h
    :doc: i915_context_create and i915_context_free tracepoints
 
-switch_mm
----------
-
-.. kernel-doc:: drivers/gpu/drm/i915/i915_trace.h
-   :doc: switch_mm tracepoint
-
 Perf
 ====
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 07e3f861a92e..b7c13d5deb15 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -153,7 +153,7 @@
  * REG_FIELD_PREP() - Prepare a u32 bitfield value
  * @__mask: shifted mask defining the field's length and position
  * @__val: value to put in the field
-
+ *
  * Local copy of FIELD_PREP() to generate an integer constant expression, force
  * u32 and for consistency with REG_FIELD_GET(), REG_BIT() and REG_GENMASK().
  *
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 2657c99fe187..bc15083bd479 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -40,6 +40,8 @@
 enum i915_cache_level;
 
 /**
+ * DOC: Virtual Memory Address
+ *
  * A VMA represents a GEM BO that is bound into an address space. Therefore, a
  * VMA's presence cannot be guaranteed before binding, or after unbinding the
  * object into/from the address space.
diff --git a/drivers/gpu/drm/i915/intel_guc_fwif.h b/drivers/gpu/drm/i915/intel_guc_fwif.h
index 3d1de288d96c..f55f3bc8524d 100644
--- a/drivers/gpu/drm/i915/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/intel_guc_fwif.h
@@ -500,6 +500,8 @@ enum guc_log_buffer_type {
 };
 
 /**
+ * struct guc_log_buffer_state - GuC log buffer state
+ *
  * Below state structure is used for coordination of retrieval of GuC firmware
  * logs. Separate state is maintained for each log buffer type.
  * read_ptr points to the location where i915 read last in log buffer and
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 3bdeea596ad5..af3c1ada1b2e 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -391,8 +391,6 @@ static intel_wakeref_t __intel_runtime_pm_get(struct drm_i915_private *i915,
  * asynchronous PM management from display code) and ensures that it is powered
  * up. Raw references are not considered during wakelock assert checks.
  *
- * Returns:
- * True when the power domain is enabled, false otherwise.
  * Any runtime pm reference obtained by this function must have a symmetric
  * call to intel_runtime_pm_put_raw() to release the reference again.
  *
-- 
2.20.1

