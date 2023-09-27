Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C397AFFFB
	for <lists+linux-doc@lfdr.de>; Wed, 27 Sep 2023 11:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjI0J1e (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Sep 2023 05:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbjI0J10 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 05:27:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B599ECDE;
        Wed, 27 Sep 2023 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695806844; x=1727342844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BzIFo49aq6U0+R7YpWgvvjZ08XUE358oQhR1J9koMlI=;
  b=AgOKwzV4jeh8bf9UiMZfB0y+TAbHB4Hcn9kb5ov61smZY/LRKGdwej6a
   QsQBWd3efSXp+aYztBvN5bcqqZHRfZiyteDFFihAqJLHNeq3EZvBsc0ox
   ipKKc42p5AI+vuYf5+aFhOcYCGiA75kRVvrBT6JWZ/y9gpNEXc6340BEv
   yHD2YL+eQdWzcN2J19N1X4DvSIhTdOG6Jx1fOEu0JdIwx9uLUt4ijq7pn
   I8to/Y1C/VjZP9xziXfOGmL4CvbL7nTqGN54t+93rVIWcs5kQHBhksVax
   B/4qsRd862Tdfj1NeRfoZWWHm3iBjvhAH74h8ciUYaZmYTmuBqdwXcKlP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412692329"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="412692329"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 02:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778479243"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="778479243"
Received: from amlin-018-114.igk.intel.com ([10.102.18.114])
  by orsmga008.jf.intel.com with ESMTP; 27 Sep 2023 02:27:13 -0700
From:   Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
To:     netdev@vger.kernel.org
Cc:     vadim.fedorenko@linux.dev, jiri@resnulli.us, corbet@lwn.net,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Subject: [PATCH net-next 1/4] dpll: docs: add support for pin signal phase offset/adjust
Date:   Wed, 27 Sep 2023 11:24:32 +0200
Message-Id: <20230927092435.1565336-2-arkadiusz.kubalewski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230927092435.1565336-1-arkadiusz.kubalewski@intel.com>
References: <20230927092435.1565336-1-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add dpll documentation on new pin's attributes:
- phase-offset - measured difference between phase of signals on pin
  and dpll
- phase-adjust - adjustable value of pin's signal phase
- phase-adjust-min / phase-adjust-max - values for determining limits
  for phase-adjust

Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
---
 Documentation/driver-api/dpll.rst | 53 ++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-api/dpll.rst
index bb52f1b8c0be..59634a3513bd 100644
--- a/Documentation/driver-api/dpll.rst
+++ b/Documentation/driver-api/dpll.rst
@@ -173,6 +173,47 @@ in order to configure active input of a MUX-type pin, the user needs to
 request desired pin state of the child pin on the parent pin,
 as described in the ``MUX-type pins`` chapter.
 
+Phase offset measurement and adjustment
+========================================
+
+Device may provide ability to measure a phase difference between signals
+on a pin and its parent dpll device. If pin-dpll phase offset measurement
+is supported, it shall be provided with ``DPLL_A_PIN_PHASE_OFFSET``
+attribute for each parent dpll device.
+
+Device may also provide ability to adjust a signal phase on a pin.
+If pin phase adjustment is supported, minimal and maximal values that pin
+handle shall be provide to the user on ``DPLL_CMD_PIN_GET`` respond
+with ``DPLL_A_PIN_PHASE_ADJUST_MIN`` and ``DPLL_A_PIN_PHASE_ADJUST_MAX``
+attributes. Configured phase adjust value is provided with
+``DPLL_A_PIN_PHASE_ADJUST`` attribute of a pin, and value change can be
+requested with the same attribute with ``DPLL_CMD_PIN_SET`` command.
+
+  =============================== ======================================
+  ``DPLL_A_PIN_ID``               configured pin id
+  ``DPLL_A_PIN_PHASE_ADJUST_MIN`` attr minimum value of phase adjustment
+  ``DPLL_A_PIN_PHASE_ADJUST_MAX`` attr maximum value of phase adjustment
+  ``DPLL_A_PIN_PHASE_ADJUST``     attr configured value of phase
+                                  adjustment on parent dpll device
+  ``DPLL_A_PIN_PARENT_DEVICE``    nested attribute for requesting
+                                  configuration on given parent dpll
+                                  device
+    ``DPLL_A_PIN_PARENT_ID``      parent dpll device id
+    ``DPLL_A_PIN_PHASE_OFFSET``   attr measured phase difference
+                                  between a pin and parent dpll device
+  =============================== ======================================
+
+All phase related values are provided in pico seconds, which represents
+time differnece between signals phase. The negative value means that
+phase of signal on pin is earlier in time than dpll's signal. Positive
+value means that phase of signal on pin is later in time than signal of
+a dpll.
+
+Phase adjust (also min and max) values are integers, but measured phase
+offset values are fractional with 3-digit decimal places and shell be
+divided with ``DPLL_PIN_PHASE_OFFSET_DIVIDER`` to get integer part and
+modulo divided to get fractional part.
+
 Configuration commands group
 ============================
 
@@ -263,6 +304,12 @@ according to attribute purpose.
                                        frequencies
       ``DPLL_A_PIN_ANY_FREQUENCY_MIN`` attr minimum value of frequency
       ``DPLL_A_PIN_ANY_FREQUENCY_MAX`` attr maximum value of frequency
+    ``DPLL_A_PIN_PHASE_ADJUST_MIN``    attr minimum value of phase
+                                       adjustment
+    ``DPLL_A_PIN_PHASE_ADJUST_MAX``    attr maximum value of phase
+                                       adjustment
+    ``DPLL_A_PIN_PHASE_ADJUST``        attr configured value of phase
+                                       adjustment on parent device
     ``DPLL_A_PIN_PARENT_DEVICE``       nested attr for each parent device
                                        the pin is connected with
       ``DPLL_A_PIN_PARENT_ID``         attr parent dpll device id
@@ -270,8 +317,10 @@ according to attribute purpose.
                                        dpll device
       ``DPLL_A_PIN_STATE``             attr state of pin on the parent
                                        dpll device
-     ``DPLL_A_PIN_DIRECTION``          attr direction of a pin on the
+      ``DPLL_A_PIN_DIRECTION``         attr direction of a pin on the
                                        parent dpll device
+      ``DPLL_A_PIN_PHASE_OFFSET``      attr measured phase difference
+                                       between a pin and parent dpll
     ``DPLL_A_PIN_PARENT_PIN``          nested attr for each parent pin
                                        the pin is connected with
       ``DPLL_A_PIN_PARENT_ID``         attr parent pin id
@@ -284,6 +333,8 @@ according to attribute purpose.
   ``DPLL_CMD_PIN_SET``                 command to set pins configuration
     ``DPLL_A_PIN_ID``                  attr unique a pin ID
     ``DPLL_A_PIN_FREQUENCY``           attr requested frequency of a pin
+    ``DPLL_A_PIN_PHASE_ADJUST``        attr requested value of phase
+                                       adjustment on parent device
     ``DPLL_A_PIN_PARENT_DEVICE``       nested attr for each parent dpll
                                        device configuration request
       ``DPLL_A_PIN_PARENT_ID``         attr parent dpll device id
-- 
2.38.1

